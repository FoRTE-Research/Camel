outputs = camel_cuckoo_all.out camel_cuckoo_reads.out camel_cuckoo_idempotent.out camel_cuckoo_none.out

GCC_DIR =  /home/harrison/ti/msp430-gcc/bin
SUPPORT_FILE_DIRECTORY = /home/harrison/ti/msp430-gcc/include
DEVICE  = msp430fr6989

CC      = $(GCC_DIR)/msp430-elf-gcc

CFLAGS = -I $(SUPPORT_FILE_DIRECTORY) -mmcu=$(DEVICE) -Wall -g -fdata-sections -ffunction-sections -T ../ld/$(DEVICE).ld ../checkpoint/camel_helpers.S
LFLAGS = -L $(SUPPORT_FILE_DIRECTORY)

all: $(outputs)

camel_cuckoo_all.out: camel_cuckoo.c ../checkpoint/camel_helpers.S
	$(CC) $(CFLAGS) $(LFLAGS) -DALL -DCRC_ON $< -o $@

camel_cuckoo_reads.out: camel_cuckoo.c ../checkpoint/camel_helpers.S
	$(CC) $(CFLAGS) $(LFLAGS) -DREADS -DCRC_ON $< -o $@

camel_cuckoo_idempotent.out: camel_cuckoo.c ../checkpoint/camel_helpers.S
	$(CC) $(CFLAGS) $(LFLAGS) -DIDEM -DCRC_ON $< -o $@

camel_cuckoo_none.out: camel_cuckoo.c ../checkpoint/camel_helpers.S
	$(CC) $(CFLAGS) $(LFLAGS) -DNONE -DCRC_ON $< -o $@

clean:
	$(RM) *.out
