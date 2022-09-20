all: sdl2-map-loader.so test-app

test: test-app sdl2-map-loader.so
	LD_PRELOAD="`pwd`/sdl2-map-loader.so" SDL2_MAP_FILES="gamecontrollerdb.txt:FILE_DOES_NOT_EXIST.txt" ./test-app

test-app: test.c gamecontrollerdb.txt
	$(CC) "$<" -ldl `sdl2-config --cflags --libs` -o "$@"

sdl2-map-loader.so: loader.o
	$(CC) "$<" -ldl `sdl2-config --libs` -shared -o "$@"

loader.o: loader.c
	$(CC) `sdl2-config --cflags` -Wall -fPIC -c -o "$@" "$<"

gamecontrollerdb.txt:
	wget "https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt"

clean:
	$(RM) loader.o sdl2-map-loader.so test-app

clean-all: clean
	$(RM) gamecontrollerdb.txt

.PHONY: clean clean-all
