#sim makefile.

# ifeq ($(benchmark),)
#   $(error benchmark is not set)
# endif

# ifeq ($(optlvl),)
#   $(error optlvl is not set)
# endif

#outputs
override outputs = $(benchmark)_$(optlvl).ll $(benchmark)_$(optlvl).bc $(benchmark)_$(optlvl).s $(benchmark).bc

#tools dir
LLVM_DIR = /home/saim/Desktop/llvm-project/build

#tools alias
CLANG = $(LLVM_DIR)/bin/clang
DIS = $(LLVM_DIR)/bin/llvm-dis
OPT = $(LLVM_DIR)/bin/opt
LLC = $(LLVM_DIR)/bin/llc
LLI = $(LLVM_DIR)/bin/lli

#compiler flags 
CFLAGS = \
	-nobuiltininc \
	-nostdinc++ \
	-isysroot /none \
	-g \
	-std=c99 \
	-Wall \
	-MD \

OFLAGS = \
	-$(optlvl) \

LFLAGS = \
	-nostdinc++ \
	-isysroot /none \
	-g \
	-std=c99 \
	-Wall \
	-MD \

#pipeline

all: $(outputs)

%.bc : %.c
	$(CLANG) -emit-llvm -c -O -Xclang -disable-llvm-passes -fheinous-gnu-extensions $< -o $@
	
%_$(optlvl).bc: %.bc
	$(OPT) $(OFLAGS) $< > $@
	rm $(benchmark).bc

%_$(optlvl).ll : %_$(optlvl).bc
	$(DIS) $< -o $@

%_$(optlvl).s : %_$(optlvl).bc
	$(LLC) $< -o $@

clean:
	$(RM) *.bc *.ll *.s *.out *.d
