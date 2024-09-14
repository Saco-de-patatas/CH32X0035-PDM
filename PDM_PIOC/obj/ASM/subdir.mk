################################################################################
# MRS Version: 1.9.2
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_UPPER_SRCS += \
../ASM/PIOC_INC.ASM 

ASM_SRCS += \
../ASM/PDM_EMCU.asm 

C_SRCS += \
../ASM/PDM_EMCU.c 

ASM_UPPER_DEPS += \
./ASM/PIOC_INC.d 

OBJS += \
./ASM/PDM_EMCU.o \
./ASM/PIOC_INC.o 

ASM_DEPS += \
./ASM/PDM_EMCU.d 

C_DEPS += \
./ASM/PDM_EMCU.d 


# Each subdirectory must supply rules for building sources it contributes
ASM/%.o: ../ASM/%.asm
	@	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -x assembler-with-cpp -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
ASM/%.o: ../ASM/%.c
	@	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
ASM/%.o: ../ASM/%.ASM
	@	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -x assembler-with-cpp -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Startup" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

