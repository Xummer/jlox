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
PAC_DIR := com/craftinginterpreters

PAC_ID := com.craftinginterpreters

##
ENTRY_POINT := $(PAC_ID).$(SRC_DIR).Lox

TOOL_DIR := tool

TOOL_ENTRY_POINT := $(PAC_ID).$(TOOL_DIR).GenerateAst

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
.PHONY: build all tool clean 

##
# default target(s)
##

build:
	$(JC) $(JCFLAGS) $(SRC_DIR)/*.java

run:
	java -cp $(OUT_DIR) $(ENTRY_POINT)

tool: 
	$(JC) -d $(OUT_DIR)/ -cp $(TOOL_DIR)/ $(TOOL_DIR)/*.java

exprgen:
	java -cp $(OUT_DIR) $(TOOL_ENTRY_POINT) $(SRC_DIR)

all: $(CLS)

# 这里会重复编译需要调整
$(CLS): $(SRCS)
	$(JC) $(JCFLAGS) $^

##
# clean up any output files
##
clean:
	$(RM) $(OUT_DIR)/$(PAC_DIR)/*/*.class
	$(RM) $(SRC_DIR)/Expr.java
