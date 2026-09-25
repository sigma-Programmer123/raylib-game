#include "user_core.hpp"

int main(void) {
    SetTargetFPS(60);
    while (!window.ShouldClose()) {
        Window window(1920, 1080, "I HATE THIS");
        BeginDrawing();
            ClearBackground(BLACK);
            DrawText("Hello, world! (on mobile)", 640, 540, 64,
                     RAYWHITE);
        EndDrawing();
    }
    return 0;
}
