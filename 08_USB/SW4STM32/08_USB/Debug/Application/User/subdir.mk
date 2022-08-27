################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/main.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/stm32f4xx_hal_msp.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/stm32f4xx_it.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usb_device.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usbd_cdc_if.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usbd_conf.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usbd_desc.c 

OBJS += \
./Application/User/main.o \
./Application/User/stm32f4xx_hal_msp.o \
./Application/User/stm32f4xx_it.o \
./Application/User/usb_device.o \
./Application/User/usbd_cdc_if.o \
./Application/User/usbd_conf.o \
./Application/User/usbd_desc.o 

C_DEPS += \
./Application/User/main.d \
./Application/User/stm32f4xx_hal_msp.d \
./Application/User/stm32f4xx_it.d \
./Application/User/usb_device.d \
./Application/User/usbd_cdc_if.d \
./Application/User/usbd_conf.d \
./Application/User/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/main.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/main.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_msp.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/stm32f4xx_hal_msp.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_msp.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_it.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/stm32f4xx_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_it.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usb_device.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usb_device.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/usb_device.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usbd_cdc_if.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usbd_cdc_if.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/usbd_cdc_if.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usbd_conf.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usbd_conf.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/usbd_conf.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usbd_desc.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/08_USB/Src/usbd_desc.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/08_USB/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/usbd_desc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


