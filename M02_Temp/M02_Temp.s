	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"M02_Temp.c"
	.global	M02_TempTiles
	.global	M02_TempMap
	.global	M02_TempPal
	.section	.rodata
	.align	2
	.type	M02_TempTiles, %object
	.size	M02_TempTiles, 32
M02_TempTiles:
	.space	32
	.type	M02_TempMap, %object
	.size	M02_TempMap, 2048
M02_TempMap:
	.space	2048
	.type	M02_TempPal, %object
	.size	M02_TempPal, 32
M02_TempPal:
	.short	0
	.short	32640
	.short	12684
	.short	768
	.short	25
	.short	29723
	.short	1021
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.ident	"GCC: (devkitARM release 31) 4.5.0"
