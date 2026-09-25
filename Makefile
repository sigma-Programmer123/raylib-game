CXX = emcc
CXXFLAGS = -Wall -Werror -std=c++17 -DPLATFORM_WEB -Iraylib/src
LDFLAGS = raylib/src/libraylib.a -s USE_GLFW=3 -s ALLOW_MEMORY_GROWTH=1 --shell-file shell.html

# Directories
SRC_DIR = src
BUILD_DIR = build

TARGET = index.html

# Automatically find all .cpp files in src/ and map them to build/%.o
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Link all object files and Raylib into the final WebAssembly package
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

# Compile C++ source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(TARGET) index.js index.wasm index.data

.PHONY: all clean
