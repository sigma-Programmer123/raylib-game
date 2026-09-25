#ifndef USER_CORE_HPP
#define USER_CORE_HPP

extern "C" {
    #include "raylib.h"
}

class Window {
private:
    int width;
    int height;
public:
    Window(int w, int h, const char* label);
    int GetWidth();
    int ShouldClose();
    int GetHeight();
    ~Window();
}; // Window

#endif // USER_CORE_HPP
