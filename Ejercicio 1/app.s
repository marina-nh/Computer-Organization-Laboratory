
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main
main:
	// X0 contains base adress of the framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	add x17, xzr, xzr //Initialize x17 to 0

// Paints the Sky with blue colour.
BackgroundColor:
	add x0, x20, xzr // base address of the framebuffer
	mov x1, #640 // Length of the line = 640 (Vertical or Horizontal)  
	mov x10, #480 // Width of the line = 480 

	movz w2, 0x00, lsl 16 // Blue colour
	movk w2, 0x7FFE, lsl 00 // Blue colour

	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the light orange part of the floor.
LightOrangeFloor:
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x124800 
	add x0, x0, x9  // load the address X=0, Y=468

	mov x1, #640 // Length of the line = 640
	mov x10, #6 // Width of the line = 6
	
	movz w2, 0xFE, lsl 16 // Light Orange colour
	movk w2, 0xB982, lsl 00 // Light Orange colour

	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the dark orange part of the floor.
DarkOrangeFloor:
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x128400 
	add x0, x0, x9  // load the address X=0, Y=474

	mov x1, #640 // Length of the line = 640
	mov x10, #6 // Width of the line = 6
	
	movz w2, 0xC4, lsl 16 // Dark Orange colour
	movk w2, 0x6C4A, lsl 00 // Dark Orange colour

	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the dark orange squares of the floor.
DarkOrangeSquares:
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x12488C 
	add x0, x0, x9  // load the address X=35, Y=468

	mov x1, #5 // Length of the line = 5
	mov x10, #6 // Width of the line = 6
	
	mov x4, SCREEN_WIDTH // x4 = 640
	add x3, xzr, x0 // Copy the address of x0 in x3.
	// Cycle to paint all the squares.
	DrawDarkOrangeSquares:	
		bl DrawHorizontalLineWidth // Calls the function in each cycle

		add x3,x3,160	// next 40 pixels
		add x0,xzr,x3 // x0 = x3		
		sub x4,x4,#40 // decrement X4 by 40
		cmp x4,xzr // if x4 > 0
		bgt DrawDarkOrangeSquares // jump to DrawDarkOrangeSquares

// Paints the light orange squares of the floor.
LightOrangeSquares:	
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x12848C 
	add x0, x0, x9  // load the address X=35, Y=474

	mov x1, #5 // Length of the line = 5
	mov x10, #6 // Width of the line = 6

	movz w2, 0xFE, lsl 16 // Light Orange colour
	movk w2, 0xB982, lsl 00 // Light Orange colour
	
	mov x4,SCREEN_WIDTH // x4 = 640
	add x3, xzr, x0 // copy the adress of x0 in x3.
	// Cycle to paint all the squares.
	DrawLightOrangeSquares:
		bl DrawHorizontalLineWidth // Calls the funcion in each cycle.

		add x3,x3,160	// next 40 pixels
		add x0,xzr,x3 // x0 = x3	
		sub x4,x4,#40 // decrement x4 by 40
		cmp x4,xzr // if x4 > 0
		bgt DrawLightOrangeSquares // jump to DrawLightOrangeSquares

