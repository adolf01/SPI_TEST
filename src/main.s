;
; File generated by cc65 v 2.18 - Git dbba5f3
;
	.fopt		compiler,"cc65 v 2.18 - Git dbba5f3"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_acia_putc
	.import		_acia_getc
	.import		_spi_write_to
	.export		_i
	.export		_c
	.export		_main

.segment	"DATA"

_i:
	.word	$0000

.segment	"BSS"

_c:
	.res	1,$00

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	ldx     #$28
	lda     #$0E
	jsr     pushax
	lda     #$15
	jsr     _spi_write_to
	ldx     #$28
	lda     #$0F
	jsr     pushax
	lda     #$F0
	jsr     _spi_write_to
L0002:	jsr     _acia_getc
	sta     _c
	cmp     #$08
	beq     L0005
	inc     _i
	bne     L0008
	inc     _i+1
	jmp     L0008
L0005:	lda     _i
	ora     _i+1
	beq     L0008
	lda     _i
	sec
	sbc     #$01
	sta     _i
	bcs     L0008
	dec     _i+1
L0008:	lda     _i
	ldx     _i+1
	jsr     pushax
	lda     _c
	jsr     _spi_write_to
	lda     _c
	jsr     _acia_putc
	jmp     L0002

.endproc

