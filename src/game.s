
.include "../prg/ppu.s"
.include "../prg/famitone.s"
.include "../prg/gamepad.s"

.export game

.import put_tile
.import put_line

.segment "RODATA"
zero:
	.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
levels:
level0:
	.incbin "chr/level0.map"

.segment "CODE"

; (X,Y) = Memory loc
loadlevel0:
	; Row 0
	lda #0
	ldx #<(level0+$00)
	ldy #>(level0+$00)
	jsr put_line
	jsr ppu_update
	; Row 1
	lda #1
	ldx #<(level0+$20)
	ldy #>(level0+$20)
	jsr put_line
	jsr ppu_update
	; Row 2
	lda #2
	ldx #<(level0+$40)
	ldy #>(level0+$40)
	jsr put_line
	jsr ppu_update
	; Row 3
	lda #3
	ldx #<(level0+$60)
	ldy #>(level0+$60)
	jsr put_line
	jsr ppu_update
	; Row 4
	lda #4
	ldx #<(level0+$80)
	ldy #>(level0+$80)
	jsr put_line
	jsr ppu_update
	; Row 5
	lda #5
	ldx #<(level0+$100)
	ldy #>(level0+$100)
	jsr put_line
	jsr ppu_update
	; Row 6
	lda #6
	ldx #<(level0+$120)
	ldy #>(level0+$120)
	jsr put_line
	jsr ppu_update
	; Row 7
	lda #7
	ldx #<(level0+$140)
	ldy #>(level0+$140)
	jsr put_line
	jsr ppu_update
	; Row 8
	lda #8
	ldx #<(level0+$160)
	ldy #>(level0+$160)
	jsr put_line
	jsr ppu_update
	; Row 9
	lda #9
	ldx #<(level0+$180)
	ldy #>(level0+$180)
	jsr put_line
	jsr ppu_update
	; Row 10
	lda #10
	ldx #<(level0+$180)
	ldy #>(level0+$180)
	jsr put_line
	jsr ppu_update
	; Row 11
	lda #11
	ldx #<(level0+$200)
	ldy #>(level0+$200)
	jsr put_line
	jsr ppu_update
	; Row 12
	lda #12
	ldx #<(level0+$220)
	ldy #>(level0+$220)
	jsr put_line
	jsr ppu_update
	; Row 13
	lda #13
	ldx #<(level0+$240)
	ldy #>(level0+$240)
	jsr put_line
	jsr ppu_update
	; Row 14
	lda #14
	ldx #<(level0+$260)
	ldy #>(level0+$260)
	jsr put_line
	jsr ppu_update
	; Row 15
	lda #15
	ldx #<(level0+$260)
	ldy #>(level0+$260)
	jsr put_line
	jsr ppu_update
	; Row 16
	lda #16
	ldx #<(level0+$260)
	ldy #>(level0+$260)
	jsr put_line
	jsr ppu_update
	; Row 17
	lda #17
	ldx #<(level0+$280)
	ldy #>(level0+$280)
	jsr put_line
	jsr ppu_update
	; Row 18
	lda #18
	ldx #<(level0+$300)
	ldy #>(level0+$300)
	jsr put_line
	jsr ppu_update
	; Row 19
	lda #19
	ldx #<(level0+$320)
	ldy #>(level0+$320)
	jsr put_line
	jsr ppu_update
	; Row 20
	lda #20
	ldx #<(level0+$340)
	ldy #>(level0+$340)
	jsr put_line
	jsr ppu_update
	; Row 21
	lda #21
	ldx #<(level0+$360)
	ldy #>(level0+$360)
	jsr put_line
	jsr ppu_update
	; Row 22
	lda #22
	ldx #<(level0+$380)
	ldy #>(level0+$380)
	jsr put_line
	jsr ppu_update
	; Row 23
	lda #23
	ldx #<zero
	ldy #>zero
	jsr put_line
	jsr ppu_update
	; Row 24
	lda #24
	ldx #<zero
	ldy #>zero
	jsr put_line
	jsr ppu_update
	; Row 25
	lda #25
	ldx #<zero
	ldy #>zero
	jsr put_line
	jsr ppu_update
	; Row 26
	lda #26
	ldx #<zero
	ldy #>zero
	jsr put_line
	jsr ppu_update
	; Row 27
	lda #27
	ldx #<zero
	ldy #>zero
	jsr put_line
	jsr ppu_update
	; Row 28
	lda #28
	ldx #<zero
	ldy #>zero
	jsr put_line
	jsr ppu_update
	; Row 29
	lda #29
	ldx #<zero
	ldy #>zero
	jsr put_line
	jsr ppu_update
@end:
	rts


.segment "ZEROPAGE"
anim: .res 1
lizardx: .res 1
lizardy: .res 1
lizardl: .res 1
lizardvy: .res 1
lizardcolor: .res 1

.segment "CODE"

draw_lizard:
	; Body
	lda lizardx
	sta oam + 3
	lda lizardy
	sta oam + 0
	lda #05
	sta oam + 1
	lda lizardl
	and #$40
	adc lizardcolor
	tax
	sta oam + 2
	; Head
	lda lizardl
	beq @hright
	lda lizardx
	sbc #7
	jmp @hdraw
@hright:
	lda lizardx
	adc #7
@hdraw:	
	sta oam + 4 + 3
	lda lizardy
	sta oam + 4 + 0
	txa
	sta oam + 4 + 2
	lda #6
	sta oam + 4 + 1
	; Body
	lda lizardl
	beq @bright
	lda lizardx
	adc #7
	jmp @bdraw
@bright:
	lda lizardx
	sbc #7
@bdraw:	
	sta oam + 8 + 3
	lda lizardy
	sta oam + 8 + 0
	txa
	sta oam + 8 + 2
	lda #4
	sta oam + 8 + 1
@end:
	rts

game:
	jsr ppu_update
	jsr loadlevel0
	lda #80
	sta lizardx
	sta lizardx
@loop:
	; read gamepad
	jsr gamepad_poll
	; respond to gamepad state
	lda gamepad
	sta $ff
@right:
	lda gamepad
	and #$01
	beq @left
	inc lizardx
	lda #0
	sta lizardl
@left:
	lda gamepad
	and #$02
	beq @next
	dec lizardx
	lda #$ff
	sta lizardl
@next:
	inc lizardy
	jsr draw_lizard
	lda anim
	eor #$ff
@write:
	stx anim
	; Render and stop audio issues
	jsr FamiToneMusicStop
	jsr ppu_update
	; keep doing this forever!
	jmp @loop
