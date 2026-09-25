#include "user_core.hpp"

void DrawUpdatedFrame() {
    BeginDrawing();
        ClearBackground(DARKGRAY);
        DrawText("Hello, world! (on mobile)", 100, 225, 32, RAYWHITE);
    EndDrawing();
}

int main(void) {
    Window window(800, 450, "I HATE THIS");
    SetTargetFPS(60);

#ifdef __EMSCRIPTEN__
    emscripten_set_main_loop(DrawUpdatedFrame, 60, 1);
#else
    while (!window.ShouldClose()) {
        DrawUpdatedFrame();
    }
#endif

    return 0;
}
