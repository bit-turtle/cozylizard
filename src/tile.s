; Tile drawing

.include "../prg/ppu.s"

.export put_tile
.export put_line

.segment "ZEROPAGE"
tile:	.res 1
buffer:
bufferlow: .res 1
bufferhigh: .res 1
tmpx: .res 1
tmpy: .res 1
temp: .res 1

.segment "CODE"

; Put tile and select next one
; A: Tile Value, (X,Y): Tile Position
put_tile:
	;; Update tile
	sta tile
	stx tmpx
	sty tmpy
	lda tile
	jsr ppu_update_tile
	;; Select next tile
	lda tile
	ldx tmpx
	ldy tmpy
	cpx #32
	bne @end
	ldx #0
	iny	
@end:
	lda tile
	rts

; Draw line of tiles at height
; (0, A): Starting Position, X: #<buffer, Y: #>buffer
put_line:
	stx bufferlow
	sty bufferhigh
	ldx #31
	tay
	; Start line
@loop:
	sty temp
	txa
	tay
	lda (buffer), Y
	ldy temp
	jsr put_tile
	dex
	bne @loop
@done:
	rts
	
