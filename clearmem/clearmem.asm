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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRG-ROM, always located at $8000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.segment "CODE"
.org $8000				; start of PRG-ROM

RESET:
  sei					; disables all interupt requests
  cld					; clears the decimal mode... even though we don't have it, it is customary to do this
  ldx #$FF
  txs					; Initialize the stack pointer at $01FF, at the bottom of our stack

  ldx #0				; A = 0
  ldx #$FF				; X = $FF
MemLoop:
  sta $0,x				; store the value of A (Zero) into $0 + x
  dex					; x--
  be MemLoop				; if X is not zero, we loop back to the MemLoop label

NMI:
  rti					; return

IRQ:
  rti

.segment "VECTORS" 			; Vectors point to handlers in code
.org $FFFA 
.word NMI 				; .word defines address, or label
.word RESET
.word IRQ	
