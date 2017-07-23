# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 16 "main.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 88 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 98 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 137 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 231 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 288 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 17 "main.c" 2
# 1 "M02_Temp.h" 1
# 22 "M02_Temp.h"
extern const unsigned short M02_TempTiles[16];


extern const unsigned short M02_TempMap[1024];


extern const unsigned short M02_TempPal[16];
# 18 "main.c" 2
# 1 "Sprites.h" 1
# 21 "Sprites.h"
extern const unsigned short SpritesTiles[16384];


extern const unsigned short SpritesPal[16];
# 19 "main.c" 2

unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;
int state;

OBJ_ATTR shadowOAM[128];




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



int main()
{
 *(unsigned short *)0x4000000 = 4 | (1<<10);

 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 3<<14 | 1 << 7;

    loadPalette(M02_TempPal);
    DMANow(3, M02_TempTiles, &((charblock *)0x6000000)[0], 32/2);
 DMANow(3, M02_TempMap, &((screenblock *)0x6000000)[27], 2048/2);

    DMANow(3, SpritesPal, ((unsigned short*)(0x5000200)), 256);
    DMANow(3, SpritesTiles, &((charblock *)0x6000000)[4], 32768/2);
    initialize();

    hideSprites();

    initSplash();

 while(1)
 {
  oldButtons = buttons;
  buttons = *(volatile unsigned int *)0x04000130;


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
  shadowOAM[i].attr0 = (2 << 8);
 }

}

void initSplash()
{
 *(unsigned short *)0x4000000 = 4 | (1<<10);
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
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);
 drawRect4(0, 0, 160, 240, BLACKINDEX);
 state = GAME;
}

void initPause()
{
 *(unsigned short *)0x4000000 = 4 | (1<<10);
 drawRect4(0, 0, 160, 240, GREYINDEX);
 state = PAUSE;
}

void initWin()
{
 *(unsigned short *)0x4000000 = 4 | (1<<10);
 drawRect4(0, 0, 160, 240, GREENINDEX);
 state = WIN;
}

void initLose()
{
 *(unsigned short *)0x4000000 = 4 | (1<<10);
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
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  initGame();
 }

 if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  initInstruct();
 }
}

void instruct()
{
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  initSplash();
 }
}

void game()
{
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  initPause();
 }

 if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  initWin();
 }

 if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
  initLose();
 }

 if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
  pacman.col--;
 }

 if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
  pacman.col++;
 }


 shadowOAM[0].attr0 = pacman.row & 0xFF;
 shadowOAM[0].attr1 = (pacman.col & 0x1FF) | ((1 << 14));
 shadowOAM[0].attr2 = (pacman.currFrame*2)*32+(pacman.aniState*2);

 shadowOAM[1].attr0 = ghost.row & 0xFF;
 shadowOAM[1].attr1 = (ghost.col & 0x1FF) | ((1 << 14));
 shadowOAM[1].attr2 = (ghost.currFrame*2)*32+(ghost.aniState*2);

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    update();
    waitForVblank();


}

void pause()
{
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  initGame();
 }
 if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  initialize();
  initSplash();
 }
}

void win()
{
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  initialize();
  initSplash();
 }
}

void lose()
{
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
