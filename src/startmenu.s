; Start menu
.export startmenu

.include "../prg/famitone.s"
.include "../prg/gamepad.s"
.include "../prg/ppu.s"

.segment "ZEROPAGE"
selection: .res 1

.segment "CODE"

waitframes:
	ldx #8
@loop:
	jsr ppu_update
	dex
	bne @loop
	rts

startmenu:
	lda #0
	jsr FamiToneMusicPlay
@C:
	ldx #8
	ldy #4
	lda #$04
	jsr ppu_update_tile	
	ldx #9
	ldy #4
	lda #$16
	jsr ppu_update_tile
	ldx #10
	ldy #4
	lda #$17
	jsr ppu_update_tile
	ldx #8
	ldy #5
	lda #$25
	jsr ppu_update_tile
	ldx #8
	ldy #6
	lda #$24
	jsr ppu_update_tile	
	ldx #9
	ldy #6
	lda #$16
	jsr ppu_update_tile
	ldx #10
	ldy #6
	lda #$17
	jsr ppu_update_tile
@O:
	ldx #12
	ldy #4
	lda #$04
	jsr ppu_update_tile	
	ldx #13
	ldy #4
	lda #$16
	jsr ppu_update_tile
	ldx #14
	ldy #4
	lda #$17
	jsr ppu_update_tile
	ldx #12
	ldy #5
	lda #$25
	jsr ppu_update_tile
	ldx #14
	ldy #5
	lda #$25
	jsr ppu_update_tile
	ldx #12
	ldy #6
	lda #$24
	jsr ppu_update_tile	
	ldx #13
	ldy #6
	lda #$16
	jsr ppu_update_tile
	ldx #14
	ldy #6
	lda #$17
	jsr ppu_update_tile
@loop:
	jsr ppu_update
	jmp @loop
