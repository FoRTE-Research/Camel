#Usage: make crc= mode= board=

# Benchmarks
override outputs += camel_ar.bc camel_ar.ll camel_ar.s \
	camel_ar_mod.bc camel_ar_mod.ll camel_ar_mod.s camel_ar.out \
	camel_ar_opt.bc camel_ar_opt.ll camel_ar_opt.s camel_ar_opt.out

override outputs += camel_bc.bc camel_bc.ll camel_bc.s\
	camel_bc_mod.bc camel_bc_mod.ll camel_bc_mod.s camel_bc.out\
	camel_bc_opt.bc camel_bc_opt.ll camel_bc_opt.s camel_bc_opt.out

override outputs += camel_cem.bc camel_cem.ll camel_cem.s \
	camel_cem_mod.bc camel_cem_mod.ll camel_cem_mod.s camel_cem.out \
	camel_cem_opt.bc camel_cem_opt.ll camel_cem_opt.s camel_cem_opt.out

override outputs += camel_cuckoo.bc camel_cuckoo.ll camel_cuckoo.s \
	camel_cuckoo_mod.bc camel_cuckoo_mod.ll camel_cuckoo_mod.s camel_cuckoo.out \
	camel_cuckoo_opt.bc camel_cuckoo_opt.ll camel_cuckoo_opt.s camel_cuckoo_opt.out

override outputs += camel_rsa.bc camel_rsa.ll camel_rsa.s \
	camel_rsa_mod.s camel_rsa_mod.bc camel_rsa_mod.ll camel_rsa.out \
	camel_rsa_opt.bc camel_rsa_opt.ll camel_rsa_opt.s camel_rsa_opt.out


#Path to benchmarks source code
VPATH = ../benchmarks

#Include files and aliases
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

#Can take values: __MSP430FR6989__, __MSP430F5529__
DEVICE  = $(board)

#Can take values: CRC_ON, CRC_OFF
CRC = $(crc)

#Can take value: NONE, ALL, IDEM
MODE = $(mode)

override BFLAGS += \
	--target=msp430 \
	-D$(DEVICE) \
	-nobuiltininc \
	-nostdinc++ \
	-isysroot /none \
	-g \
	-std=c99 \
	-Wall \
	-MD \
	-I ../checkpoint \
	-I $(GCC_BIN) \
	-I $(GCC_INCLUDE) \
	-I $(ELF_INCLUDE) \
	-I $(LIB_INCLUDE) \

override CFLAGS += \
	-D$(DEVICE) \
	-nostdinc++ \
	-isysroot /none \
	-g \
	-std=c99 \
	-Wall \
	-MD \
	-L $(GCC_INCLUDE) \
	-T ../ld/msp430fr6989.ld \
	../checkpoint/camel_helpers.S

override LLCFLAGS += \
	-march=msp430 \
	-mcpu=msp430x \

all: $(outputs)

#pipeline: C code (CLANG)-> LLVM IR (OPT)-> LLVM IR Mod (LLC)-> Assembly code (MSP430-GCC) -> executable
#some auxilary steps: LLVM IR .bc (LLVM-DIS)-> LLVM readable code .ll
#some auxilary steps: LLVM IR .bc (LLC)-> Assembly .s 

%.bc : %.c
	$(CLANG) -emit-llvm -c -O -Xclang -disable-llvm-passes -fheinous-gnu-extensions $(BFLAGS) -D$(CRC) -D$(MODE) $< -o $@
	
%.ll : %.bc
	$(DIS) $< -o $@

%.s : %.bc
	$(LLC) $< -o $@

%_mod.bc: %.bc
	cd ../llvm_pass && cmake . && make && cd ../llvm_bytecode
	$(OPT)  -load $(CAMEL) --CamelPass -$(MODE) $< > $@

%_mod.ll : %_mod.bc
	$(DIS) $< -o $@

%_mod.s : %_mod.bc
	$(LLC) $(LLCFLAGS) $< -o $@

%.out : %_mod.s
	$(GCC_BIN)/msp430-elf-gcc  $(CFLAGS) $< -o $@ -lm

#opt level is O3 by default	
%_opt.bc: %_mod.bc
	$(OPT) -$(op) $< > $@ 

%_opt.ll : %_opt.bc
	$(DIS) $< -o $@

%_opt.s: %_opt.bc
	$(LLC) $(LLCFLAGS) $< -o $@

%_opt.out: %_opt.s
	$(GCC_BIN)/msp430-elf-gcc  $(CFLAGS) $< -o $@ -lm

clean:
	$(RM) *.bc *.ll *.s *.out *.d
