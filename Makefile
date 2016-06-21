ARMGNU = arm-none-eabi

COPS = -nostdlib -nostartfiles -ffreestanding  -lm -specs=nosys.specs
CPU  = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
COPT = -Os

SRC_DIR = src
STM32_DIR = STM32
CMSIS_DIR = CMSIS
OBJ_DIR = obj
BUILD_DIR = build
BIN_DIR = $(BUILD_DIR)/bin
LIST_DIR = $(BUILD_DIR)/list

all: $(BIN_DIR)/firmware.bin

$(OBJ_DIR)/startup_stm32f4xx.o: $(STM32_DIR)/startup_stm32f4xx.s
	mkdir $(OBJ_DIR)
	$(ARMGNU)-as $(STM32_DIR)/startup_stm32f4xx.s -o $(OBJ_DIR)/startup_stm32f4xx.o

$(OBJ_DIR)/main.o: $(SRC_DIR)/main.c
	$(ARMGNU)-gcc $(COPS) $(CPU) $(COPT) -I$(CMSIS_DIR)/ -I$(STM32_DIR)/ -c $(SRC_DIR)/main.c -o $(OBJ_DIR)/main.o

$(BIN_DIR)/firmware.bin: $(STM32_DIR)/linker.ld $(OBJ_DIR)/startup_stm32f4xx.o $(OBJ_DIR)/main.o
	mkdir $(BUILD_DIR) $(BIN_DIR) $(LIST_DIR)
	$(ARMGNU)-gcc $(COPS) $(CPU) -o $(BIN_DIR)/firmware.elf -T $(STM32_DIR)/linker.ld $(OBJ_DIR)/startup_stm32f4xx.o $(OBJ_DIR)/main.o
	$(ARMGNU)-objdump -D $(BIN_DIR)/firmware.elf > $(LIST_DIR)/firmware.list
	$(ARMGNU)-objcopy $(BIN_DIR)/firmware.elf $(BIN_DIR)/firmware.bin -O binary

clean:
	rm -f $(OBJ_DIR)/*.o $(BIN_DIR)/*.elf $(LIST_DIR)/*.list $(BIN_DIR)/*.bin
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(LIST_DIR) $(OBJ_DIR)