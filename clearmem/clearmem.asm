;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NES Header (contains total of 16 bytes with the flags at $7FF0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A			; 4 bytes with the characters 'NES\n'
.byte $02				; how many of 16KB of PRG-ROM used (32KB)
.byte $01				; how many 8kb of CHR-ROM we use (8KB)
.byte %00000000				; Horizontal mirroring, no battery, mapper 0
.byte %00000000				; mapper 0, playchoice, NES 2.0
.byte $00				; No PRG-RAM
.byte $00				; NTSC TV Format
.byte $00				; No PRG-RAM
.byte $00,$00,$00,$00,$00		; unused padding to complete the 16 bytes of header

.segment "CODE"
	
