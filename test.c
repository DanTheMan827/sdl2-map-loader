#include <stdio.h>
#include <SDL2/SDL.h>
int main() {
  SDL_Init(SDL_INIT_EVERYTHING);
  printf("Loaded mappings: %d\n", SDL_GameControllerNumMappings());
  return 0;
}
