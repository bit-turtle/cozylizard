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

.segment "CODE"
main:
	jsr startmenu
	jmp main
