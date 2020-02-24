outputs = camel_cuckoo.bc camel_cuckoo.ll camel_cuckoo_mod.bc camel_cuckoo_mod.ll camel_cuckoo_mod.s camel_cuckoo.s camel_cuckoo.out
VPATH = ../example

GCC_DIR =  /home/saim/ti/msp430-gcc
LLVM_DIR = /home/saim/Desktop/llvm-project/build
CAMEL = ../llvm_pass/camel/camel.so

GCC_BIN =  $(GCC_DIR)/bin
GCC_INCLUDE = $(GCC_DIR)/include
ELF_INCLUDE = $(GCC_DIR)/msp430-elf/include
LIB_INCLUDE = $(GCC_DIR)/lib/gcc/msp430-elf/8.3.0/include

CLANG = $(LLVM_DIR)/bin/clang
DIS = $(LLVM_DIR)/bin/llvm-dis
OPT = $(LLVM_DIR)/bin/opt
LLC = $(LLVM_DIR)/bin/llc
GCC = $(GCC_BIN)/msp430-elf-gcc

DEVICE  = __MSP430FR6989__
CRC = CRC_ON
MODE = ALL

override CFLAGS += \
	--target=msp430 \
	-D$(DEVICE) \
	-nobuiltininc \
	-nostdinc++ \
	-isysroot /none \
	-O0	 \
	-g \
	-std=c99 \
	-Wall \
	-MD \
	-I $(GCC_BIN) \
	-I $(GCC_INCLUDE) \
	-I $(ELF_INCLUDE) \
	-I $(LIB_INCLUDE) \

override LLCFLAGS += \
	-march=msp430 \
	-mcpu=msp430x \

all: $(outputs)


#our pipeline: C code (CLANG)-> LLVM IR (OPT)-> LLVM IR Mod (LLC)-> Assembly code (MSP430-GCC) -> executable
#some auxilary steps: LLVM IR .bc (LLVM-DIS)-> LLVM readable code .ll
#some auxilary steps: LLVM IR .bc (LLC)-> Assembly .s 

camel_cuckoo.bc : camel_cuckoo.c ../checkpoint/camel_helpers.S
	$(CLANG) -emit-llvm -c -fheinous-gnu-extensions $(CFLAGS) -D$(CRC) -D$(MODE) $< -o $@
	$(RM) camel_cuckoo.d
	
camel_cuckoo.ll : camel_cuckoo.bc
	$(DIS) $< -o $@

camel_cuckoo.s : camel_cuckoo.bc
	$(LLC) $< -o $@

camel_cuckoo_mod.bc: camel_cuckoo.bc
	cd ../llvm_pass && cmake . && make && cd ../llvm_bytecode
	$(OPT) -load $(CAMEL) --CamelPass $< > $@

camel_cuckoo_mod.ll : camel_cuckoo_mod.bc
	$(DIS) $< -o $@

camel_cuckoo_mod.s : camel_cuckoo_mod.bc
	$(LLC) $(LLCFLAGS) $< -o $@

camel_cuckoo.out : camel_cuckoo_mod.s
	$(GCC_BIN)/msp430-elf-gcc -I $(GCC_INCLUDE) -mmcu=msp430fr6989 -Wall -g -fdata-sections -ffunction-sections -T ../ld/msp430fr6989.ld ../checkpoint/camel_helpers.S -L $(GCC_INCLUDE) $< -o $@

clean:
	$(RM) *.bc *.ll *.s *.out
