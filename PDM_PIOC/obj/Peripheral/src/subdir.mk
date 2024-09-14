################################################################################
# MRS Version: 1.9.2
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_adc.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_awu.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_dbgmcu.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_dma.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_exti.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_flash.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_gpio.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_i2c.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_iwdg.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_misc.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_opa.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_pwr.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_rcc.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_spi.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_tim.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_usart.c \
D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_wwdg.c 

OBJS += \
./Peripheral/src/ch32x035_adc.o \
./Peripheral/src/ch32x035_awu.o \
./Peripheral/src/ch32x035_dbgmcu.o \
./Peripheral/src/ch32x035_dma.o \
./Peripheral/src/ch32x035_exti.o \
./Peripheral/src/ch32x035_flash.o \
./Peripheral/src/ch32x035_gpio.o \
./Peripheral/src/ch32x035_i2c.o \
./Peripheral/src/ch32x035_iwdg.o \
./Peripheral/src/ch32x035_misc.o \
./Peripheral/src/ch32x035_opa.o \
./Peripheral/src/ch32x035_pwr.o \
./Peripheral/src/ch32x035_rcc.o \
./Peripheral/src/ch32x035_spi.o \
./Peripheral/src/ch32x035_tim.o \
./Peripheral/src/ch32x035_usart.o \
./Peripheral/src/ch32x035_wwdg.o 

C_DEPS += \
./Peripheral/src/ch32x035_adc.d \
./Peripheral/src/ch32x035_awu.d \
./Peripheral/src/ch32x035_dbgmcu.d \
./Peripheral/src/ch32x035_dma.d \
./Peripheral/src/ch32x035_exti.d \
./Peripheral/src/ch32x035_flash.d \
./Peripheral/src/ch32x035_gpio.d \
./Peripheral/src/ch32x035_i2c.d \
./Peripheral/src/ch32x035_iwdg.d \
./Peripheral/src/ch32x035_misc.d \
./Peripheral/src/ch32x035_opa.d \
./Peripheral/src/ch32x035_pwr.d \
./Peripheral/src/ch32x035_rcc.d \
./Peripheral/src/ch32x035_spi.d \
./Peripheral/src/ch32x035_tim.d \
./Peripheral/src/ch32x035_usart.d \
./Peripheral/src/ch32x035_wwdg.d 


# Each subdirectory must supply rules for building sources it contributes
Peripheral/src/ch32x035_adc.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_adc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_awu.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_awu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_dbgmcu.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_dbgmcu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_dma.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_dma.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_exti.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_exti.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_flash.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_flash.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_gpio.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_i2c.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_iwdg.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_iwdg.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_misc.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_misc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_opa.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_opa.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_pwr.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_pwr.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_rcc.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_rcc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_spi.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_tim.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_tim.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_usart.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_usart.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@
Peripheral/src/ch32x035_wwdg.o: D:/Usuarios/Mario/Documents/RISC-V/CH32X035/CH32X035EVT/EVT/EXAM/SRC/Peripheral/src/ch32x035_wwdg.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized  -g -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Debug" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Core" -I"C:\MRS_DATA\workspace\PDM_PIOC\User" -I"D:\Usuarios\Mario\Documents\RISC-V\CH32X035\CH32X035EVT\EVT\EXAM\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@

