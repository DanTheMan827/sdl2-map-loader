#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <SDL2/SDL.h>

void __attribute__((constructor)) sdl2_map_loader() {
  char* map_files = getenv("SDL2_MAP_FILES");

  if (map_files) {
    char* token = strtok(map_files, ":");

    while (token != NULL) {
      FILE *file;

      if ((file = fopen(token, "r"))) {
        fclose(file);
        int mappings = SDL_GameControllerAddMappingsFromFile(token);
        printf((mappings == 1 ? "Loaded %d mapping from %s\n" : "Loaded %d mappings from %s\n"), mappings, token);
      } else {
        printf("File not found: %s\n", token);
      }

      token = strtok(NULL, ":");
    }
  }
}