// Paints the Boots of Mario.
MarioBoots:
	// base of the left mario boot
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x7ABFC
	add x0, x0, x9 // load the adress X=255, Y=196
	
	mov x1, #40 // Length of the line = 40
	mov x10, #10 // Width of the line = 10
	
	movz w2, 0x6E, lsl 16 // Brown colour
	movk w2, 0x6900, lsl 00 // Brown colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// base of the right mario boot
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x7AD3C
	add x0, x0, x9 // load the adress X=335, Y=196
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// top of the left mario boot
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x74824
	add x0, x0, x9 // load the adress X=265, Y=186
	
	mov x1, #30 // Length of the line = 30
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// top of the right mario boot
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x7493C
	add x0, x0, x9 // load the adress X=335, Y=186
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the suit of Mario.
MarioSuit:
	// left side of the pant
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x6804C
	add x0, x0, x9 // load the adress X=275, Y=166
	mov x10, #20 // Width of the line = 20
	movz w2, 0xD9, lsl 16 // Red colour
	movk w2, 0x0000, lsl 00 // Red colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
 
	// right side of the pant
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x68114
	add x0, x0, x9 // load the adress X=325, Y=166
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// Stomach
	// stomach base
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5B874
	add x0, x0, x9 // load the adress X=285, Y=146
	mov x1, #60 // Length of the line = 60
	mov x10, #30 // Width of the line = 30
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// top stomach
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5549C
	add x0, x0, x9 // load the adress X=295, Y=136	
	mov x1, #40 // Length of the line = 40
	mov x10, #10 // Width of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
	
	//suspenders
	//left suspender
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5549C
	add x0, x0, x9 // load the adress X=295, Y=136	
	mov x1, #20 // Length of the line = 20
	mov x10, #10 // Width of the line = 10	
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	//right suspender
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x55514
	add x0, x0, x9 // load the adress X=325, Y=136	
	mov x1, #10 // Length of the line = 10
	mov x10, #10 // Width of the line = 10	
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	//yellow buttons
	//left button
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5B89C
	add x0, x0, x9 // load the adress X=295, Y=146	
	mov x1, #10 // Length of the line = 10
	mov x10, #10 // Width of the line = 10
	movz w2, 0xF9, lsl 16 // Yellow colour
	movk w2, 0xAA00, lsl 00 // Yellow colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
 
	//right button
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5B914
	add x0, x0, x9 // load the adress X=325, Y=146
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the body of Mario.
MarioBody:
	//neck
	//top part of the neck
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x496C4
	add x0, x0, x9 // load the adress X=305, Y=117
	mov x1, #30 // Length of the line = 30
	mov x10, #10 // Width of the line = 10
	movz w2, 0x6E, lsl 16 // Brown colour
	movk w2, 0x6900, lsl 00 // Brown colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// bottom part of the neck
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x4FAC4
	add x0, x0, x9 // load the adress X=305, Y=127
	mov x1, #20 // Length of the line = 20
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	//right arm
	// top part of the right arm
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x4FB3C
	add x0, x0, x9 // load the adress X=335, Y=127	
	mov x1, #30 // Length of the line = 30
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// middle part of the right arm
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x55F3C
	add x0, x0, x9 // load the adress X=335, Y=137	
	mov x1, #40 // Length of the line = 40
	mov x10, #10 // Width of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
	
	// bottom part of the right arm
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5C364
	add x0, x0, x9 // load the adress X=345, Y=147	
	mov x1, #10 // Length of the line = 10
	mov x10, #10 // Width of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	//left arm
	// top part of the left arm
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x4964C
	add x0, x0, x9 // load the adress X=275, Y=117	
	mov x1, #20 // Length of the line = 20
	mov x10, #10 // Width of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// middle top part of the left arm
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x4FA24
	add x0, x0, x9 // load the adress X=265, Y=127	
	mov x1, #30 // Length of the line = 30
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// middle bottom of the left arm
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x55DFC
	add x0, x0, x9 // load the adress X=255, Y=137	
	mov x1, #40 // Length of the line = 40
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// bottom part of the left arm
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5C24C
	add x0, x0, x9 // load the adress X=275, Y=147	
	mov x1, #10 // Length of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// left hand
	// base of the left hand
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5C1FC
	add x0, x0, x9 // load the adress X=255, Y=147
	mov x1, #20 // Length of the line = 20
	mov x10, #30 // Width of the line = 30
	movz w2, 0xF9, lsl 16 // Yellow colour
	movk w2, 0xAA00, lsl 00 // Yellow colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
	
	// thumb of the left hand
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x6264C
	add x0, x0, x9 // load the adress X=275, Y=157
	mov x1, #10 // Length of the line = 10
	mov x10, #10 // width of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// right hand
	// base of the right hand
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x5C38C
	add x0, x0, x9 // load the adress X=355, Y=147
	mov x1, #20 // Length of the line = 20
	mov x10, #30 // Width of the line = 30
	movz w2, 0xF9, lsl 16 // Yellow colour
	movk w2, 0xAA00, lsl 00 // Yellow colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
	
	// thumb of the right hand
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x62764
	add x0, x0, x9 // load the adress X=345, Y=157	
	mov x1, #10 // Length of the line = 10
	mov x10, #10 // width of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the head of Mario.	
