base = basic_math
outputs = $(base)_all.out $(base)_reads.out $(base)_idempotent.out

GCC_DIR =  /home/harrison/ti/msp430-gcc/bin
SUPPORT_FILE_DIRECTORY = /home/harrison/ti/msp430-gcc/include
DEVICE  = msp430fr6989

CC      = $(GCC_DIR)/msp430-elf-gcc

CFLAGS = -I $(SUPPORT_FILE_DIRECTORY) -mmcu=$(DEVICE) -Wall -g -fdata-sections -ffunction-sections -T ../ld/$(DEVICE).ld ../checkpoint/camel_helpers.S
LFLAGS = -L $(SUPPORT_FILE_DIRECTORY)

all: $(outputs)

$(base)_all.out: $(base).c ../checkpoint/camel_helpers.S
	$(CC) $(CFLAGS) $(LFLAGS) -DALL $< -o $@

$(base)_reads.out: $(base).c ../checkpoint/camel_helpers.S
	$(CC) $(CFLAGS) $(LFLAGS) -DREADS $< -o $@

$(base)_idempotent.out: $(base).c ../checkpoint/camel_helpers.S
	$(CC) $(CFLAGS) $(LFLAGS) -DIDEM $< -o $@

clean:
	$(RM) *.out
