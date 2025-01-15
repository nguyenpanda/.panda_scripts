COMPILER = clang++
FLAGS = --std=c++20 -O3

SRC_DIR = src
BIN_DIR = bin

SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
EXECUTABLES = $(patsubst $(SRC_DIR)/%.cpp, $(BIN_DIR)/%.exe, $(SOURCES))

.PHONY: all clean

all: $(EXECUTABLES)
	@echo "Build complete. Executables are in the $(BIN_DIR) directory."

$(BIN_DIR)/%.exe: $(SRC_DIR)/%.cpp $(BIN_DIR)
	$(COMPILER) $(FLAGS) $< -o $@

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BIN_DIR)
	@echo "Cleaned up."
