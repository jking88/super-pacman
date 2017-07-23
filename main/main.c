    /*****************************************
    I am making a game where pacman has to collect all the
    dots within the map to win the game. There are different
    enemies/obsticles to be included within the game.

    I currently have the states system completed and am able
    to display the sprites on the screen

    Eventually, I will have the actual pacman and ghost sprites
    that interact with each other, as well as gravity. I have not
    been able to dedicate as much time to this as I have wanted
    to so far.
    ******************************************/


#include "myLib.h"
#include "M02_Temp.h"
#include "Sprites.h"

unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;
int state;

OBJ_ATTR shadowOAM[128];

#define ROWMASK 0xFF
#define COLMASK 0x1FF

typedef struct  
{
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
    int stopRange;
} MOVOBJ;

MOVOBJ pacman;
MOVOBJ ghost;


void hideSprites();
void update();
void draw();
void initialize();
void splash();
void instruct();
void game();
void pause();
void win();
void lose();
void initSplash();
void initInstruct();
void initGame();
void initPause();
void initWin();
void initLose();
void update();

enum {SPLASH, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
enum {BLACKINDEX, CYANINDEX, GREYINDEX, GREENINDEX, REDINDEX, PURPLEINDEX};
//Enum's containing different pacman sprites go here


int main()
{
	REG_DISPCTL = MODE4 | BG2_ENABLE; 

	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3 | COLOR256;

    loadPalette(M02_TempPal);
    DMANow(3, M02_TempTiles, &CHARBLOCKBASE[0],  M02_TempTilesLen/2);
	DMANow(3, M02_TempMap, &SCREENBLOCKBASE[27], M02_TempMapLen/2);

    DMANow(3, SpritesPal, SPRITE_PALETTE, 256);
    DMANow(3, SpritesTiles, &CHARBLOCKBASE[4], SpritesTilesLen/2);
    initialize(); 

    hideSprites();

    initSplash();
        
	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		//Switch statement and cases
		switch(state) {

			case SPLASH:
			splash();
			break;

			case INSTRUCTIONS:
			instruct();
			break;

			case GAME:
			game();
			break;

			case PAUSE:
			pause();
			break;

			case WIN:
			win();
			break;

			case LOSE:
			lose();
			break;    
		}
		waitForVblank();
	}
		
	return 0;
}


void hideSprites()
{
	for(int i = 0; i < 128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
  
}

void initSplash() 
{
	REG_DISPCTL = MODE4 | BG2_ENABLE; 
	drawRect4(0, 0, 160, 240, CYANINDEX);
	state = SPLASH;
}

void initInstruct() 
{
	drawRect4(0, 0, 160, 240, PURPLEINDEX);
	state = INSTRUCTIONS;
}

void initGame()
{
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
	drawRect4(0, 0, 160, 240, BLACKINDEX);
	state = GAME;
}

void initPause() 
{
	REG_DISPCTL = MODE4 | BG2_ENABLE; 
	drawRect4(0, 0, 160, 240, GREYINDEX);
	state = PAUSE;
}

void initWin() 
{
	REG_DISPCTL = MODE4 | BG2_ENABLE; 
	drawRect4(0, 0, 160, 240, GREENINDEX);
	state = WIN;
}

void initLose()
{
	REG_DISPCTL = MODE4 | BG2_ENABLE; 
	drawRect4(0, 0, 160, 240, REDINDEX);
	state = LOSE;
}

void initialize() 
{
	pacman.width = 16;
	pacman.height = 16;
	pacman.cdel = 1;
	pacman.row = 144;
	pacman.col = 20;

	pacman.currFrame = 0;
	pacman.aniState = 0;

	ghost.width = 16;
	ghost.height = 16;
	ghost.cdel = 1;
	ghost.row = 144;
	ghost.col = 200;

	ghost.currFrame = 0;
	ghost.aniState = 1;
}

void splash() 
{
	if (BUTTON_PRESSED(BUTTON_START)) {
		initGame();
	}

	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		initInstruct();
	}
}

void instruct()
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		initSplash();
	}
}

void game() 
{
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		initPause();
	}

	if(BUTTON_PRESSED(BUTTON_A)) {
		initWin();
	}

	if(BUTTON_PRESSED(BUTTON_B)) {
		initLose();
	}

	if(BUTTON_HELD(BUTTON_LEFT)) {
		pacman.col--;
	}

	if(BUTTON_HELD(BUTTON_RIGHT)) {
		pacman.col++;
	}


	shadowOAM[0].attr0 = pacman.row & ROWMASK;
	shadowOAM[0].attr1 = (pacman.col & COLMASK) | (ATTR1_SIZE16);
	shadowOAM[0].attr2 = SPRITEOFFSET16(pacman.currFrame*2, pacman.aniState*2);

	shadowOAM[1].attr0 = ghost.row & ROWMASK;
	shadowOAM[1].attr1 = (ghost.col & COLMASK) | (ATTR1_SIZE16);
	shadowOAM[1].attr2 = SPRITEOFFSET16(ghost.currFrame*2, ghost.aniState*2);

    DMANow(3, shadowOAM, OAM, 128*4);

    update();
    waitForVblank();


}

void pause() 
{
	if (BUTTON_PRESSED(BUTTON_START)) {
		initGame();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		initialize();
		initSplash();
	}
}

void win() 
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		initialize();
		initSplash();
	}
}

void lose() 
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		initialize();
		initSplash();
	}
}

void update()
{
	ghost.col += ghost.cdel;

	if (ghost.col >= 224) {
		ghost.cdel = -ghost.cdel;
	}
	if (ghost.col <= 0) {
		ghost.cdel = -ghost.cdel;
	}
	if (pacman.col >= 223) {
		pacman.col = 223;
	}
	if (pacman.col <= 1) {
		pacman.col = 1;
	}
}

