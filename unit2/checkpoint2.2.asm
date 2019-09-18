  .file [name="checkpoint2.2.bin", type="bin", segments="XMega65Bin"]
.segmentdef XMega65Bin [segments="Syscall, Code, Data, Stack, Zeropage"]
.segmentdef Syscall [start=$8000, max=$81ff]
.segmentdef Code [start=$8200, min=$8200, max=$bdff]
.segmentdef Data [startAfter="Code", min=$8200, max=$bdff]
.segmentdef Stack [min=$be00, max=$beff, fill]
.segmentdef Zeropage [min=$bf00, max=$bfff, fill]
  .label RASTER = $d012
  .label VIC_MEMORY = $d018
  .label SCREEN = $400
  .label BGCOL = $d021
  .label COLS = $d800
  .const BLACK = 0
  .const WHITE = 1
  .const JMP = $4c
  .const NOP = $ea
.segment Code
main: {
    .label sc = 4
    .label msg = 2
    lda #$14
    sta VIC_MEMORY
    ldx #' '
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #WHITE
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #<SCREEN+$28
    sta.z sc
    lda #>SCREEN+$28
    sta.z sc+1
    lda #<MESSAGE
    sta.z msg
    lda #>MESSAGE
    sta.z msg+1
  b1:
    ldy #0
    lda (msg),y
    cmp #0
    bne b2
  b3:
    lda #$36
    cmp RASTER
    beq b4
    lda #$42
    cmp RASTER
    beq b4
    lda #BLACK
    sta BGCOL
    jmp b3
  b4:
    lda #WHITE
    sta BGCOL
    jmp b3
  b2:
    ldy #0
    lda (msg),y
    sta (sc),y
    inc.z sc
    bne !+
    inc.z sc+1
  !:
    inc.z msg
    bne !+
    inc.z msg+1
  !:
    jmp b1
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage(4) str, byte register(X) c, word zeropage(2) num)
memset: {
    .label end = 2
    .label dst = 4
    .label num = 2
    .label str = 4
    lda.z num
    bne !+
    lda.z num+1
    beq breturn
  !:
    lda.z end
    clc
    adc.z str
    sta.z end
    lda.z end+1
    adc.z str+1
    sta.z end+1
  b2:
    lda.z dst+1
    cmp.z end+1
    bne b3
    lda.z dst
    cmp.z end
    bne b3
  breturn:
    rts
  b3:
    txa
    ldy #0
    sta (dst),y
    inc.z dst
    bne !+
    inc.z dst+1
  !:
    jmp b2
}
syscall3f: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall3e: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall3d: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall3c: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall3b: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall3a: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall39: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall38: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall37: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall36: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall35: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall34: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall33: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall32: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall31: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall30: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall2f: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall2e: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall2d: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall2c: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall2b: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall2a: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall29: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall28: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall27: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall26: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall25: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall24: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall23: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall22: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall21: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall20: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall1f: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall1e: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall1d: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall1c: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall1b: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall1a: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall19: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall18: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall17: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall16: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall15: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall14: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall13: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
securexit: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
securentr: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall10: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall0f: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall0e: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall0d: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall0c: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall0b: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall0a: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall09: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall08: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall07: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall06: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall05: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall04: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall03: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall02: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
syscall01: {
    lda #'<'
    sta SCREEN+$4e
    rts
}
syscall00: {
    lda #'>'
    sta SCREEN+$4f
    rts
}
.segment Data
  MESSAGE: .text "checkpoint 2.2 by liu1382"
  .byte 0
.segment Syscall
SYSCALLS:
  .byte JMP
  .word syscall00
  .byte NOP
  .byte JMP
  .word syscall01
  .byte NOP
  .byte JMP
  .word syscall02
  .byte NOP
  .byte JMP
  .word syscall03
  .byte NOP
  .byte JMP
  .word syscall04
  .byte NOP
  .byte JMP
  .word syscall05
  .byte NOP
  .byte JMP
  .word syscall06
  .byte NOP
  .byte JMP
  .word syscall07
  .byte NOP
  .byte JMP
  .word syscall08
  .byte NOP
  .byte JMP
  .word syscall09
  .byte NOP
  .byte JMP
  .word syscall0a
  .byte NOP
  .byte JMP
  .word syscall0b
  .byte NOP
  .byte JMP
  .word syscall0c
  .byte NOP
  .byte JMP
  .word syscall0d
  .byte NOP
  .byte JMP
  .word syscall0e
  .byte NOP
  .byte JMP
  .word syscall0f
  .byte NOP
  .byte JMP
  .word syscall10
  .byte NOP
  .byte JMP
  .word securentr
  .byte NOP
  .byte JMP
  .word securexit
  .byte NOP
  .byte JMP
  .word syscall13
  .byte NOP
  .byte JMP
  .word syscall14
  .byte NOP
  .byte JMP
  .word syscall15
  .byte NOP
  .byte JMP
  .word syscall16
  .byte NOP
  .byte JMP
  .word syscall17
  .byte NOP
  .byte JMP
  .word syscall18
  .byte NOP
  .byte JMP
  .word syscall19
  .byte NOP
  .byte JMP
  .word syscall1a
  .byte NOP
  .byte JMP
  .word syscall1b
  .byte NOP
  .byte JMP
  .word syscall1c
  .byte NOP
  .byte JMP
  .word syscall1d
  .byte NOP
  .byte JMP
  .word syscall1e
  .byte NOP
  .byte JMP
  .word syscall1f
  .byte NOP
  .byte JMP
  .word syscall20
  .byte NOP
  .byte JMP
  .word syscall21
  .byte NOP
  .byte JMP
  .word syscall22
  .byte NOP
  .byte JMP
  .word syscall23
  .byte NOP
  .byte JMP
  .word syscall24
  .byte NOP
  .byte JMP
  .word syscall25
  .byte NOP
  .byte JMP
  .word syscall26
  .byte NOP
  .byte JMP
  .word syscall27
  .byte NOP
  .byte JMP
  .word syscall28
  .byte NOP
  .byte JMP
  .word syscall29
  .byte NOP
  .byte JMP
  .word syscall2a
  .byte NOP
  .byte JMP
  .word syscall2b
  .byte NOP
  .byte JMP
  .word syscall2c
  .byte NOP
  .byte JMP
  .word syscall2d
  .byte NOP
  .byte JMP
  .word syscall2e
  .byte NOP
  .byte JMP
  .word syscall2f
  .byte NOP
  .byte JMP
  .word syscall30
  .byte NOP
  .byte JMP
  .word syscall31
  .byte NOP
  .byte JMP
  .word syscall32
  .byte NOP
  .byte JMP
  .word syscall33
  .byte NOP
  .byte JMP
  .word syscall34
  .byte NOP
  .byte JMP
  .word syscall35
  .byte NOP
  .byte JMP
  .word syscall36
  .byte NOP
  .byte JMP
  .word syscall37
  .byte NOP
  .byte JMP
  .word syscall38
  .byte NOP
  .byte JMP
  .word syscall39
  .byte NOP
  .byte JMP
  .word syscall3a
  .byte NOP
  .byte JMP
  .word syscall3b
  .byte NOP
  .byte JMP
  .word syscall3c
  .byte NOP
  .byte JMP
  .word syscall3d
  .byte NOP
  .byte JMP
  .word syscall3e
  .byte NOP
  .byte JMP
  .word syscall3f
  .byte NOP
  .align $100
SYSCALL_RESET:
  .byte JMP
  .word main
  .byte NOP
