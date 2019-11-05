RM := rm -f
MKDIR := mkdir -p

CC := g++
LD := g++
STD := -std=c++11
OPTIMIZE := -O3
LD_FLAGS := -Wall $(OPTIMIZE)
CC_FLAGS := -Wall $(STD) $(OPTIMIZE)

BIN := tictactoe
BIN_DIR := bin
OBJ_DIR := obj
SRC_DIR := TicTacToe
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(addprefix $(OBJ_DIR)/,$(notdir $(SRC_FILES:.cpp=.o)))

$(BIN_DIR)/$(BIN): $(OBJ_FILES) $(BIN_DIR)
	$(CC) $(OBJ_FILES) $(LD_FLAGS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(OBJ_DIR)
	$(LD) $< -c $(CC_FLAGS) -o $@

$(BIN_DIR):
	$(MKDIR) $@

$(OBJ_DIR):
	$(MKDIR) $@

.PHONY: clean
clean:
	$(RM) $(OBJ_FILES)
