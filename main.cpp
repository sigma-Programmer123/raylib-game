#include "user_core.hpp"

void DrawUpdatedFrame() {
    BeginDrawing();
        ClearBackground(DARKGRAY);
        DrawText("Hello, world! (on mobile)", 640, 540, 64,
                 RAYWHITE);
    EndDrawing();
}

int main(void) {
#ifdef __EMSCRIPTEN__
    emscripten_set_main_loop(DrawUpdatedFrame, 60, 1);
#else
    SetTargetFPS(60);
    Window window(1920, 1080, "I HATE THIS");
    while (!window.ShouldClose()) {
        DrawUpdatedFrame();
    }
#endif
    return 0;
}
