
.include "../prg/ppu.s"
.include "../prg/famitone.s"
.include "../prg/gamepad.s"

.export game

.segment "RODATA"

.segment "ZEROPAGE"
lizardx: .res 1
lizardy: .res 1
lizardvy: .res 1
lizardheight: .res 1

.segment "CODE"

movement:
@right:
	lda gamepad
	and PAD_R
	beq @left
	ldx lizardx
	inx
	sta lizardx
@left:
	lda gamepad
	and PAD_L
	beq @gravity
	ldx lizardx
	dex
	stx lizardx
@gravity:
	rts
	ldx lizardvy
	inx
	stx lizardvy
	lda lizardy
	adc lizardvy
	sta lizardy
@end:
	rts

lizard:
	lda lizardx
	sta oam + 3
	lda lizardy
	sta oam + 0
	lda #05
	sta oam + 1
	rts

game:
	jsr ppu_update
	lda #0
	jsr FamiToneMusicPlay
	lda #80
	sta lizardx
	sta lizardy
	lda #0
	sta lizardvy
@loop:
	jsr gamepad_poll
	jsr movement
	jsr lizard
	jsr ppu_update
	jmp @loop	
