################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/User/Fonts.c \
../Application/User/SSD1331.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/07_SPI_OLED/Src/main.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/07_SPI_OLED/Src/stm32f4xx_hal_msp.c \
D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/07_SPI_OLED/Src/stm32f4xx_it.c 

OBJS += \
./Application/User/Fonts.o \
./Application/User/SSD1331.o \
./Application/User/main.o \
./Application/User/stm32f4xx_hal_msp.o \
./Application/User/stm32f4xx_it.o 

C_DEPS += \
./Application/User/Fonts.d \
./Application/User/SSD1331.d \
./Application/User/main.d \
./Application/User/stm32f4xx_hal_msp.d \
./Application/User/stm32f4xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/%.o: ../Application/User/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak=__attribute__((weak)) -D__packed=__attribute__((__packed__)) -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/main.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/07_SPI_OLED/Src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak=__attribute__((weak)) -D__packed=__attribute__((__packed__)) -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/main.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_msp.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/07_SPI_OLED/Src/stm32f4xx_hal_msp.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak=__attribute__((weak)) -D__packed=__attribute__((__packed__)) -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_msp.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_it.o: D:/OneDrive/Programowanie/Kurs\ STM32F4/Programy/07_SPI_OLED/Src/stm32f4xx_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak=__attribute__((weak)) -D__packed=__attribute__((__packed__)) -DUSE_HAL_DRIVER -DSTM32F411xE -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Drivers/CMSIS/Include" -I"D:/OneDrive/Programowanie/Kurs STM32F4/Programy/07_SPI_OLED/Inc"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_it.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


