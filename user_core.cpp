#include "user_core.hpp"

Window::Window(int w, int h, const char* label) 
    : width(w), height(h) {
    InitWindow(width, height, label);
}

int Window::GetWidth() {
    return width;
}

int Window::ShouldClose() {
    return WindowShouldClose();
}

int Window::GetHeight() {
    return height;
}

Window::~Window() {
    CloseWindow();
}
