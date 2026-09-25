CXX = emcc
CXXFLAGS = -Wall -Werror -std=c++11
CXX_LIB_FLAGS = raylib/src/libraylib.a -s USE_GLFW=3 -s ALLOW_MEMORY_GROWTH=1

# Directories
SRC_DIR = src
BUILD_DIR = build

TARGET = index.html

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ $(CXX_LIB_FLAGS) -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(TARGET) index.js index.wasm index.data

run: all
	./$(TARGET)

.PHONY: all run clean