MarioHead:
	// base of the head
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x30674
	add x0, x0, x9 // load the adress X=285, Y=77
	mov x1, #80 // Length of the line = 80
	mov x10, #40 // Width of the line = 40
	movz w2, 0xF9, lsl 16 // Yellow colour
	movk w2, 0xAA00, lsl 00 // Yellow colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// top part of the head
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x2A2C4
	add x0, x0, x9 // load the adress X=305, Y=67
	mov x1, #50 // Length of the line = 50
	mov x10, #10 // Width of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// nose
	// nose top
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x307B4
	add x0, x0, x9 // load the adress X=365, Y=77
	mov x1, #10 // Length of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// nose bottom
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x36BB4
	add x0, x0, x9 // load the adress X=365, Y=87
	mov x1, #20 // Length of the line = 20
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
	
	// ear
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x3C44C
	add x0, x0, x9 // load the adress X=275, Y=96
	mov x1, #20 // Length of the line = 20
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	// mustache
	// bottom part of the mustache
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x3CF3C
	add x0, x0, x9 // load the adress X=335, Y=97
	mov x1, #40 // Length of the line = 40
	mov x10, #10 // Width of the line = 10
	movz w2, 0x6E, lsl 16 // Brown colour
	movk w2, 0x6900, lsl 00 // Brown colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// top part of the mustache
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x36B64
	add x0, x0, x9 // load the adress X=345, Y=87
	mov x1, #10 // Length of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	//eyes
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x3613C
	add x0, x0, x9 // load the adress X=335, Y=87
	mov x1, #20 // Length of the line = 20
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	//hair
	// hair behind the ear
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x42824
	add x0, x0, x9 // load the adress X=265, Y=106
	mov x1, #30 // Length of the line = 30
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	// hair on top of the ear
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x2A24C
	add x0, x0, x9 // load the adress X=275, Y=66
	mov x1, #30 // Length of the line = 30
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.
	
	// hair under the ear
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x3C44C
	add x0, x0, x9 // load the adress X=275, Y=96
	mov x1, #10 // Length of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// hair in front of the ear
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x3C474
	add x0, x0, x9 // load the adress X=285, Y=96
	mov x1, #20 // Length of the line = 20
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x36A9C
	add x0, x0, x9 // load the adress X=295, Y=86
	mov x1, #10 // Length of the line = 10
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the hat of Mario
MarioHat:
	// bottom part of the hat
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x23E4C
	add x0, x0, x9 // load the adress X=275, Y=57
	mov x1, #100 // Length of the line = 100
	movz w2, 0xD9, lsl 16 // Red colour
	movk w2, 0x0000, lsl 00 // Red colour
	bl DrawHorizontalLineWidth	// Calls the function with the parameters set above.

	// top part of the hat
	add x0, x20, x17 // x0 gets the base address of the framebuffer
	ldr x9, =0x1DA74
	add x0, x0, x9 // load the adress X=285, Y=47
	mov x1, #60 // Length of the line = 60
	bl DrawHorizontalLineWidth	// Calls the function with the parameters set above.

// Paints the base of the Bottom Pipe.
BottomPipe:
	// left vertical pipe line
	add x0, x20, xzr // x0 gets the base address of the framebuffer
	ldr x9, =0x1241AC 
	add x0, x0, x9  // x0 gets the address X=235, Y=467

	mov x1, #200 //Length of the line = 200 
	mov x10, #6 // Width of the line = 6
	
	movz w2, 0x00, lsl 16 // Black colour
	movk w2, 0x0000, lsl 00 // Black colour
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.
	
	// right vertical pipe line
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x12442C  
	add x0, x0, x9  // load the address X=395, Y=467
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.
	
	// horizontal pipe line
	mov x1, #166 // set the length of the line
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0xA71AC  
	add x0, x0, x9  // load the address X=235, Y=267
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

// Paints the inner of the Bottom Pipe	
InnerBottomPipe:
	// Background InnerBottomPipe
	add x0, x20, xzr // x0 gets the base address of the framebuffer
	ldr x9, =0x1241C4
	add x0, x0, x9 // load the address X=241, Y=467

	mov x1, #195 // Height of the line = 195
	mov x10, #154 // Width of the line = 154

	movz w2, 0x54, lsl 16 // Green colour
	movk w2, 0xD100, lsl 00 // Green colour
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	// left vertical line InnerBottomPipe
	mov x10, #12 // width of the line = 12
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x1241FC
	add x0, x0, x9 // load the adress X=255, Y=467
	movz w2, 0x3D, lsl 16 // Dark Green color
	movk w2, 0x9500, lsl 00 // Dark Green color
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	// middle vertical line InnerBottomPipe
	mov x10, #6 // width of the line = 6
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x1242EC
	add x0, x0, x9 // load the adress X=315, Y=467
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.
	
	// right vertical line InnerBottomPipe
	mov x10, #40 // width of the line = 40
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x12433C
	add x0, x0, x9 // load the adress X=335, Y=467
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

// Paints the base of the Top Pipe.
TopPipe:
	// topPipe bottom horizontal line
	add x0, x20, xzr // x0 gets the base address of the framebuffer
	ldr x9, =0xA355C 
	add x0, x0, x9  // x0 gets the address X=215, Y=261

	mov x1, #200 //Length of the line = 200 
	mov x10, #6 // Width of the line = 6
	
	movz w2, 0x00, lsl 16 // Black colour
	movk w2, 0x0000, lsl 00 // Black colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// TopPipe upper horizontal line
	add x0, x20, xzr // x0 gets the base address of the framebuffer
	ldr x9, =0x80F5C 
	add x0, x0, x9  // x0 gets the address X=215, Y=206
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// TopPipe left vertical line
	add x0, x20, xzr // x0 gets the base address of the framebuffer
	ldr x9, =0xA675C 
	add x0, x0, x9  // x0 gets the address X=215, Y=266
	mov x1, #61 // Length of the line = 61 
	mov x10, #6 // Width of the line = 6
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	// TopPipe right vertical line
	add x0, x20, xzr // x0 gets the base address of the framebuffer
	ldr x9, =0xA6A7C 
	add x0, x0, x9  // x0 gets the address X=415, Y=266
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

