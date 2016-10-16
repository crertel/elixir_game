#include <stdio.h>
#include <SDL2/SDL.h>

void debugEvent( const SDL_Event* evt ){
	switch(evt->type) {
		case SDL_WINDOWEVENT: SDL_Log("Window event: %x", evt->window.event); break;
		case SDL_MOUSEMOTION: SDL_Log("Mouse event"); break;
		default: break;
	}
}

int main( int argc, char** argv) {
	SDL_Event evt;
	SDL_Window* window;	
	SDL_Renderer* renderer;
	printf("Yolo sawg 420 clang it.\n");

	if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_GAMECONTROLLER | SDL_INIT_TIMER) < 0) {
		SDL_Log("SDL_Init failed: %s\n", SDL_GetError() );
		return 1;
	}

	/* setup window */
	if (SDL_CreateWindowAndRenderer(320, 240, SDL_WINDOW_RESIZABLE, &window, &renderer) ) {
		SDL_Log("SDL_CreateWindowAndRenderer failed: %s\n", SDL_GetError() );
		return 1;
	}

	/* main loop */
	while (1) {		
		if (SDL_PollEvent(&evt) ){
			if (evt.type == SDL_QUIT) {
				break;
			} else {
				debugEvent(&evt);
			}	
		}
	}

	SDL_Quit();
	return 0;
}