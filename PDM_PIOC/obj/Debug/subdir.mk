################################################################################
# MRS Version: 1.9.2
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Debug/debug.c 

OBJS += \
./Debug/debug.o 

C_DEPS += \
./Debug/debug.d 


# Each subdirectory must supply rules for building sources it contributes
Debug/debug.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Debug/debug.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@

