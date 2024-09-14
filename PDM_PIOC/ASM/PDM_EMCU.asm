INCLUDE				PIOC_INC.ASM

DATA_SWITCHER	equ SFR_CTRL_RD

DATA0_DELTA_L	equ SFR_DATA_REG0
DATA0_DELTA_M	equ	SFR_DATA_REG1
DATA0_DELTA_H	equ SFR_DATA_REG2

DATA1_DELTA_L	equ SFR_DATA_REG4
DATA1_DELTA_M	equ SFR_DATA_REG5
DATA1_DELTA_H	equ SFR_DATA_REG6

ACC_SIGMA_L		equ SFR_DATA_REG8
ACC_SIGMA_M		equ SFR_DATA_REG9
ACC_SIGMA_H		equ SFR_DATA_REG10

ACC_ROLLER_L	equ SFR_DATA_REG12
ACC_ROLLER_M	equ	SFR_DATA_REG13
ACC_ROLLER_H	equ SFR_DATA_REG14

STEP_COUNT_L	equ	SFR_DATA_REG16
STEP_COUNT_H	equ SFR_DATA_REG17

				org 0x0000
				DW 0x0000
				jmp Init
				DW    0X0FFF
				
Init:
		clr 	DATA_SWITCHER
		clr		DATA0_DELTA_L
		clr		DATA0_DELTA_M
		clr		DATA0_DELTA_H
		clr		DATA1_DELTA_L
		clr		DATA1_DELTA_M
		clr		DATA1_DELTA_H
		clr		ACC_SIGMA_L	
		clr		ACC_SIGMA_M	
		clr		ACC_SIGMA_H
		clr		STEP_COUNT_L
		clr		STEP_COUNT_H
		mova1f	0B00000001				; Set SFR_PORT_DIR -> SB_PORT_DIR0 as Output, IO0 PULL-UP disabled(i guess that means push-pull enabled).
		bs		SFR_SYS_CFG, SB_INT_REQ	; Request an interrupt to host for DATA1 Update.

LOOP_DATA0:
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
ENTER_DATA0:
		mov		DATA0_DELTA_L, A		;Add DATA0_DELTA TO ACC_SIGMA in 10 cycles.
		add		ACC_SIGMA_L, F
		mov		DATA0_DELTA_M, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz	DATA0_DELTA_M, A
		add		ACC_SIGMA_M, F
		mov		DATA0_DELTA_H, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz	DATA0_DELTA_H, A
		add		ACC_SIGMA_H, F
		
		mov 	ACC_SIGMA_L, A			;Add ACC_SIGMA to ACC_ROLLER in 10 cycles.
		add  	ACC_ROLLER_L, F	
		mov 	ACC_SIGMA_M, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz	ACC_SIGMA_M, A	
		add  	ACC_ROLLER_M, F
		mov		ACC_SIGMA_H, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz 	ACC_SIGMA_H, A
		add  	ACC_ROLLER_H, F			; Here Carry holds the output bit (bit 24 of the roller).

										; Copying C to the output, 2 cycles.
		bg2f	BIO_FLAG_C, 0			; Put C to somewhere;
		bp2f	BO_PORT_OUT0, 0			; Get C from somewere and put it to OUT0.

		incsz	STEP_COUNT_L, F			; Increment 12 bits step counter, 3 cycles
		dec		STEP_COUNT_H, F
		inc		STEP_COUNT_H, F		

		btss	STEP_COUNT_H, 4			; Test if STEP_COUNT(12) is high, then goto next step.
		jmp		LOOP_DATA0				; 3 cycles
		bc		STEP_COUNT_H, 4			; Reset counter
		clr		DATA0_DELTA_L			; Clear DATA0_DELTA to prevent duplicate run.
		clr		DATA0_DELTA_M
		clr		DATA0_DELTA_H
		bs		DATA_SWITCHER, 0		; Indicate next processing of DATA1.
		bs		SFR_SYS_CFG, SB_INT_REQ	; Request an interrupt to host for DATA0 Update.
		jmp	ENTER_DATA1

LOOP_DATA1:
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP	
		NOP
ENTER_DATA1:
		mov 	DATA1_DELTA_L, A		;Add DATA1_DELTA TO ACC_SIGMA in 10 cycles.
		add  	ACC_SIGMA_L, F
		mov 	DATA1_DELTA_M, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz	DATA1_DELTA_M, A
		add  	ACC_SIGMA_M, F
		mov 	DATA1_DELTA_H, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz	DATA1_DELTA_H, A
		add  	ACC_SIGMA_H, F
		
		mov 	ACC_SIGMA_L, A			;Add ACC_SIGMA to ACC_ROLLER in 10 cycles.
		add  	ACC_ROLLER_L, F	
		mov 	ACC_SIGMA_M, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz	ACC_SIGMA_M, A	
		add  	ACC_ROLLER_M, F
		mov 	ACC_SIGMA_H, A
		btsc	SFR_STATUS_REG, SB_FLAG_C
		incsz 	ACC_SIGMA_H, A
		add  	ACC_ROLLER_H, F 		; Here Carry holds the output bit (bit 24 of the roller).

										; Copying C to the output, 2 cycles.
		bg2f	BIO_FLAG_C, 0			; Put C to somewhere;
		bp2f	BO_PORT_OUT0, 0			; Get C from somewere and put it to OUT0.

		incsz	STEP_COUNT_L, F			; Increment 12 bits step counter, 3 cycles
		dec 	STEP_COUNT_H, F
		inc 	STEP_COUNT_H, F		

		btss	STEP_COUNT_H, 4			; Test if STEP_COUNT(12) is high, then goto next step.
		jmp 	LOOP_DATA1				; 3 cycles
		bc 		STEP_COUNT_H, 4			; Reset counter
		clr 	DATA1_DELTA_L			; Clear DATA0_DELTA to prevent duplicate run.
		clr 	DATA1_DELTA_M
		clr 	DATA1_DELTA_H
		bc 		DATA_SWITCHER, 0		; Indicate next processing of DATA0.
		bs 		SFR_SYS_CFG, SB_INT_REQ	; Request an interrupt to host for DATA1 Update.
		jmp 	ENTER_DATA0

		
	end