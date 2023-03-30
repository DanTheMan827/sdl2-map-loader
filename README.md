# sdl2-map-loader

This is a LD_PRELOAD library that will inject SDL2 game controller mappings into the launched process.

## Usage

You define the files to load from with the `SDL2_MAP_FILES` environment variable with each file separated by a `:`

### Example:
```bash
LD_PRELOAD="./sdl2-map-loader.so" SDL2_MAP_FILES="./gamecontrollerdb.txt" ./test-app
```

## Why?

Not all games load additional mappings from a gamecontrollerdb.txt file, this allows you to load them regardless of that fact.
