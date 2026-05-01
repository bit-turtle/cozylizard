;
; main.s
;

.export main

; Includes
.include "../prg/famitone.s"
.include "../prg/gamepad.s"
.include "../prg/ppu.s"

; Imports
.import startmenu
.import game

.segment "CODE"
main:
	jsr startmenu
	jsr game
	jmp main
