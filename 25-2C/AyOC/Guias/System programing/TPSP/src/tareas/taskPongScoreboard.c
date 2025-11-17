#include "task_lib.h"

#define WIDTH TASK_VIEWPORT_WIDTH
#define HEIGHT TASK_VIEWPORT_HEIGHT

#define SHARED_SCORE_BASE_VADDR (PAGE_ON_DEMAND_BASE_VADDR + 0xF00)
#define CANT_PONGS 3


void task(void) {
	screen pantalla;
	// ¿Una tarea debe terminar en nuestro sistema?
	task_print(pantalla,"SCOREBOARDS", WIDTH/2 - 5, 0, C_BG_BLACK | C_FG_WHITE);
	task_print(pantalla,"P1-P2", WIDTH/2 - 2, 2, C_BG_BLACK | C_FG_WHITE);
	while (true)
	{
	// Completar:
	// - Pueden definir funciones auxiliares para imprimir en pantalla
	// - Pueden usar `task_print`, `task_print_dec`, etc. 
		uint32_t* scores = (uint32_t*) SHARED_SCORE_BASE_VADDR;



		for(int i = 0; i < CANT_PONGS; i++){
			//Borramos linea			
			uint32_t col = i*2+3;

			uint32_t p1 = scores[i * 2 + 0];
			uint32_t p2 = scores[i * 2 + 1];
			
			task_print(pantalla,"Pong", WIDTH/2 - 10, col, C_BG_BLACK | C_FG_WHITE);
			task_print_dec(pantalla,i,1,WIDTH/2 - 6,col,C_BG_BLACK | C_FG_WHITE);

			task_print_dec(pantalla,p1,2,WIDTH/2 - 2,col,C_BG_BLACK | C_FG_BLUE);
			task_print(pantalla,"-", WIDTH/2, col, C_BG_BLACK | C_FG_WHITE);
			task_print_dec(pantalla,p2,2,WIDTH/2 + 1,col,C_BG_BLACK | C_FG_RED);

		}
		
		syscall_draw(pantalla);
	}
}
