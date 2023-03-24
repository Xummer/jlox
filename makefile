##
# source directory
##
SRC_DIR := lox

##
# output directory
##
OUT_DIR := out

##
# package name
##
PAC_DIR := com/craftinginterpreters/lox

##
ENTRY_POINT := com.craftinginterpreters.lox.Lox

##
# sources
##
SRCS := $(wildcard $(SRC_DIR)/*.java)

##
# classes
## 
CLS := $(SRCS:$(SRC_DIR)/%.java=$(OUT_DIR)/%.class)

##
# compiler and compiler flags
##
JC := javac
JCFLAGS := -d $(OUT_DIR)/ -cp $(SRC_DIR)/

##
# suffixes
##
.SUFFIXES: .java .class

##
# targets that do not produce output files
##
.PHONY: build all clean 

##
# default target(s)
##

build:
	$(JC) $(JCFLAGS) $(SRC_DIR)/*.java

run:
	java -cp $(OUT_DIR) $(ENTRY_POINT)

all: $(CLS)

# 这里会重复编译需要调整
$(CLS): $(SRCS)
	$(JC) $(JCFLAGS) $^

##
# clean up any output files
##
clean:
	$(RM) $(OUT_DIR)/$(PAC_DIR)/*.class