// Paints the inner of the Top Pipe.
InnerTopPipe:
	// green background InnerTopPipe
	add x0, x20, xzr // x0 gets the base address of the framebuffer
	ldr x9, =0x84174
	add x0, x0, x9 // load the address X=221, Y=211
	mov x1, #194 // Length of the line = 194
	mov x10, #50 // Width of the line = 50
	movz w2, 0x54, lsl 16 // Green colour
	movk w2, 0xD100, lsl 00 // Green colour
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// left vertical line InnerTopPipe
	mov x1, #40 // Length of the line = 40
	mov x10, #12 // width of the line = 12
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0xA2BE0
	add x0, x0, x9 // load the adress X=248, Y=260
	movz w2, 0x3D, lsl 16 // Dark Green color
	movk w2, 0x9500, lsl 00 // Dark Green color
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.
	
	// middle vertical line InnerTopPipe
	mov x10, #6 // width of the line = 6
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0xA2CD8
	add x0, x0, x9 // load the adress X=310, Y=260
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	// right vertical line InnerTopPipe
	mov x10, #50 // width of the line = 40
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0xA2D28
	add x0, x0, x9 // load the adress X=330, Y=260
	bl DrawVerticalLineWidth // Calls the function with the parameters set above.

	// left horizontal line InnerTopPipe
	mov x1, #39 // Length of the line = 40
	mov x10, #6 // width of the line = 40
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x86974
	add x0, x0, x9 // load the adress X=221, Y=215
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	// right horizontal line InnnerTopPipe 
	mov x1, #105 // Length of the line = 40
	add x0, x20, xzr // base address of the framebuffer
	ldr x9, =0x86AD8	
	add x0, x0, x9 // load the adress X=310, Y=215
	bl DrawHorizontalLineWidth // Calls the function with the parameters set above.

	b End
// FUNCTIONS:

// Set the width of the line and call DrawVerticalLine
// x10 = width of the line
DrawVerticalLineWidth:
	add x11, xzr, xzr // x11 = 0
	add x14, xzr, lr // x14 = Link Register
	VWline:
		bl DrawVerticalLine // jump to DrawVerticalLine and store the address of the next call in Link Register
		add x0, x0, #4  // x0 moves to next pixel
		add x11, x11, #1 // x11 = x11 + 1
		cmp x10, x11	// if x10 != x11
		bne VWline	// jump to VWline
		br x14    // jump to Link Register

// Draw a vertical line (bottom up)
// x0 = Start pixel address
// x1 = Height of the line
// w2 = colour
DrawVerticalLine:
	add x12, xzr, x0 // x12 = x0
	add x13, xzr, xzr // x13 = 0
	VLine:
		stur w2, [x12]	// set color of pixel N
		sub x12, x12, #2560 // decrease 486 pixels
		add x13, x13, 1 // x13 = x13 + 1
		cmp x1, x13	// if x1 != x13
		bne VLine // jump to VLine
		br lr	// jump to Link Register

// Set the width of the line and call DrawHorizontalLine
// x10 = width of the line
DrawHorizontalLineWidth:
	add x11, xzr, xzr // x11 = 0
	add x14, xzr, lr // x14 = Link Register
	HWline:
		bl DrawHorizontalLine // jump to DrawHorizontalLine and store the address of the next call in Link Register
		add x0, x0, #2560 // x0 moves Y axis
		add x11, x11, #1 // x11 = x11 + 1
		cmp x10, x11	// if x10 != x11
		bne HWline	// jump to HWline
		br x14    // jump to Link Register

// Draw a horizontal line (left to right)
// x0 = Start pixel address
// x1 = Length of the line
// w2 = colour
DrawHorizontalLine:
	add x12, xzr, x0 // x12 = x0
	add x13, xzr, xzr // x13 = 0
	HLine:
		stur w2, [x12]	// set color of pixel N
		add x12, x12, #4 // moves to the next pixel
		add x13, x13, 1 // x13 = x13 + 1
		cmp x1, x13	// if x1 != x13
		bne HLine // jump to HLine
		br lr	// jump to Link Register

End:

InfLoop: 
	b InfLoop
