; PPU Includes

.import ppu_update		; No params
.import ppu_update_tile		; X,Y = Nametable tile position, A = Tile value
.import ppu_update_byte		; X,Y = PPU address, A = byte
;   Y =  0- 31 nametable $2000
;   Y = 32- 63 nametable $2400
;   Y = 64- 95 nametable $2800
;   Y = 96-127 nametable $2C00
.import oam
.importzp scroll_nmt	; nametable select (0-3 = $2000,$2400,$2800,$2C00)
.importzp scroll_x
.importzp scroll_y
.importzp nmi_count
