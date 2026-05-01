; Start menu
.export startmenu

.include "../prg/famitone.s"
.include "../prg/gamepad.s"
.include "../prg/ppu.s"

.import put_line
.import put_tile

.segment "ZEROPAGE"
selection: .res 1

.segment "RODATA"
title:
	.incbin "chr/title.map"

.segment "CODE"

waitframes:
	ldx #8
@loop:
	jsr ppu_update
	dex
	bne @loop
	rts

startmenu:
	; Title
	; Row 1
	lda #4
	ldx #<(title+$00)
	ldy #>(title+$00)
	jsr put_line
	jsr waitframes
	; Row 2
	lda #5
	ldx #<(title+$20)
	ldy #>(title+$20)
	jsr put_line
	jsr waitframes
	; Row 3
	lda #6
	ldx #<(title+$40)
	ldy #>(title+$40)
	jsr put_line
	jsr waitframes
	; Row 4
	lda #8
	ldx #<(title+$60)
	ldy #>(title+$60)
	jsr put_line
	jsr waitframes
	; Row 5
	lda #9
	ldx #<(title+$80)
	ldy #>(title+$80)
	jsr put_line
	jsr waitframes
	; Row 6
	lda #10
	ldx #<(title+$A0)
	ldy #>(title+$A0)
	jsr put_line
	jsr waitframes
	jsr waitframes
	; Row 7
	lda #12
	ldx #<(title+$C0)
	ldy #>(title+$C0)
	jsr put_line
	jsr waitframes
	jsr waitframes
	; Start music
	lda #0
	jsr FamiToneMusicPlay
	; Row 8 (Start)
	lda #17
	ldx #<(title+$E0)
	ldy #>(title+$E0)
	jsr put_line
	jsr waitframes
	; Row 9 (By bit-turtle)
	lda #22
	ldx #<(title+$100)
	ldy #>(title+$100)
	jsr put_line
	jsr waitframes
	; Row 10 (famitone5.0)
	lda #24
	ldx #<(title+$120)
	ldy #>(title+$120)
	jsr put_line
	jsr waitframes
	; Start music
	lda #0
	jsr FamiToneMusicPlay
@loop:
	jsr ppu_update
	jmp @loop
