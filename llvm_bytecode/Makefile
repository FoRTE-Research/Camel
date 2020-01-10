outputs = camel_cuckoo.bc camel_cuckoo.ll camel_cuckoo_mod.bc
VPATH = ../example

GCC_DIR =  /home/saim/ti/msp430-gcc
LLVM_DIR = /home/saim/Desktop/llvm-project/build
CAMEL = ../llvm_pass/camel/camel.so

CLANG = $(LLVM_DIR)/bin/clang
DIS = $(LLVM_DIR)/bin/llvm-dis
OPT = $(LLVM_DIR)/bin/opt

GCC_BIN =  $(GCC_DIR)/bin
GCC_INCLUDE = $(GCC_DIR)/include
ELF_INCLUDE = $(GCC_DIR)/msp430-elf/include
LIB_INCLUDE = $(GCC_DIR)/lib/gcc/msp430-elf/8.3.0/include

DEVICE  = __MSP430FR6989__
CRC = CRC_ON
MODE = ALL

override CFLAGS += \
	--target=msp430 \
	-D$(DEVICE) \
	-nobuiltininc \
	-nostdinc++ \
	-isysroot /none \
	-O0 \
	-g \
	-std=c99 \
	-Wall \
	-MD \
	-I $(GCC_BIN) \
	-I $(GCC_INCLUDE) \
	-I $(ELF_INCLUDE) \
	-I $(LIB_INCLUDE) \

all: $(outputs)

camel_cuckoo.bc : camel_cuckoo.c ../checkpoint/camel_helpers.S
	$(CLANG) -emit-llvm -c -fheinous-gnu-extensions $(CFLAGS) -D$(CRC) -D$(MODE) $< -o $@
	$(RM) camel_cuckoo.d
	
camel_cuckoo.ll : camel_cuckoo.bc
	$(DIS) $< -o $@

camel_cuckoo_mod.bc: camel_cuckoo.bc
	cd ../llvm_pass && cmake . && make && cd ../llvm_bytecode
	$(OPT) -load $(CAMEL) --CamelPass $< > $@

	
clean:
	$(RM) *.bc *.ll





