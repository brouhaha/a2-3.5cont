; Apple II 3.5 Disk Controller Card
; Firmware P/N 341-0438A
; Copyright (C) Apple Computer Inc. 1991
; Disassembly Copyright (C) Eric Smith 2014

fillto	macro	addr
	while	* < addr
size	set	addr-*
	if	size > 256
size	set	256
	endif
	fcb	[size] $00
	endm
	endm

fcchz	macro	string
	irpc	char,string
	fcb	$80+'char'
	endm
	fcb	$00
	endm

	cpu	65c02

D0100	equ	$0100
D01ab	equ	$01ab
D01af	equ	$01af
D01b1	equ	$01b1
D01b2	equ	$01b2
D0200	equ	$0200
slot_1_rom_copy	equ	$03ee	; first 16 bytes of host slot 1 ROM copied here
D03fe	equ	$03fe
D03ff	equ	$03ff
D0400	equ	$0400
D0403	equ	$0403
D0500	equ	$0500
D0503	equ	$0503
D05ff	equ	$05ff
D0600	equ	$0600
D0601	equ	$0601
D0602	equ	$0602
D0603	equ	$0603
D0620	equ	$0620
D0640	equ	$0640
D06eb	equ	$06eb
D06ef	equ	$06ef
D0741	equ	$0741
D07eb	equ	$07eb
D07ef	equ	$07ef


D0803	equ	$0803
D09ff	equ	$09ff

; SWIM chip - IWM registers
D0a00	equ	$0a00	; phase 0 off		data/corr (r/w)
D0a01	equ	$0a01	; phase 0 on		header (r/w)
D0a02	equ	$0a02	; phase 1 off		error (r)/CRC (w)
D0a03	equ	$0a03	; phase 1 on		param data (r/w)
D0a04	equ	$0a04	; phase 2 off		phase (r/w)
D0a05	equ	$0a05	; phase 2 on		setup (r/w)
D0a06	equ	$0a06	; phase 3 off		status (r)/write zeros (w)
D0a07	equ	$0a07	; phase 3 on		handshake (r)/write ones (w)
D0a08	equ	$0a08	; motor off
D0a09	equ	$0a09	; motor on
D0a0a	equ	$0a0a	; enable drive 1
D0a0b	equ	$0a0b	; enable drive 2
D0a0c	equ	$0a0c	; Q6 low
D0a0d	equ	$0a0d	; Q6 high
D0a0e	equ	$0a0e	; Q7 low
D0a0f	equ	$0a0f	; Q7 high

; IWM registers and states
; from IWM Design Spec  343-0041-B
; Q7 Q6 Motor-On    register operation selected    state name
; -- -- --------    ---------------------------    ----------
;  0  0    0            read all ones
;  0  0    1            read data reg
;  0  1    x            read status register        write protect sense
;  1  0    x            read write-handshake reg    write
;  1  1    0            write mode reg              mode set
;  1  1    1            write data reg              write load

; SWIM chip - ISM registers

ism_w_data	equ	$0a00
ism_r_data	equ	$0a08
ism_w_mark	equ	$0a01
ism_r_mark	equ	$0a09
ism_w_crc	equ	$0a02
ism_r_error	equ	$0a0a
ism_w_param	equ	$0a03
ism_r_param	equ	$0a0b
ism_w_phase	equ	$0a04
ism_r_phase	equ	$0a0c
ism_w_setup	equ	$0a05
ism_r_setup	equ	$0a0d
ism_w_zeros	equ	$0a06
ism_r_status	equ	$0a0e
ism_w_ones	equ	$0a07
ism_r_handshake	equ	$0a0f


D0a40	equ	$0a40
D0a41	equ	$0a41
D0a80	equ	$0a80
D0a81	equ	$0a81
D0aff	equ	$0aff

D0b00	equ	$0b00
D0b1f	equ	$0b1f
D0b20	equ	$0b20
D0b3f	equ	$0b3f
D0b40	equ	$0b40
D0b80	equ	$0b80
D0ba0	equ	$0ba0
D0bc0	equ	$0bc0
D0be0	equ	$0be0
D0bff	equ	$0bff
D0c00	equ	$0c00
D0c01	equ	$0c01
D0c02	equ	$0c02
D0c03	equ	$0c03
D0c04	equ	$0c04
D0c05	equ	$0c05
D0c06	equ	$0c06
D0c0c	equ	$0c0c
D0d00	equ	$0d00
D0d0c	equ	$0d0c
D0e00	equ	$0e00
D0f00	equ	$0f00

D1003	equ	$1003
D1203	equ	$1203
D2003	equ	$2003
D4003	equ	$4003

; locations in host slot pseudoROM (cn00)
D7b00	equ	$7b00	 ; host $cn00
D7b04	equ	$7b04
D7b0b	equ	$7b0b
D7b0d	equ	$7b0d
D7b17	equ	$7b17	; beq instruction loop to wait for diagnostic to load
D7b21	equ	$7b21
D7b23	equ	$7b23

; locations in host shared pseudoROM (c800-cfff)
D7c00	equ	$7c00	; host $cc00
D7c09	equ	$7c09	; host $cc09


; host side defines
HZ00	equ	$00
HZ01	equ	$01
HZ3c	equ	$3c
HZ3e	equ	$3e
HZ3f	equ	$3f
HZ40	equ	$40
HZ41	equ	$41
HZ42	equ	$42
HZ43	equ	$43
HZ44	equ	$44
HZ45	equ	$45
HZ46	equ	$46
HZ47	equ	$47
HZ48	equ	$48
HZ49	equ	$49
HZ4b	equ	$4b
HZ4c	equ	$4c
HZ4d	equ	$4d
HZ4e	equ	$4e
HZ4f	equ	$4f
HZ50	equ	$50
HZ51	equ	$51

HD0100	equ	$0100	; stack

mon_softev	equ	$03f2

HD0488	equ	$0488	; somewhere in text page 1
HD048d	equ	$048d
HD0606	equ	$0606

HD07f8	equ	$07f8	; host side screen hole, stores $c0+slot

HD0800	equ	$0800
HL0801	equ	$0801

HDc000	equ	$c000	; keyboard
HDc010	equ	$c010	; keyboard strobe reset
HDc02f	equ	$c02f
HDc035	equ	$c035
HDc036	equ	$c036
HDc068	equ	$c068
HDc080	equ	$c080
HDc082	equ	$c082

HDc100	equ	$c100	; why do we care what's in slot 1 ROM space?

; host side shared ROM space
HDc800	equ	$c800
HDc801	equ	$c801
HDc802	equ	$c802
HDc803	equ	$c803
HDc804	equ	$c804
HDc807	equ	$c807
HDc808	equ	$c808
HDc80b	equ	$c80b
HDc80c	equ	$c80c
HDc833	equ	$c833
HDc83f	equ	$c83f
HDc845	equ	$c845
HDc856	equ	$c856

HDca00	equ	$ca00
HDca02	equ	$ca02
HSca43	equ	$ca43
HScabf	equ	$cabf
HScb8c	equ	$cb8c
HScbaa	equ	$cbaa
HScbd9	equ	$cbd9
HD_slot_1_rom_copy	equ	$cbee
HDcbfe	equ	$cbfe
HDcbff	equ	$cbff

HDcfff	equ	$cfff	; turn off shared slot ROM

HLe000	equ	$e000	; ROM BASIC cold start (either Integer or Applesoft)

mon_sloop	equ	$faba
mon_settxt	equ	$fb39
mon_main_id	equ	$fbb3	; $06 for IIe or later
mon_sub_id	equ	$fbc0	; $e0 for enhanced IIe or IIgs
mon_home	equ	$fc58
mon_cr		equ	$fc62
mon_prbyte	equ	$fdda
mon_prhex	equ	$fde3
mon_cout	equ	$fded
mon_idroutine	equ	$fe1f
mon_setkbd	equ	$fe89
mon_setvid	equ	$fe93
mon_oldrst	equ	$ff59	; sets video and keyboard and enters monitor

reset_vec	equ	$fffc

	org	$8000
D8000:
	phase	$0000
Z00:	fcb	$ff
Z01:	fcb	$ff
Z02:	fcb	$00
Z03:	fcb	$ff
Z04:	fcb	$00
Z05:	fcb	$ff
Z06:	fcb	$ff
Z07:	fcb	$00
Z08:	fcb	$00
Z09:	fcb	$00
Z0a:	fcb	$00
Z0b:	fcb	$00
Z0c:	fcb	$00
Z0d:	fcb	$ff
	fcb	$ff
Z0f:	fcb	$80
	fcb	$80
Z11:	fcb	$00
	fcb	$00
Z13:	fcb	$00
Z14:	fcb	$ff
Z15:	fcb	$ff
Z16:	fcb	$ff
Z17:	fcb	$ff
Z18:	fcb	$ff
Z19:	fcb	$ff
Z1a:	fcb	$00
Z1b:	fcb	$ff
Z1c:	fcb	$ff
	fcb	$00
Z1e:	fcb	$ff
Z1f:	fcb	$00
Z20:	fcb	$00
Z21:	fcb	$00
Z22:	fcb	$00
Z23:	fcb	$00
Z24:	fcb	$00
	fcb	$00
	fcb	$00
Z27:	fcb	$00
Z28:	fcb	$00
Z29:	fcb	$00
Z2a:	fcb	$00
Z2b:	fcb	$00
Z2c:	fcb	$00
Z2d:	fcb	$00
Z2e:	fcb	$00
Z2f:	fcb	$00
Z30:	fcb	$00
	fcb	$00
Z32:	fcb	$00
Z33:	fcb	$00
Z34:	fcb	$00
	fcb	$00
	fcb	$00
	fcb	$00
Z38:	fcb	$00
Z39:	fcb	$00
Z3a:	fcb	$00
	fcb	$00
	fcb	$00
	fcb	$00
	fcb	$00
Z3f:	fcb	$00
Z40:	fcb	$00
	fcb	$00
Z42:	fcb	$00
	fcb	$00
Z44:	fcb	$00
	fcb	$00
Z46:	fcb	$00
	fcb	$00
Z48:	fcb	$00
	fcb	$00
Z4a:	fcb	$00
	fcb	$00
Z4c:	fcb	$00
Z4d:	fcb	$00
Z4e:	fcb	$00
Z4f:	fcb	$00
Z50:	fcb	$00
Z51:	fcb	$00
	fcb	$00
	fcb	$00
	fcb	$00
	fcb	$00
Z56:	fcb	$00
Z57:	fcb	$00
Z58:	fcb	$00
Z59:	fcb	$00
Z5a:	fcb	$00
Z5b:	fcb	$00
Z5c:	fcb	$00
Z5d:	fcb	$00
Z5e:	fcb	$00
Z5f:	fcb	$00
Z60:	fcb	$00
Z61:	fcb	$00
Z62:	fcb	$04
Z63:	fcb	$80
Z64:	fcb	$00
Z65:	fcb	$05
Z66:	fcb	$00
Z67:	fcb	$00
Z68:	fcb	$00
Z69:	fcb	$00
Z6a:	fcb	$00
Z6b:	fcb	$00
Z6c:	fcb	$00
Z6d:	fcb	$00
Z6e:	fcb	$00
Z6f:	fcb	$80

Z70:	fcb	$1b
Z71:	fcb	$00

; Hooks
; see _Apple IIgs Firmware Reference_,
; Chapter 7: SmartPort Firmware,
; "UniDisk 3.5 internal functions",
; "Hook table" (p. 145)
Z72:	jmp	Le50a	; RdAddr?
Z75:	jmp	Le619	; ReadData?
Z78:	jmp	Le889	; WriteData?
Z7b:	jmp	Ld5db	; Seek?
Z7e:	jmp	Lefb0	; Format?
Z81:	jmp	Lf0fc	; WriteTrk?
Z84:	jmp	Lf1ea	; Verify?

; zero page jump vectors (not hooks)
Z87:	jmp	Sd1e7
Z8a:	jmp	Ld112

; Mark table
; see _Apple IIgs Firmware Reference_,
; Chapter 7: SmartPort Firmware,
; "SmartPort calls specific to Apple 3.5 disk drive",
; SetMark (control code $07)  (pp. 140-141)
; and
; "UniDisk 3.5 internal functions",
; "Mark table" (pp. 144-145)

Z8d:	fcb	$ff			; sector number

; data mark (reverse order)
Z8e:	fcb	$ad,$aa,$d5		; data mark

Z91:	fcb	$ff

Z92:	fcb	$fc,$f3,$cf,$3f,$ff	; sync bytes

; bit-slip mark (reverse order)
Z97:	fcb	$ff,$aa,$de		; bit-slip mark
	fcb	$ff

	fcb	$ff,$ff,$ff,$ff		; interheader gap

; address mark (reverse order)
Z9f:	fcb	$96,$aa,$d5
	fcb	$ff

; end of Mark table

Za3:	fcb	$00
Za4:	fcb	$00
Za5:	fcb	$00
Za6:	fcb	$00
	fcb	$00
	fcb	$00
	fcb	$00
	fcb	$00
Zab:	fcb	$00
Zac:	fcb	$00
Zad:	fcb	$00
Zae:	fcb	$00
Zaf:	fcb	$00
Zb0:	fcb	$00
Zb1:	fcb	$00
Zb2:	fcb	$00
	fcb	$00
Zb4:	fcb	$00
Zb5:	fcb	$00
Zb6:	fcb	$00
	fcb	$00
	fcb	$00
Zb9:	fcb	$00
Zba:	fcb	$00
Zbb:	fcb	$00

Zbc:	fcb	$4a,$cf,$41,$55

	fillto	$00e0

Ze0:	fcb	$00
Ze1:	fcb	$00
Ze2:	fcb	$00
Ze3:	fcb	$00
Ze4:	fcb	$00

	fillto	$00fc

Zfc:	fdb	$0000	; used to accumulate CRC16 of ROM
Zfe:	fdb	$0000	; pointer used for ROM checksum and
			; CRC16 computation, and ROM copying

	dephase

	fillto	$8100

D8100:
	phase	$c600
	cpu	6502		; host CPU might be 6502, 65C02, or 65816

; host-side slot ROM

; boot entry point
HLcn00:	ldx	#$20		; cn01 must be $20 for block device
	ldx	#$00		; cn03 must be $00 for block device
HLcn04:	ldy	#$03		; cn05 must be $03 for block device
	lda	#$00		; cn07 must be $00 for SmartPort device
	sec
	adc	#$7f
HLcn0b:	bvs	HLcn0b

; diagnostic entry point at $Cn0d
HLcn0d:	php
	sei
	bit	HDcfff
	jsr	HScf38
HLcn15:	plp
	tax
HL_diag_load_wait:
	beq	HL_diag_load_wait	; Wait for host side of diagnostic code
				; to be loaded into shared pseudoROM.
				; Card diag code two instructions after
	jmp	HLcc00

; ProDOS entry point
HLcn1c:	clc
	bcc	HLcn20

; Protocol Converter (SmartPort) entry point
; must be at ProDOS entry point + 3
	sec

; wait for card firmware to be ready
HLcn20:	clv
HLcn21:	bvc	HLcn21		; card firmware will change this branch
				; target to HLcn23

HLcn23:	php			; save carry (ProDOS vs. SmartPort) and
				; interrupt enable state
	sei			; disable interrupts

	lda	HDcfff		; turn off other cards' shared ROM

; get $C0 + slot number
	jsr	HScc08		; known ret instruction
	tsx
	lda	HD0100,x
	sta	HD07f8

	tay
	ldx	HD_slotmap,y	; map $C0+slot to slot*10

	lda	HDc082,x
	jsr	HScfd9

; copy parameters to card
	ldx	#$12
HLcn3e:	lda	HZ40-1,x	; HZ40..HZ51 copied to HDCa02..HDCa13
	sta	HDca02-1,x
	dex
	bne	HLcn3e

	plp			; restore carry (ProDOS vs. SmartPort) and
				; previous interrupt state

	ldx	HD_slotmap,y	; map $C0+slot to slot*10
	lda	HDc080,x
	bvc	HLcn54

	jsr	HScabf
	beq	HLcn15

HLcn54:	bit	HDcc09
	bpl	HLcn5f

	jsr	HDca00

	ldy	HD07f8

HLcn5f:	bcc	HLcna9		; if carry clear, go handle ProDOS command

	pla			; pop ret address as ptr to SmartPort command
	sta	HZ40
	pla
	sta	HZ41

	ldy	#$01		; first byte is command number
	lda	(HZ40),y
	sta	HZ50
	iny

	lda	(HZ40),y	; second and third bytes are param list pointer
	sta	HZ4c
	iny
	lda	(HZ40),y
	sta	HZ4d
	iny

	lda	(Z40),y
	dey

	bit	HZ50		; is it an extended SmartPort command?
	bvc	HLcn86		;   no

	ldy	#$05		; yes, command is longer

	bit	HDcc09		; on a IIgs?
	bvs	HLcn88		;   yes

HLcn86:	lda	#$00		; high byte of param list pointer is zero

HLcn88:	sta	HZ4e		; store high byte of param list pointer

	tya			; compute return address
	clc
	adc	HZ40
	tax
	lda	#$00
	adc	HZ41

	pha			; push new return address
	txa
	pha

	jsr	HSca43

	lda	HZ43
	and	#$bf
	cmp	#$0c
	bcc	HLcnb7

HLcna1:	lda	#$01
	bne	HLcnbc		; always taken

	lda	#$11
	bne	HLcnbc		; always taken


; handle ProDOS command
HLcna9:	lda	HZ42
	cmp	#$04
	bcs	HLcna1

	jsr	HScefe

	lda	HZ43
	clc
	adc	#$8c
HLcnb7:	jsr	HScbd9

	lda	HZ50


HLcnbc:	pha			; push error code
	lda	HZ4e		; push X and Y result
	pha
	lda	HZ4f
	pha

	ldy	HD07f8
	ldx	HD_slotmap,y	; map $C0+slot to slot*10
	lda	HDc082,x

	ldx	#$00		; copy parameters from card back to host
HLcnce:	ldy	HDca02,x
	sty	HZ40,x
	inx
	cpx	#$12
	bcc	HLcnce

	lda	#$00
	sta	HDca00

	pla			; pop Y, X, and error code
	tay
	pla
	tax
	pla

	cmp	#$01		; set carry flag if error code non-zero
	ora	#$00		; set zero flag appropriately
	rts


; copy first 16 bytes of slot 1 ROM into our pseudoROM
HLcne7:	ldy	#$0f
HLcne9:	lda	HDc100,y
	bit	HDcfff
	sta	HD_slot_1_rom_copy,y
	dey
	bpl	HLcne9
	rts


	fillto	$c6fb

HDcnfb:	fcb	$c0	; SmartPort ID type byte
			;   bit 7=1: supports extended commands (32-bit)
			;   bit 6=1: supports additional commands
			;            (see _Apple IIgs Firmware Reference
			;                  1 MB Apple IIgs Update)
			;                SetFormatOption ($0a, $4a)
			;                GetFOrmatOption ($0b, $4b)
			;   bit 1=0: not SCSI
			;   bit 0=0: not RAM card

HDcnfc:	fdb	$00	; ProDOS block count

HDcnfe:	fcb	$bf	; ProDOS block device characteristics
			;   bit 7=1: removable medium
			;   bit 6=0: not interruptible
			;   bits 5..4=11:  
			;   bit 3=1: supports formatting
			;   bit 2=1: supports write
			;   bit 1=1: supports read
			;   bit 0=1: supports status
HDcnff:	fcb	HLcn1c & $ff	; pointer to ProDOS entry
; end of slot ROM
	dephase

D8200:
	phase	$ca00

HSca00:	php
	sei
	lda	HDc068
	pha
	ldx	#$0a
HLca08:	eor	#$0e
	sta	HDc068
	cmp	HDc068
	bne	HLca31
	dex
	bne	HLca08
	pla
	sta	HDc068

; Determine host type
	lda	mon_main_id	; IIe or newer?
	cmp	#$06
	bne	HLca32		;   no

	lda	mon_sub_id
	cmp	#$e0		; enhanced IIe or IIgs?
	bne	HLca32		;   no

	sec			; IIgs?
	jsr	mon_idroutine
	bcs	HLca32		;   no

	lda	#$7f
	bne	HLca34

HLca31:	pla

HLca32:	lda	#$7e
HLca34:	bit	HDc800
	bpl	HLca34
	sta	HDc800
HLca3c:	bit	HDc800
	bpl	HLca3c
	plp
	rts

	bit	HZ50
	bvs	HLca64
	ldy	#$08
HLca49:	tax
	lda	(HZ4c),y
	dey
	bmi	HLca5d
	cpy	#$03
	bcc	HLca58
	sta	HZ43,y
	bcs	HLca49
HLca58:	sta	HZ41,y
	bcc	HLca49
HLca5d:	iny
	sty	HZ44
	sty	HZ4b
	beq	HLca7a
HLca64:	ldy	#$0b
HLca66:	tax

	bit	HDcc09
	bvs	HLca70

	lda	(HZ4c),y
	bvc	HLca72

HLca70:	
	cpu	65816
	assume	m:1
	ldal	(HZ4c),y	; NOTE: HZ4c is a 24-bit pointer!  IIgs only
	cpu	65c02

HLca72:	dey
	bmi	HLca7a
	sta	HZ41,y
	bpl	HLca66
HLca7a:	ldy	HZ50
	sta	HZ50
	lda	HZ42
	sta	HZ40
	lda	HZ43
	sta	HZ41
	lda	HZ44
	sta	HZ42
	stx	HZ44
	sty	HZ43
	rts

tablh	macro	namel,nameh
namel	label	*
nameh	label	*+(ARGCOUNT-2)
	shift
	shift
	irp	addr,ALLARGS
	fcb	(addr-1) & $ff
	endm
	irp	addr,ALLARGS
	fcb	(addr-1) >> 8
	endm
	endm

	tablh	HDca8f,HDca9f,HLcc3e,HLcd52,HLcde6,HLcc0a,HLcca1,HLcd34,HLcc0a,HLcc0a,HLcc3e,HLcc92,HLcd0c,HLcc3e,HLcc11,HLcd52,HLcde6,HLcc0a

; required arg length?
HDcaaf:	fcb	$03,$03,$03,$01,$03,$01,$01,$01
	fcb	$04,$04,$03,$03,$ff,$ff,$ff,$ff

	stx	HZ51
	jsr	HSca00
	lda	#$00
	sta	HZ4e
	sta	HZ4f
	ldx	#$03
	stx	HZ3c
	ldy	mon_main_id
	cpy	#$06
	beq	HLcadc
	lda	HDc000
	ora	#$80
	bmi	HLcb02
HLcadc:	bit	HDc010
	bpl	HLcb1e
	bmi	HLcae6

HLcae3:	sta	HDc010
HLcae6:	lda	HDc000
	bmi	HLcb02
	cpy	#$06
	bne	HLcaf4
	bit	HDc010
	bpl	HLcb1e
HLcaf4:	inc	HZ4e
	bne	HLcae6
	inc	HZ4f
	bne	HLcae6
	dec	HZ3c
	bne	HLcae6
	beq	HLcb1e

HLcb02:	cmp	#$84
	bne	HLcb1e
	dex
	bne	HLcae3
	php
	sei
	pla
	tay
	pla
	sta	HZ4e
	pla
	sta	HZ4f
	tya
	pha
	lda	HZ4f
	pha
	lda	HZ4e
	pha
	jmp	HScf38

HLcb1e:	ldx	#$03
HLcb20:	lda	HDc800
	bmi	HLcb36
	inc	HZ4e
	bne	HLcb20
	inc	HZ4f
	bne	HLcb20
	dex
	bne	HLcb20
	lda	#$30
	sta	HZ50
	bne	HLcb87
HLcb36:	lda	#$ff
	sta	HDc801
	lda	#$00
	sta	HDc803
	lda	#$81
	sta	HZ43
	lda	#$0c
	sta	HDc800
	lda	#$08
	sta	HZ41
	lda	#$00
	sta	HZ40
	sta	HZ42
	jsr	HScd55
	ldx	HZ51
	cmp	#$01
	bcs	HLcb87
	lda	#$01
	sta	HZ42
	stx	HZ43
	lda	#$08
	sta	HZ45
	lda	#$00
	sta	HZ44
	sta	HZ46
	sta	HZ47
	lda	HD0800
	cmp	#$01
	bne	HLcb87
	lda	HL0801
	beq	HLcb87
	lda	#$00	; 0 .

	bit	HDcc09
	bvc	HLcb84

	sta	HDc035
HLcb84:	jmp	HL0801

HLcb87:	stx	HZ51
	jmp	HLcf53

Pcb8c:	bit	HZ43
	bpl	HLcba9
	cmp	#$00
	beq	HLcba9
	cmp	#$2b
	beq	HLcba9
	cmp	#$28
	beq	HLcba9
	cmp	#$2f
	beq	HLcba9
	cmp	#$11
	bne	HLcba7
	lda	#$28
	rts

HLcba7:	lda	#$27
HLcba9:	rts

Pcbaa:	cpy	#$10
	beq	HLcbb9
	lda	#$2b
	cpy	#$14
	beq	HLcbb6
	lda	#$2f
HLcbb6:	sta	HDc856
HLcbb9:	rts

	fillto	$cbd4

HLcbd4:	lda	#$04
	sta	HZ50
	rts

Pcbd9:	ldy	HD07f8
	ldx	HD_slotmap,y	; map $C0+slot to slot*10
	stx	HZ51
	tax
	lda	HDcaaf,x
	bmi	HLcbeb
	cmp	HZ50
	bne	HLcbd4
HLcbeb:	lda	HDca9f,x
	pha
	lda	HDca8f,x
	pha
	lda	#$00
	sta	HZ50
	sta	HZ4f
	sta	HZ4e
	ldx	HZ51
	jsr	HScfb1

HLcc00:	lda	HDc080,x
HLcc03:	lda	HDc800
	bpl	HLcc03

HScc08:	rts

HDcc09:	fcb	$80

HLcc0a:	jsr	HSced6
	clc
	jmp	HLceb4

HLcc11:	lda	#$00
	sta	HZ46
	jsr	HSced6
HLcc18:	lda	HDc801
	bmi	HLcc18
	beq	HLcc3b
	jsr	HScd3b
	ldy	#$02
	lda	(HZ4c),y
	sta	HZ4f
	dey
	lda	(HZ4c),y
	sta	HZ4e
	dey
	lda	(HZ4c),y
	and	#$14
	tay
	ldx	HZ51
	lda	HDc080,x
	jsr	HScbaa

HLcc3b:	jmp	HLceb3

HLcc3e:	lda	HZ46
	sta	HDc80b
	lda	HZ47
	sta	HDc80c
	jsr	HSced6
HLcc4b:	lda	HDc801
	bmi	HLcc4b
	beq	HLcc6f
	ldx	HDc80b
	stx	HZ4e
	ldx	HDc80c
	stx	HZ4f
	jsr	HScd3b
	ldx	HZ4f
	beq	HLcc67
	sec
	jsr	HScc72
HLcc67:	ldx	HZ4e
	beq	HLcc6f
	clc
	jsr	HScc72
HLcc6f:	jmp	HLceb3

HScc72:	ldy	#$00
HLcc74:	lda	(HZ4c),y

	bit	HDcc09
	bvc	HLcc7f

	cpu	65816
	assume	m:1
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	bvs	HLcc81
	cpu	65c02

HLcc7f:	sta	(HZ40),y
HLcc81:	iny
	bcc	HLcc8e
	bne	HLcc74
	inc	HZ4d
	inc	HZ41
	bne	HLcc8e
	inc	HZ42
HLcc8e:	dex
	bne	HLcc74
	rts

HLcc92:	lda	HZ46
	sta	HDc80b
	pha
	lda	HZ47
	sta	HDc80c
	pha
	jmp	HLccc6

HLcca1:	ldy	#$00

	bit	HDcc09
HLcca6:	bvc	HLccac

	cpu	65816
	assume	m:1
	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	bvs	HLccae
	cpu	65c02

HLccac:	lda	(HZ40),y
HLccae:	sta	HDc80b,y
	pha
	iny
	cpy	#$01
	beq	HLcca6
	lda	HZ40
	clc
	adc	#$02
	sta	HZ40
	bcc	HLccc6
	inc	HZ41
	bne	HLccc6
	inc	HZ42
HLccc6:	jsr	HSced6
HLccc9:	lda	HDc801
	bmi	HLccc9
	beq	HLcce7
	jsr	HScd3b
	pla
	tax
	beq	HLccdb
	sec
	jsr	HSccec
HLccdb:	pla
	tax
	beq	HLcce3
	clc
	jsr	HSccec
HLcce3:	clc
	jmp	HLceb4

HLcce7:	pla
	pla
	jmp	HLceb3

HSccec:	ldy	#$00

HLccee:	bit	HDcc09
	bvc	HLccf7

	cpu	65816
	assume	m:1
	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	bvs	HLccf9
	cpu	65c02

HLccf7:	lda	(HZ40),y
HLccf9:	sta	(HZ4c),y
	iny
	bcc	HLcd08
	bne	HLccee
	inc	HZ4d
	inc	HZ41
	bne	HLcd08
	inc	HZ42
HLcd08:	dex
	bne	HLccee
	rts

HLcd0c:	lda	#$00
	ldx	HZ46
	sta	HZ46
	sta	HZ47
	sta	HZ48
	sta	HZ49
	beq	HLcd34
	cpx	#$05
	bcc	HLcd20
	ldx	#$04
HLcd20:	ldy	#$00

HLcd22:	bit	HDcc09
	bvc	HLcd2b

	cpu	65816
	assume	m:1
	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	bvs	HLcd2d
	cpu	65c02

HLcd2b:	lda	(HZ40),y
HLcd2d:	sta	HZ46,y
	iny
	dex
	bne	HLcd22
HLcd34:	jsr	HSced6
	clc
	jmp	HLceb4

HScd3b:	and	#$1f
	lsr
	php
	clc
	adc	HZ51
	tax
	lda	HDc080,x
	lda	#$00
	sta	HZ4c
	plp
	rol
	asl
	adc	#$c8
	sta	HZ4d
	rts

HLcd52:	jsr	HSced6
HScd55:	lda	HDc801
	bmi	HScd55
	bne	HLcd62
	lda	HDc856
	jmp	HLcd7c

HLcd62:	jsr	HScd3b
	ldx	#$02
	ldy	#$00

	bit	HDcc09
	bvs	HLcd80

; Apple IIe (65C02) read loop
HLcd6e:	lda	(HZ4c),y
	sta	(HZ40),y
	iny
	bne	HLcd6e
	inc	HZ4d
	inc	HZ41
	dex
	bne	HLcd6e
HLcd7c:	sec
	jmp	HLcead

; Apple IIgs (65816) read loop
	cpu	65816
	assume	m:1
HLcd80:	clc
	xce
	php
	lda	HDc036
	pha
	ora	#$80
	sta	HDc036
	lda	#$02
	bit	HZ4d

	rep	#$20		; clear 65816 M bit for 16-bit data
	assume	m:0

	bne	HLcdb8

HLcd94:	lda	HDc800,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny
	iny
	lda	HDc800,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny
	iny
	bne	HLcd94

	inc	HZ41
HLcda6:	lda	HDc800+$100,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny
	iny
	lda	HDc800+$100,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny
	iny
	bne	HLcda6
	beq	HLcdda

HLcdb8:	lda	HDc800+$200,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny	
	iny
	lda	HDc800+$200,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny
	iny
	bne	HLcdb8

	inc	HZ41
HLcdca:	lda	$c800+$300,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny
	iny
	lda	$c800+$300,y
	stal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!  IIgs only
	iny
	iny
	bne	HLcdca

HLcdda:	sep	#$30		; set 65816 M bit for 8-bit data,
	assume	m:1		;    and X bit for 8-bit indexing
	assume	x:1

	pla
	sta	HDc036
	plp
	xce
	sec
	jmp	HLcead

	cpu	65c02

HLcde6:	jsr	HSced6
HLcde9:	ldx	HDc801
	bmi	HLcde9
	bne	HLcdf3
	jmp	HLceb3

HLcdf3:	lda	HDc804
	php
	bpl	HLcdff
	sei
	lda	#$c0
	sta	HDc804
HLcdff:	txa
	jsr	HScd3b

	ldy	#$00

	bit	HDcc09		; bit 6 set for IIgs
	bvs	HLce1e

; Apple IIe (65C02) write loop
	plp
	ldx	#$02
HLce0d:	lda	(HZ40),y
	sta	(HZ4c),y
	iny
	bne	HLce0d
	inc	HZ41
	inc	HZ4d
	dex
	bne	HLce0d
	jmp	HLceac

; Apple IIgs (65816) write loop
	cpu	65816
	assume	m:1
HLce1e:	clc
	xce
	php
	lda	HDc036
	pha
	ora	#$80
	sta	HDc036
	phx
	lda	#$02
	bit	Z4d

	rep	#$20		; clear 65816 M bit for 16-bit data
	assume	m:0

	bne	HLce67
HLce33:	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!
	sta	HDc800,y
	iny
	iny
	ldal	(HZ40),y
	sta	HDc800,y	; NOTE: HZ40 is a 24-bit pointer!
	iny
	iny
	bne	HLce33
	inc	HZ41

	sep	#$20		; set 65816 M bit for 8-bit data
	assume	m:1

	ldx	HZ51
	lda	HDc080,x
	inc	HDc804
	plx
	lda	HDc080,x

	rep	#$20		; clear 65816 M bit for 16-bit data
	assume	m:0

HLce55:	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!
	sta	HDc800+$100,y
	iny
	iny
	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!
	sta	HDc800+$100,y
	iny
	iny
	bne	HLce55
	beq	HLce99

HLce67:	ldal	(HZ40),y
	sta	HDc800+$200,y
	iny
	iny
	ldal	(HZ40),y
	sta	HDc800+$200,y
	iny
	iny
	bne	HLce67

	inc	HZ41

	sep	#$20		; set 65816 M bit for 8-bit data
	assume	m:1

	ldx	HZ51
	lda	HDc080,x
	inc	HDc804
	plx
	lda	HDc080,x

	rep	#$20		; clear 65816 M bit for 16-bit data
	assume	m:0

HLce89:	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!
	sta	HDc800+$300,y
	iny
	iny
	ldal	(HZ40),y	; NOTE: HZ40 is a 24-bit pointer!
	sta	HDc800+$300,y
	iny
	iny
	bne	HLce89

HLce99:	sep	#$30		; set 65816 M bit for 8-bit data,
	assume	m:1		;    and X bit for 8-bit indexing
	assume	x:1

	pla
	sta	HDc036
	plp
	xce
	ldx	HZ51
	lda	HDc080,x
	lda	#$d0
	sta	HDc804
	plp

	cpu	65c02

HLceac:	clc
HLcead:	lda	#$02
	sta	HZ4f
	bne	HLceb4
HLceb3:	sec
HLceb4:	ldx	HZ51
	lda	HDc080,x
	lda	HDc801
	ora	#$f0
	sta	HDc801
	bcs	HLcec8
HLcec3:	lda	HDc800
	bpl	HLcec3
HLcec8:	lda	HDc856
	jsr	HScb8c
	sta	HZ50
	ldx	#$00
	stx	HDc856
	rts

HSced6:	lda	HDc800
	bpl	HSced6
	lda	#$ff
	sta	HDc801
	txa
	pha
	ldx	#$08
HLcee4:	lda	HZ43,x
	sta	HDc802,x
	dex
	bpl	HLcee4
	pla
	tax
	lda	HDc802
	and	#$1f
	sta	HDc800
	rts

; table used to map $C0+slot to slot*10
HD_slotmap	equ	*-$c1
	fcb	$10,$20,$30,$40,$50,$60,$70

HScefe:	ora	#$80
	ldx	HZ43
	sta	HZ43
	lda	HZ44
	sta	HZ40
	lda	HZ45
	sta	HZ41
	lda	#$00
	sta	HZ42
	sta	HZ48
	sta	HZ49
	txa
	and	#$70
	beq	HLcf35
	lsr
	lsr
	lsr
	lsr
	ora	#$c0
	sta	HZ44
	lda	#$00
	cpy	HZ44
	beq	HLcf31
	lda	#$c0
	eor	HZ44
	cmp	#$02
	beq	HLcf31
	lda	#$04
HLcf31:	cpx	#$80
	adc	#$01
HLcf35:	sta	HZ44
	rts

HScf38:	tsx
	lda	HD0100+2,x
	sta	HD07f8
	tay
	ldx	HD_slotmap,y	; map $C0+slot to slot*10
	lda	HDc080,x
HLcf46:	bit	HDc800
	bpl	HLcf46
	lda	#$3d
	sta	HDc800
	lda	#$00
	rts

HLcf53:	bit	HDc082
	lda	HZ00
	bne	HLcf64
	lda	HZ01
	cmp	HD07f8
	bne	HLcf64
	jmp	mon_sloop

HLcf64:	jsr	mon_setvid
	jsr	mon_setkbd
	jsr	mon_settxt
	jsr	mon_home
	ldy	#$00
	lda	HZ50
	cmp	#$30
	bne	HLcf7a
	ldy	#HDcf9a-HDcf8b
HLcf7a:	ldx	#$00
HLcf7c:	lda	HDcf8b,y
	beq	HLcf88
	sta	HD0488,x
	iny
	inx
	bne	HLcf7c
HLcf88:	jmp	HLe000

HDcf8b:	fcchz	"UNABLE TO BOOT"
HDcf9a:	fcchz	"CONTROLLER NEVER READY"

HScfb1:	lda	HZ44
	beq	HLcfca
	cmp	#$05
	bcs	HLcfca
	tya
	pha
	txa
	pha
	lda	HDc082,x
	jsr	HScfcb
	pla
	tax
	lda	HDc080,x
	pla
	tay
HLcfca:	rts

HScfcb:	lda	#$cb
	pha
	ldx	HZ44
	lda	HDcfd5-1,x
	pha
	rts

HDcfd5:	fcb	$7f,$9f,$bf,$df

HScfd9:	bvs	HLcfe0

	bit	HDcc09
	bpl	HLcfe6

HLcfe0:	lda	#$00
	sta	HDca00
	rts

HLcfe6:	bit	HDca00
	bmi	HLcff1
	lda	#$80
	sta	HDca00
	rts

HLcff1:	pla
	pla
	lda	#$01
	plp
	sec
	rts

	fillto	$d000
	dephase

; 8800-8dff is host diagnostic code, copied into host shared ROM space
; at host ca00-cfff
D8800:
	phase	$ca00

H2Lca00:
	jsr	mon_cr
	lda	#msg_table_heading >> 8
	sta	HZ3f
	lda	#msg_table_heading & $ff
	jsr	H2Scea7
	lda	HDc833
	tax
	jsr	mon_prhex
	jsr	mon_cr
	txa
	bne	H2Lca1c
	jmp	H2Lcac9

H2Lca1c:
	lda	#$01
	pha
H2Lca1f:
	pla
	pha
	tay
	jsr	mon_prhex
	lda	HDc833,y
	cmp	#$01
	bne	H2Lca34
	lda	#$a4
	jsr	H2Scea7
	jmp	H2Lca52

H2Lca34:
	cmp	#$03
	bne	H2Lca40
	lda	#$b1
	jsr	H2Scea7
	jmp	H2Lca52

H2Lca40:
	cmp	#$80
	bne	H2Lca52
	lda	#$97
	jsr	H2Scea7
	jmp	H2Lcab9

	jsr	H2Scafe
	jmp	H2Lcab9

H2Lca52:
	pla
	pha
	tay
	lda	HDc83f,y

	cmp	#$02
	bne	H2Lca64
	lda	#msg_400k & $ff
	jsr	H2Scea7
	jmp	H2Lca9e

H2Lca64:
	cmp	#$08
	bne	H2Lca70
	lda	#msg_720k & $ff
	jsr	H2Scea7
	jmp	H2Lca9e

H2Lca70:
	cmp	#$04
	bne	H2Lca7a
	jsr	H2Scaf8
	jmp	H2Lca9e

H2Lca7a:
	cmp	#$06
	bne	H2Lca84
	jsr	H2Scaf8
	jmp	H2Lca9e

H2Lca84:
	cmp	#$0a
	bne	H2Lca8e
	jsr	H2Scaf2
	jmp	H2Lca9e

H2Lca8e:
	cmp	#$0c
	bne	H2Lca98
	jsr	H2Scaf2
	jmp	H2Lca9e

H2Lca98:
	jsr	H2Scafe
	jmp	H2Lcab9

H2Lca9e:
	pla
	pha
	cmp	#$03
	bcs	H2Lcab9
	tay
	lda	HDc845,y
	and	#$20
	beq	H2Lcab4
	lda	#msg_yes & $ff
	jsr	H2Scea7
	jmp	H2Lcab9

H2Lcab4:
	lda	#msg_no & $ff
	jsr	H2Scea7
H2Lcab9:
	pla
	tay
	cmp	HDc833
	beq	H2Lcac9
	iny
	tya
	pha
	jsr	mon_cr
	jmp	H2Lca1f
H2Lcac9:
	jsr	mon_cr
	jsr	mon_cr
	jsr	H2Scebd
	lda	#msg_passed_rw_for_unit & $ff
	jsr	H2Scea7
	lda	#$01
	jsr	mon_prhex
	jsr	mon_cr
	jsr	H2Scebd
	lda	#msg_passed_rw_for_unit & $ff
	jsr	H2Scea7
	lda	#$02
	jsr	mon_prhex
	jsr	mon_cr
	jsr	H2Scebd

H2Scaf2:
	lda	#msg_1440k & $ff
	jsr	H2Scea7
	rts

H2Scaf8:
	lda	#msg_800k & $ff
	jsr	H2Scea7
	rts

H2Scafe:
	lda	#msg_unknown_size & $ff
	jsr	H2Scea7
	rts

	fillto	$cb3f

msg_passed_rw_for_unit:
	fcchz	"Passed R/W for Unit "

; cb54
	fcchz	"R/W Failure on block $"

; cb6b
	fcchz	"  Err=$"

msg_table_heading:
	fcchz	"# Unit        Volume  W/P   Drives="

; cb97
	fcchz	" UniDisk 3.5"

; cba4
	fcchz	" Apple 3.5  "

; cbb0
	fcchz	" Apple FDHD "

msg_400k:
	fcchz	" 400K "

msg_720k:
	fcchz	" 720K "

msg_800k:
	fcchz	" 800K "

msg_1440k:
	fcchz	" 1440K"

msg_unknown_size:
	fcchz	"  ??? "

msg_yes:
	fcchz	"   YES"

msg_no:
	fcchz	"   NO"
	
	fillto	$cc00

H2Lcc00:
	sei
	jsr	mon_setvid
	jsr	mon_setkbd
	jsr	mon_settxt
	jsr	mon_home
	lda	#$ff
	sta	HZ43
	lda	#$06
	cmp	mon_main_id
	beq	H2Lcc1c
	lda	#$df
	sta	HZ43
H2Lcc1c:
	lda	#msg_banner >> 8
	sta	HZ3f
	lda	#msg_banner & $ff
	jsr	H2Scea7
	jsr	mon_cr
	lda	#msg_credit & $ff
	jsr	H2Scea7
	jsr	mon_cr
	lda	#msg_copyright & $ff
	jsr	H2Scea7
	jsr	mon_cr
	jsr	mon_cr
	lda	#msg_tests & $ff
	jsr	H2Scea7
	jsr	mon_cr
	lda	#msg_slot & $ff
	jsr	H2Scea7
	lda	HD07f8
	jsr	mon_prhex
	lda	HD07f8
	asl
	asl
	asl
	asl
	ora	#$80
	sta	HZ40
	lda	#$c0
	sta	HZ41
	jsr	mon_cr
	lda	#msg_card_pseudorom & $ff
	jsr	H2Scea7
	jsr	H2Sce38
	lda	#msg_card_rom_crc & $ff
	jsr	H2Scea7
	jsr	H2Sce38
	lda	#msg_card_rom_checksum & $ff
	jsr	H2Scea7
	jsr	H2Sce38
	lda	#msg_swim_regs & $ff
	jsr	H2Scea7
	jsr	H2Sce38
	lda	#msg_card_ram & $ff
	jsr	H2Scea7
	jsr	H2Sce38
	lda	#msg_host_card_shared_data & $ff
	jsr	H2Scea7
	lda	#$00
	tax
	ldy	#$06
	stx	HZ3e
H2Lcc94:
	stx	HZ42
	sty	HZ44
	ldy	HZ42
	sta	(HZ40),y
	ldy	HZ44
	ldx	#$c8
	stx	HZ3f
	ldx	#$cc
H2Lcca4:
	clc
	adc	(HZ3e),y
	iny
	bne	H2Lcca4
	inc	HZ3f
	cpx	HZ3f
	bne	H2Lcca4
	ldx	HZ42
	cpx	#$01
	bne	H2Lccb7
	inx
H2Lccb7:
	cpx	#$0f
	beq	H2Lccbf
	inx
	jmp	H2Lcc94

H2Lccbf:
	ldx	#$cc
	stx	HZ3f
	ldx	#$cf
H2Lccc5:
	clc
	adc	(HZ3e),y
	iny
	bne	H2Lccc5
	inc	HZ3f
	cpx	HZ3f
	bne	H2Lccc5
H2Lccd1:
	clc
	adc	(HZ3e),y
	iny
	cpy	#$ff
	bne	H2Lccd1
	ldy	#$02
	sta	(HZ40),y
	ldy	#$00
	ldx	#$cb
	stx	HZ3f
H2Lcce3:
	clc
	adc	(HZ3e),y
	iny
	bne	H2Lcce3
	ldx	HD07f8
	stx	HZ3f
H2Lccee:
	clc
	adc	(HZ3e),y
	iny
	bne	H2Lccee
	ldx	#$c8
	stx	HZ3f
	ldx	#$ca
H2Lccfa:
	clc
	adc	(HZ3e),y
	iny
	bne	H2Lccfa
	inc	HZ3f
	cpx	HZ3f
	bne	H2Lccfa
	cmp	#$ff
	beq	H2Lcd10
H2Lcd0a:
	jsr	H2Sce9a
	jmp	H2Lcda0

H2Lcd10:
	jsr	H2Sce8d
	lda	#msg_host_ram & $ff
	jsr	H2Scea7
	ldx	#$00
	stx	HZ3e
	inx
H2Lcd1d:
	stx	HZ42
	jsr	H2Sce78
	ldy	HZ42
	sta	(HZ40),y
	ldy	#$00
	ldx	#$c8
	stx	HZ3f
	ldx	#$cc
H2Lcd2e:
	tya
	clc
	adc	HZ42
	adc	HZ3f
	sta	(HZ3e),y
	iny
	bne	H2Lcd2e
	inc	HZ3f
	cpx	HZ3f
	bne	H2Lcd2e
	ldx	HZ42
	cpx	#$0f
	beq	H2Lcd49
	inx
	jmp	H2Lcd1d

H2Lcd49:
	ldx	#$00
	stx	HZ3e
	inx
H2Lcd4e:
	stx	HZ42
	jsr	H2Sce78
	ldy	HZ42
	sta	(HZ40),y
	ldy	#$00
	ldx	#$c8
	stx	HZ3f
	ldx	#$cc
H2Lcd5f:
	tya
	clc
	adc	HZ42
	adc	HZ3f
	cmp	(HZ3e),y
	beq	H2Lcd6c
	jmp	H2Lcd0a

H2Lcd6c:
	iny
	bne	H2Lcd5f
	inc	HZ3f
	cpx	HZ3f
	bne	H2Lcd5f
	ldx	HZ42
	cpx	#$0f
	beq	H2Lcd7f
	inx
	jmp	H2Lcd4e

H2Lcd7f:
	jsr	H2Sce8d
	ldy	#$00
	sta	(HZ40),y
	lda	#$cd
	pha
	lda	#$93
	pha
	lda	HD07f8
	pha
	lda	#$e6
	pha
	rts

	lda	HDc02f
	sta	HDcbfe
	jsr	H2Scebd
	jmp	HDca00

H2Lcda0:
	lda	#$a6
	sta	HD048d
	ldy	#$00
	sta	(HZ40),y
	lda	#$4f
	sta	HDcbff
	jsr	mon_cr
	lda	#msg_press_e_to_exit >> 8
	sta	HZ3f
	lda	#msg_press_e_to_exit & $ff
	jsr	H2Scea7
	jsr	mon_cr
	lda	HDc010
H2Lcdc0:
	ldx	#$00
	stx	HZ3e
H2Lcdc4:
	stx	HZ42
	ldy	HZ42
	sta	(HZ40),y
	ldy	#$00
	ldx	#$c8
	stx	HZ3f
	ldx	#$cc
H2Lcdd2:
	lda	(HZ3e),y
	iny
	bne	H2Lcdd2
	inc	HZ3f
	cpx	HZ3f
	bne	H2Lcdd2
	ldx	HZ42
	cpx	#$0f
	beq	H2Lcde7
	inx
	jmp	H2Lcdc4

H2Lcde7:
	ldx	HD07f8
	stx	HZ3f
H2Lcdec:
	lda	(HZ3e),y
	iny
	bne	H2Lcdec
	ldx	#$cc
	stx	HZ3f
	ldx	#$cf
H2Lcdf7:
	lda	(HZ3e),y
	iny
	bne	H2Lcdf7
	inc	HZ3f
	cpx	HZ3f
	bne	H2Lcdf7
H2Lce02:
	lda	(HZ3e),y
	iny
	cpy	#$ff
	bne	H2Lce02
	lda	HDc000		; check keyboard
	bpl	H2Lcdc0		;   no key
	sta	HDc010		; reset key
	cmp	#'E'+$80
	beq	H2Lce1b
	cmp	#'e'+$80
	beq	H2Lce1b
	bne	H2Lcdc0

; force a host reset
H2Lce1b:
	lda	mon_softev+1	; make sure soft reset vector is invalid
	sta	mon_softev+2
	lda	reset_vec+1
	pha
	lda	reset_vec
	pha
	ldy	#$00
	sta	(HZ40),y
	lda	#$55		; tell card that we're going to reset
	sta	HDcbff
H2Lce32:			; wait for card to clear Cbff
	lda	HDcbff
	bne	H2Lce32
	rts			; return to reset vector (pushed above)

H2Sce38:
	jsr	H2Sce78
	ldy	#$02
	sta	(HZ40),y
	ldy	#$00
	lda	HDca00
	tax
H2Lce45:
	inx
	txa
	sta	HDca00,y
	iny
	bne	H2Lce45		; immediately following!

H2Lce4d:
	inx
	txa
	cmp	HDca00,y
	bne	H2Lce5a
	iny
	bne	H2Lce4d
	jmp	H2Lce5f

H2Lce5a:
	lda	#$c5
	sta	HD0606
H2Lce5f:
	ldy	#$00
	sta	(HZ40),y
	lda	HDc802
	beq	H2Sce38
	cmp	#$a1
	beq	H2Lce72
	jsr	H2Sce9a
	jmp	H2Lcda0

H2Lce72:
	sty	HDc802
	jmp	H2Sce8d

H2Sce78:
	lda	HD048d
	ldy	#$04
H2Lce7d:
	cmp	H2Dcffa,y
	beq	H2Lce86
	dey
	bne	H2Lce7d
	iny
H2Lce86:
	lda	H2Dcffa-1,y
	sta	HD048d
	rts

H2Sce8d:
	lda	#msg_pass >> 8
	sta	HZ3f
	lda	#msg_pass & $ff
	jsr	H2Scea7
	jsr	mon_cr
	rts

H2Sce9a:
	lda	#msg_fail >> 8
	sta	HZ3f
	lda	#msg_fail & $ff
	jsr	H2Scea7
	jsr	mon_cr
	rts

H2Scea7:
	sta	HZ3e
	ldy	#$00
H2Lceab:
	lda	(HZ3e),y
	bne	H2Lceb0
	rts

H2Lceb0:
	cmp	#$c0
	bcc	H2Lceb6
	and	HZ43
H2Lceb6:
	jsr	mon_cout
	iny
	bne	H2Lceab
	rts

H2Scebd:
	ldy	#$00
	sta	(HZ40),y
	lda	#$a1
	sta	HDcbff
H2Lcec6:
	jsr	H2Sce78
	lda	HDcbff
	cmp	#$4f
	bne	H2Lced3
	jmp	H2Lcda0

H2Lced3:
	cmp	#$4e
	bne	H2Lcef9
	lda	#$54
	jsr	H2Scea7
	lda	HDc808
	jsr	mon_prbyte
	lda	HDc807
	jsr	mon_prbyte
	lda	#$6b
	jsr	H2Scea7
	lda	HDc856
	jsr	mon_prbyte
	jsr	mon_cr
	jmp	H2Lcda0

H2Lcef9:
	cmp	#$00
	bne	H2Lcec6
	rts

	fillto	$cf21

msg_banner:
	fcchz	" 3.5\" Disk Controller Test"

msg_credit:
	fcchz	"    J.Arkley & T.Rudin"

msg_copyright:
	fcchz	"(C)Apple Computer Inc.,1991"

msg_tests:
	fcchz	"Tests:"

msg_slot:
	fcchz	"Slot #"

msg_card_pseudorom:
	fcchz	"Card pseudoROM"

msg_card_rom_crc:
	fcchz	"Card ROM CRC"

msg_card_rom_checksum:
	fcchz	"Card ROM Checksum"

msg_swim_regs:
	fcchz	"SWIM Regs."

msg_card_ram:
	fcchz	"Card RAM"

msg_host_card_shared_data:
	fcchz	"Host/Card shared data"

msg_host_ram:
	fcchz	"Host RAM"

msg_pass:
	fcchz	"-PASS"

msg_fail:
	fcchz	"-FAIL"

msg_press_e_to_exit:
	fcchz	"Press E to Exit"

H2Dcffa:
	fcb	$ad,$af,$fc,$dc,$ad,$00

	dephase

	cpu	65c02		; done with host code, reset is on-card 65c02

D8e00:	fcb	$55,$0f
	fillto	$8f00

L8f00:	sei
	cld
	ldx	#$ff
	txs

; test first six bytes of zero page with two patterns
	ldx	#$05
L8f07:	lda	D990b,x
	sta	Z00,x
	dex
	bpl	L8f07

	ldx	#$05
L8f11:	lda	D990b,x
	cmp	Z00,x
	beq	L8f1b
	jmp	L95cd

L8f1b:	dex
	bpl	L8f11

	ldx	#$05
L8f20:	lda	D9911,x
	sta	Z00,x
	dex
	bpl	L8f20

	ldx	#$05
L8f2a:	lda	D9911,x
	cmp	Z00,x
	beq	L8f34
	jmp	L95cd

L8f34:	dex
	bpl	L8f2a

; Test all of zero page, though most of it will just be zeros
	jsr	S95b2	; copy 256 bytes from D8e00 to zero page
	jsr	S95bd	; verify 256 bytes from D8e00 against zero page
	bcc	L8f42
	jmp	L95cd

L8f42:	jsr	S9559	; copy some of host diagnostic code to host shared ROM
	stz	Z02
	stz	D7b17+1	; change branch target of HL_diag_load_wait to allow
			; host to continue

	lda	#$fe	; prevent host from proceeding
	sta	D7b0b+1
	sta	D7b21+1

	jsr	verify_slot_pseudorom
	bcc	L8f5a
	jmp	L95cd

L8f5a:	jsr	S9580
	bcc	L8f62
	jmp	L95cd

L8f62:	jsr	S92ac
	jsr	S93f5
	bcc	L8f6d
	jmp	L95cd

L8f6d:	jsr	S92ac
	jsr	S93b1
	bcc	L8f78
	jmp	L95cd

L8f78:	jsr	S92ac
	jsr	S92b5
	bcc	L8f83
	jmp	L95cd

L8f83:	jsr	S92ac
	lda	#$06
	sta	Z04
	stz	Z05
	lda	#$01
	sta	Z00
	stz	Z01
L8f92:	lda	#$0a
	cmp	Z05
	bne	L8f9c
	lda	#$0b
	sta	Z05
L8f9c:	lda	#$7b
	cmp	Z05
	beq	L8fc7
	lda	Z00
	sta	(Z04)
	inc	Z04
	lda	Z01
	sta	(Z04)
	inc	Z04
	bne	L8fb2
	inc	Z05
L8fb2:	clc
	rol	Z00
	rol	Z01
	bcc	L8f92
	lda	#$0b
	eor	Z00
	sta	Z00
	lda	#$10
	eor	Z01
	sta	Z01
	bra	L8f92
L8fc7:	lda	#$06
	sta	Z04
	stz	Z05
	lda	#$01
	sta	Z00
	stz	Z01
L8fd3:	lda	#$0a
	cmp	Z05
	bne	L8fdd
	lda	#$0b
	sta	Z05
L8fdd:	lda	#$7b
	cmp	Z05
	beq	L9012
	lda	Z00
	cmp	(Z04)
	beq	L8fec
	jmp	L95cd

L8fec:	inc	Z04
	lda	Z01
	cmp	(Z04)
	beq	L8ff7
	jmp	L95cd

L8ff7:	inc	Z04
	bne	L8ffd
	inc	Z05
L8ffd:	clc
	rol	Z00
	rol	Z01
	bcc	L8fd3
	lda	#$0b
	eor	Z00
	sta	Z00
	lda	#$10
	eor	Z01
	sta	Z01
	bra	L8fd3
L9012:	lda	#$06
	sta	Z04
	stz	Z05
	lda	#$01
	sta	Z00
	stz	Z01
L901e:	lda	#$0a
	cmp	Z05
	bne	L9028
	lda	#$0b
	sta	Z05
L9028:	lda	#$7b
	cmp	Z05
	beq	L9057
	lda	Z00
	eor	#$ff
	sta	(Z04)
	inc	Z04
	lda	Z01
	eor	#$ff
	sta	(Z04)
	inc	Z04
	bne	L9042
	inc	Z05
L9042:	clc
	rol	Z00
	rol	Z01
	bcc	L901e
	lda	#$0b
	eor	Z00
	sta	Z00
	lda	#$10
	eor	Z01
	sta	Z01
	bra	L901e

L9057:	lda	#$06
	sta	Z04
	stz	Z05
	lda	#$01
	sta	Z00
	stz	Z01
L9063:	lda	#$0a
	cmp	Z05
	bne	L906d
	lda	#$0b
	sta	Z05
L906d:	lda	#$7b
	cmp	Z05
	beq	L90a6
	lda	Z00
	eor	#$ff
	cmp	(Z04)
	beq	L907e
	jmp	L95cd

L907e:	inc	Z04
	lda	Z01
	eor	#$ff
	cmp	(Z04)
	beq	L908b
	jmp	L95cd

L908b:	inc	Z04
	bne	L9091
	inc	Z05
L9091:	clc
	rol	Z00
	rol	Z01
	bcc	L9063
	lda	#$0b
	eor	Z00
	sta	Z00
	lda	#$10
	eor	Z01
	sta	Z01
	bra	L9063

L90a6:	ldy	#$00		; copy first two pages of diagnostic code to host shared ROM
L90a8:	lda	D8800,y
	sta	D0200,y
	lda	D8800+$100,y
	sta	D0200+$100,y
	dey
	bne	L90a8
	lda	#$91
	pha
	lda	#$36
	pha
	pla
	pla
	stz	Z00
	stz	Z01
	lda	#$00
	ldy	#$06
	stz	D09ff
L90ca:	clc
	adc	(Z00),y
	iny
	bne	L90ca
	inc	Z01
	ldx	#$08
	cpx	Z01
	bne	L90ca
	ldx	#$0c
	stx	Z01
L90dc:	clc
	adc	(Z00),y
	iny
	bne	L90dc
	inc	Z01
	ldx	#$40
	cpx	Z01
	bne	L90dc
	ldx	#$7c
	stx	Z01
L90ee:	clc
	adc	(Z00),y
	iny
	bne	L90ee
	inc	Z01
	ldx	#$7f
	cpx	Z01
	bne	L90ee
L90fc:	clc
	adc	(Z00),y
	iny
	cpy	#$ff
	bne	L90fc
	iny
	ldx	#$0b
	stx	Z01
L9109:	clc
	adc	(Z00),y
	iny
	bne	L9109
	ldx	#$7b
	stx	Z01
L9113:	clc
	adc	(Z00),y
	iny
	bne	L9113
	ldx	#$08
	stx	Z01
L911d:	clc
	adc	(Z00),y
	iny
	bne	L911d
	inc	Z01
	ldx	#$0a
	cpx	Z01
	bne	L911d
	eor	#$ff
	sta	D09ff
	lda	#$a1
	sta	Z02
	jsr	S929b
	jsr	Sd2a1
	lda	#$ff
	sta	Z00
	stz	D03ff
	jsr	S929b

; look for a 16 byte signature from the host slot 1 card
; the slot ROM subroutine at HLcne7 has copied c100..c10f
; to cbee..cbfd, which we see from 03ee..03fd
	ldy	#$0f
L9146:	lda	slot_1_rom_copy,y
	cmp	slot_1_template,y
	bne	L9154
	dey
	bpl	L9146
	jmp	L915c

L9154:	lda	#$4f
	sta	D03ff
	jmp	L9269

L915c:	lda	Z33
	bne	L9163
	jmp	L9154
L9163:	lda	#$01
	sta	Z03
	jsr	S917f
	lda	Z33
	cmp	#$02
	bcc	L9177
	lda	#$02
	sta	Z03
	jsr	S917f
L9177:	lda	#$4f
	sta	D03ff
	jmp	L9269

S917f:	jsr	S9248
	jsr	S91b4
	bcs	L91a1
	jsr	S91fa
	bcs	L91a1
	jsr	S9244
	jsr	S91b4
	bcs	L91a1
	jsr	S91fa
	stz	D03ff
	lda	D0a08
	jsr	S929b
	rts

L91a1:	lda	Z05
	sta	Z07
	lda	Z06
	sta	Z08
	lda	#$4e
	sta	D03ff
	lda	D0a08
	jmp	L9269

S91b4:	jsr	Sd80b
	lda	#$02
	sta	Z02
	lda	D03fe
	lsr
	lda	D03fe
	stz	Z06
	rol
	sta	Z05
	rol	Z06
	lda	#$ff
	sta	Z01
	sta	Zb9
	lda	#$02
	sta	Z00
	jsr	Sd1e7
	stz	Zb9
	bcs	L91de
	lda	#$ff
	sta	Z00
L91de:	lda	Z56
	beq	L91e4
	sec
	rts

L91e4:	lda	Z2d
	jsr	Sd9b0
	ldy	#$00
L91eb:	lda	(Zab),y
	sta	D0400,y
	lda	(Zaf),y
	sta	D0500,y
	iny
	bne	L91eb
	clc
	rts

S91fa:	jsr	Sd80b
	lda	#$01
	sta	Z02
	lda	D03fe
	lsr
	lda	D03fe
	stz	Z06
	rol
	sta	Z05
	rol	Z06
	lda	#$ff
	sta	Z01
	sta	Z5f
	lda	#$01
	sta	Z00
	jsr	Sd1e7
	lda	#$fe
	sta	Z00
	lda	Z2d
	jsr	Sd9b0
	lda	#$ff
	sta	Z01
	lda	Z56
	beq	L922f
L922d:	sec
	rts

L922f:	ldy	#$00
L9231:	lda	(Zab),y
	cmp	D0400,y
	bne	L922d
	lda	(Zaf),y
	cmp	D0500,y
	bne	L922d
	iny
	bne	L9231
	clc
	rts

S9244:	ldy	#$c3
	bra	L924a

S9248:	ldy	#$a5
L924a:	lda	#$08
L924c:	jsr	S9255
	inc
	cmp	#$1c
	bcc	L924c
	rts

S9255:	pha
	jsr	Sd9b0
	tya
	sec
	phy
	ldy	#$00
L925e:	sta	(Zab),y
	sta	(Zaf),y
	rol
	iny
	bne	L925e
	ply
	pla
	rts

L9269:	ldy	#$00
	sty	Z04
	sty	Z05
L926f:	lda	#$0a
	cmp	Z05
	bne	L927c
	tya
	and	#$c0
	bne	L927c
	bra	L927e
L927c:	lda	(Z04),y
L927e:	iny
	bne	L926f
	inc	Z05
	bne	L926f
	lda	D03ff
	cmp	#$55
	bne	L9269
L928c:	lda	#$00
	sta	D03ff
	sta	D0a80
	nop
	nop
	nop
	nop
	jmp	RESET

S929b:	lda	D03ff
	cmp	#$a1
	bne	L92a3
	rts

L92a3:	cmp	#$4f
	bne	S929b
	pla
	pla
	jmp	L9269

S92ac:	lda	#$a1
	sta	Z02
L92b0:	lda	Z02
	bne	L92b0
	rts


; SWIM chip test
S92b5:	bit	D0a0e		; Q7L   reset IWM (assumed not to be in ISM mode)
	bit	D0a0c		; Q6L
	bit	D0a00		; Ph0 off
	bit	D0a02		; Ph1 off
	bit	D0a04		; Ph2 off
	bit	D0a06		; Ph3 off
	bit	D0a08		; Motor off

	lda	D0a0e		; Q7L - should read all ones
	cmp	#$ff
	beq	L92d3		;   yes
	sec			;   no, failure
	rts

L92d3:	lda	#$1f
	bit	D0a0d		; Q6H
	sta	D0a0f		; Q7H - write mode register
	eor	D0a0e		; Q7L - read status register (low 5 match mode reg)
	and	#$1f		; match?
	beq	L92e4		;   yes
	sec			;   no, failure
	rts

L92e4:	lda	#$00
	sta	D0a0f		; Q7H - write mode register
	eor	D0a0e		; Q7L - read status register
	and	#$1f		; match?
	beq	L92f2		;   yes
	sec			;   no, failure
	rts

L92f2:	lda	#$0f
	bit	D0a0d		; Q6H
	sta	D0a0f		; Q7H - write mode register
	eor	D0a0e		; Q7L - read status register
	and	#$1f		; match?
	beq	L9303		;   yes
	sec			;   no, failure
	rts

; set SWIM to ISM mode
L9303:	lda	#$4f
	bit	D0a0d		; Q6H
	sta	D0a0f		; Q7H - write mode register, MZ=1
	eor	#$40
	sta	D0a0f		; Q7H - write mode register, MZ=0
	eor	#$40
	sta	D0a0f		; Q7H - write mode register, MZ=1
	sta	D0a0f		; Q7H - write mode register, MZ=1

	lda	#$05		; wait to meed IWM-to-ISM timing spec
L931a:	dec
	bne	L931a

	lda	ism_r_phase	; phase should be all enabled, low
	cmp	#$f0
	bne	L935a

	lda	ism_r_status	; status should be motor on, bit 6=1
	and	#$c0
	cmp	#$40
	bne	L935a

	stz	ism_w_zeros	; reset param pointer
	lda	#$01
L9332:	sta	ism_w_param	; loop writing a single one bit
	asl
	bcc	L9332

	lda	#$fe
L933a:	sta	ism_w_param	; loop writing a single zero bit
	rol
	bcs	L933a

	stz	ism_w_zeros	; reset param pointer
	lda	#$01
L9345:	cmp	ism_r_param
	bne	L935a
	asl
	bcc	L9345

	lda	#$fe
L934f:	cmp	ism_r_param
	bne	L935a
	sec
	rol
	bcs	L934f

	bra	L935c

L935a:	sec
	rts


L935c:	lda	#$f8		; switch SWIM from ISM to IWM mode
	sta	ism_w_zeros

	bit	D0a0e		; Q7L   reset IWM (assumed not to be in ISM mode)
	bit	D0a0c		; Q6L
	bit	D0a00		; Ph0 off
	bit	D0a02		; Ph1 off
	bit	D0a04		; Ph2 off
	bit	D0a06		; Ph3 off
	bit	D0a08		; Motor off

	lda	D0a0e		; Q7L - should read all ones
	cmp	#$ff
	beq	L937f		;   yes
	sec			;   no, failure
	rts

; repeat IWM tests
L937f:	lda	#$1f
	bit	D0a0d
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L9390
	sec
	rts

L9390:	lda	#$00
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L939e
	sec
	rts

L939e:	lda	#$0f
	bit	D0a0d
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	bne	L93af
	clc
	rts

L93af:	sec
	rts

; compute ROM checksum
S93b1:	stz	Zfe
	lda	#$80
	sta	Zfe+1
	lda	#$00
	tax
	tay
L93bb:	clc
	adc	(Zfe),y
	bcc	L93c1
	inx
L93c1:	iny
	bne	L93bb
	inc	Zfe+1
	tay
	lda	Zfe+1
	inc
	beq	L93d1
	tya
	ldy	#$00
	bra	L93bb

L93d1:	tya
	ldy	#$00
L93d4:	clc
	adc	(Zfe),y
	bcc	L93da
	inx
L93da:	iny
	beq	L93e4
	cpy	#$f9
	bne	L93d4
	iny
	bra	L93d4
L93e4:	tay
	beq	L93ea
	jmp	L9888

L93ea:	txa
	clc
	adc	Dfffa-1
	beq	L93f3
	sec
	rts

L93f3:	clc
	rts

; compute CRC16 of ROM in 2KB pieces using an unrolled loop

S93f5:	stz	Zfe
	lda	#$80
	sta	Zfe+1
L93fb:	stz	Zfc
	stz	Zfc+1
L93ff:	clc
	rol	Zfc
	rol	Zfc+1
	bcs	L941a
	lda	(Zfe)
	ror
	tay
	bcc	L9422
L940c:	lda	#$21
	eor	Zfc
	sta	Zfc
	lda	#$10
	eor	Zfc+1
	sta	Zfc+1
	bra	L9422

L941a:	lda	(Zfe)
	ror
	tay

	bcs	L9422		; these two instr could be "bcc L940c"
	bra	L940c
L9422:

	rept	7
	clc
	rol	Zfc
	rol	Zfc+1
	bcs	L943c
	tya
	ror
	tay
	bcc	L9443

L942e:	lda	#$21
	eor	Zfc
	sta	Zfc
	lda	#$10
	eor	Zfc+1
	sta	Zfc+1
	bra	L9443

L943c:	tya
	ror
	tay
	bcs	L9443
	bra	L942e
L9443:
	endm

	inc	Zfe
	beq	L9510
	jmp	L93ff

L9510:	inc	Zfe+1
	lda	Zfe+1
	sec
	sbc	#$80
	tax
	and	#$07
	beq	L951f
	jmp	L93ff

L951f:	txa
	clc
	ror
	ror
	ror
	dec
	asl
	tax
	lda	Dffda,x
	cmp	Zfc
	beq	L9530
L952e:	sec
	rts

L9530:	lda	Dffda+1,x
	cmp	Zfc+1
	bne	L952e
	cpx	#$1c
	beq	L953e
	jmp	L93fb

L953e:	clc
	rts

; verify slot pseudoROM (7b00, host cn00) against slot ROM image (8100),
; except that Cn18 is expected to be $00
verify_slot_pseudorom:
	ldx	#$00
L9542:	cpx	#$18
	bne	L954a
	lda	#$00
	bra	L954d
L954a:	lda	D8100,x
L954d:	cmp	D7b00,x
	bne	L9557
	dex
	bne	L9542
	clc
	rts

L9557:	sec
	rts

; copy some of diagnostic code to host shared ROM
S9559:	ldx	#$00
L955b:	lda	D8800+$0200,x
	sta	D7c00,x
	dex
	bne	L955b
L9564:	lda	D8800+$0300,x
	sta	D7c00+$0100,x
	dex
	bne	L9564
L956d:	lda	D8800+$0400,x
	sta	D7c00+$0200,x
	dex
	bne	L956d
L9576:	lda	D8800+$0500,x
	sta	D7c00+$0300,x
	dex
	bne	L9576
	rts

S9580:	ldx	#$00		; verify diagnostic code copied correctly
L9582:	lda	D8800+$0200,x
	cmp	D7c00,x
	bne	L95b0
	dex
	bne	L9582
L958d:	lda	D8800+$0300,x
	cmp	D7c00+$0100,x
	bne	L95b0
	dex
	bne	L958d
L9598:	lda	D8800+$0400,x
	cmp	D7c00+$0200,x
	bne	L95b0
	dex
	bne	L9598
L95a3:	lda	D8800+$0500,x
	cmp	D7c00+$0300,x
	bne	L95b0
	dex
	bne	L95a3
	clc
	rts

L95b0:	sec
	rts

S95b2:	ldx	#$00
L95b4:	lda	D8e00,x
	sta	Z00,x
	dex
	bne	L95b4
	rts

S95bd:	ldx	#$00
L95bf:	lda	D8e00,x
	cmp	Z00,x
	bne	L95cb
	dex
	bne	L95bf
	clc
	rts

L95cb:	sec
	rts

; test fail
L95cd:	lda	#$4f
	sta	Z02
L95d1:	sta	D0a81
	ldx	#$00
L95d6:	lda	#$00
L95d8:	dec
	bne	L95db
L95db:	nop
	nop
	bne	L95d8
	dex
	bne	L95d6
	sta	D0a80

	ldx	#$00
L95e7:	lda	#$00
L95e9:	dec
	rept	6
	bne	*+2
	endm
	nop
	bne	L95e9
	dex
	bne	L95e7

	sta	D0a81
	ldx	#$ff
L9601:	lda	#$cb
L9603:	dec
	bne	L9606
L9606:	nop
	bne	L9603
	dex
	bne	L9601
	sta	D0a80
	ldx	#$96
L9611:	lda	#$cb
L9613:	dec
	bne	L9616
L9616:	nop
	bne	L9613
	dex
	bne	L9611
	sta	D0a81
	ldx	#$ff
L9621:	lda	#$cb
L9623:	dec
	bne	L9626
L9626:	nop
	bne	L9623
	dex
	bne	L9621
	sta	D0a80
	ldx	#$96
L9631:	lda	#$cb
L9633:	dec
	bne	L9636
L9636:	nop
	bne	L9633
	dex
	bne	L9631
	sta	D0a81
	lda	D03ff
	cmp	#$55
	bne	L95d1
	jmp	L928c

; copy 35 bytes of slot ROM image into slot pseudoROM
; (minimum required while on-board
; processor is doing a self-test?)
; rest copied later
L9649:	ldy	#$22
L964b:	lda	D8100,y
	sta	D7b00,y
	dey
	bpl	L964b

; compute ROM checksum
	stz	Zfe
	lda	#$80
	sta	Zfe+1
	lda	#$00
	tax
	tay
L965e:	clc
	adc	(Zfe),y
	bcc	L9664
	inx
L9664:	iny
	bne	L965e
	inc	Zfe+1
	tay
	lda	Zfe+1
	inc
	beq	L9674
	tya
	ldy	#$00
	bra	L965e

L9674:	tya
	ldy	#$00
L9677:	clc
	adc	(Zfe),y
	bcc	L967d
	inx
L967d:	iny
	beq	L9687
	cpy	#$f9
	bne	L9677
	iny
	bra	L9677
L9687:	tay
	beq	L968d
	jmp	L9888

L968d:	txa
	clc
	adc	Dfffa-1
	beq	L9697
	jmp	L9888

L9697:	bit	D0a0e		; Q7L   reset IWM (assumed not to be in ISM mode)
	bit	D0a0c		; Q6L
	bit	D0a00		; Ph0 off
	bit	D0a02		; Ph1 off
	bit	D0a04		; Ph2 off
	bit	D0a06		; Ph3 off
	bit	D0a08		; Motor off

	lda	D0a0e		; Q7L - should read all ones
	cmp	#$ff
	beq	L96b6		;   yes
	jmp	L9888		;   no, failure

L96b6:	lda	#$1f
	bit	D0a0d
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L96c8
	jmp	L9888

L96c8:	lda	#$00
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L96d7
	jmp	L9888

L96d7:	lda	#$0f
	bit	D0a0d
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L96e9
	jmp	L9888

; set SWIM to ISM mode
L96e9:	lda	#$4f
	bit	D0a0d
	sta	D0a0f
	eor	#$40
	sta	D0a0f
	eor	#$40
	sta	D0a0f
	sta	D0a0f
	lda	#$05
L9700:	dec
	bne	L9700
	lda	D0a0c
	cmp	#$f0
	bne	L9740
	lda	D0a0e
	and	#$c0
	cmp	#$40
	bne	L9740
	stz	D0a06
	lda	#$01
L9718:	sta	D0a03
	asl
	bcc	L9718
	lda	#$fe
L9720:	sta	D0a03
	rol
	bcs	L9720
	stz	D0a06
	lda	#$01
L972b:	cmp	D0a0b
	bne	L9740
	asl
	bcc	L972b
	lda	#$fe
L9735:	cmp	D0a0b
	bne	L9740
	sec
	rol
	bcs	L9735
	bra	L9743
L9740:	jmp	L9888

L9743:	lda	#$f8		; switch SWIM from ISM to IWM mode
	sta	ism_w_zeros

	bit	D0a0e		; Q7L   reset IWM (assumed not to be in ISM mode)
	bit	D0a0c		; Q6L
	bit	D0a00		; Ph0 off
	bit	D0a02		; Ph1 off
	bit	D0a04		; Ph2 off
	bit	D0a06		; Ph3 off
	bit	D0a08		; Motor off

	lda	D0a0e		; Q7L - should read all ones
	cmp	#$ff
	beq	L9767		;   yes
	jmp	L9888		;   no, failure

L9767:	lda	#$1f
	bit	D0a0d
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L9779
	jmp	L9888

L9779:	lda	#$00
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L9788
	jmp	L9888

L9788:	lda	#$0f
	bit	D0a0d
	sta	D0a0f
	eor	D0a0e
	and	#$1f
	beq	L979a
	jmp	L9888

L979a:	lda	#$00
	tax
L979d:	sta	D0100,x
	inc
	inx
	bne	L979d
	lda	#$01
	sta	D0403
	asl
	sta	D0503
	asl
	sta	D0603
	asl
	sta	D0803
	asl
	sta	D1003
	asl
	sta	D1203
	asl
	sta	D2003
	asl
	sta	D4003
	lda	#$01
	cmp	D0403
	beq	L97cf
	jmp	L9888

L97cf:	asl
	cmp	D0503
	beq	L97d8
	jmp	L9888

L97d8:	asl
	cmp	D0603
	beq	L97e1
	jmp	L9888

L97e1:	asl
	cmp	D0803
	beq	L97ea
	jmp	L9888

L97ea:	asl
	cmp	D1003
	beq	L97f3
	jmp	L9888

L97f3:	asl
	cmp	D1203
	beq	L97fc
	jmp	L9888

L97fc:	asl
	cmp	D2003
	beq	L9805
	jmp	L9888

L9805:	asl
	cmp	D4003
	beq	L980e
	jmp	L9888

L980e:	lda	#$00
	tax
L9811:	cmp	D0100,x
	bne	L981c
	inc
	inx
	bne	L9811
	bra	L981f
L981c:	jmp	L9888

L981f:	lda	#$ff
	ldx	#$00
L9823:	sta	D0100,x
	dec
	inx
	bne	L9823
	lda	#$ff
	ldx	#$00
L982e:	cmp	D0100,x
	bne	L9839
	dec
	inx
	bne	L982e
	bra	L983c
L9839:	jmp	L9888

L983c:	lda	#$01
	cmp	D0403
	beq	L9846
	jmp	L9888

L9846:	asl
	cmp	D0503
	beq	L984f
	jmp	L9888

L984f:	asl
	cmp	D0603
	beq	L9858
	jmp	L9888

L9858:	asl
	cmp	D0803
	beq	L9861
	jmp	L9888

L9861:	asl
	cmp	D1003
	beq	L986a
	jmp	L9888

L986a:	asl
	cmp	D1203
	beq	L9873
	jmp	L9888

L9873:	asl
	cmp	D2003
	beq	L987c
	jmp	L9888

L987c:	asl
	cmp	D4003
	bne	L9888
	sta	D0a81
	jmp	Ld129

; come here on self-test fail?
; fill the slot ROM image with stuff to
; prevent it from looking like a disk?
L9888:	stz	D7b04+1

	lda	#$4c	; JMP opcode
	sta	D7b00
	sta	D7b0d
	sta	D7b23
	lda	#mon_oldrst & $ff
	sta	D7b00+1
	sta	D7b0d+1
	sta	D7b23+1
	lda	#mon_oldrst >> 8
	sta	D7b00+2
	sta	D7b0d+2
	sta	D7b23+2

	stz	D7b0b+1	; allow host to proceed
	stz	D7b21+1

	ldx	#$26	; fill reset with zeros
L98b4:	stz	D7b00,x
	inx
	bne	L98b4

L98ba:	sta	D0a81
	ldx	#$00
L98bf:	lda	#$00
L98c1:	dec
	bne	L98c4
L98c4:	nop
	nop
	bne	L98c1
	dex
	bne	L98bf
	sta	D0a80
	ldx	#$00

L98d0:	lda	#$00
L98d2:	dec
	rept	6
	bne	*+2
	endm
	nop
	bne	L98d2
	dex
	bne	L98d0

	sta	D0a81
	ldx	#$ff
L98ea:	lda	#$cb
L98ec:	dec
	bne	L98ef
L98ef:	nop
	bne	L98ec
	dex
	bne	L98ea
	sta	D0a80
	ldx	#$96
L98fa:	lda	#$cb
L98fc:	dec
	bne	L98ff
L98ff:	nop
	bne	L98fc
	dex
	bne	L98fa
	sta	D0a81
	jmp	L98ba

D990b:	fcb	$00,$ff,$55,$aa,$cc,$33
D9911:	fcb	$ff,$00,$aa,$55,$33,$cc

; 16 bytes of data to compare to the first 16 bytes of
; the host slot 1 ROM (c100..c10f)
slot_1_template:
	fcb	$4c,$59,$ff,"AVEX Manufact"

	fillto	$d000
Dd000:
; nibblization table
	rept	4
	fcb	$96,$97,$9a,$9b,$9d,$9e,$9f,$a6
	fcb	$a7,$ab,$ac,$ad,$ae,$af,$b2,$b3
	fcb	$b4,$b5,$b6,$b7,$b9,$ba,$bb,$bc
	fcb	$bd,$be,$bf,$cb,$cd,$ce,$cf,$d3
	fcb	$d6,$d7,$d9,$da,$db,$dc,$dd,$de
	fcb	$df,$e5,$e6,$e7,$e9,$ea,$eb,$ec
	fcb	$ed,$ee,$ef,$f2,$f3,$f4,$f5,$f6
	fcb	$f7,$f9,$fa,$fb,$fc,$fd,$fe,$ff
	endm


Pd100:	jmp	Sd576

Pd103:	jmp	Sd60b

Pd106:	jmp	Sd5d8

Pd109:	jmp	Sd89f

Pd10c:	jmp	Se600

Pd10f:	jmp	Lec77

Ld112:	jsr	Sd7cc
	jsr	Sf73c
	bit	D0a08
	stz	Z01

RESET:	cld
	sei
	ldx	#$ff
	txs
	stz	Z00
	lda	Z6f
	jmp	L9649

Ld129:	lda	Z6f
	jsr	Sd319
	ldx	#$04
Ld130:	dex
	bmi	Ld13f
	lda	Zbc+$8000,x
	cmp	Zbc,x
	beq	Ld130
	jsr	Sd2a1
	bra	Ld188
Ld13f:	jsr	Sd2ea
	ldx	#$ff
	stx	Z2f
	jsr	Sd6e8
	jsr	Sd80b
	ldx	Z32
	beq	Ld15a
	lda	#$80
	jsr	Sf8ba
	lda	#$1f
	jsr	Sd651
Ld15a:	lda	Z32
	cmp	#$01
	beq	Ld188
	ldx	Z33
Ld162:	dex
	bmi	Ld185
	bit	Z34,x
	bmi	Ld162
	stx	Z13
	stx	Z2f
	jsr	Sd7b0
	ldx	Z13
	jsr	Sd905
	phx
	clc
	jsr	Sd4cc
	jsr	Sd80b
	ldx	Z13
	jsr	Sd835
	plx
	bra	Ld162
Ld185:	jsr	Sd7b0
Ld188:	bit	Z6f
	bmi	Ld19e
	ldx	#$ff
	stx	Z2f
	jsr	Sd7b0
	ldx	Z6f
	lda	D0a0a,x
	bit	D0a09
	jsr	Sed05
Ld19e:	lda	#$ff
	sta	Z01
	sta	Z00
	ldx	#$03
Ld1a6:	dec	Zad
	bne	Ld1b6
	dec	Zae
	bne	Ld1b6
	dex
	bne	Ld1b6
	jsr	Sd8dd
	ldx	#$03
Ld1b6:	lda	Z00
	bmi	Ld1a6
	sta	Ze0
	lda	Z02
	sta	Ze1
	lda	Z03
	sta	Ze2
	lda	Z05
	sta	Ze3
	lda	Z06
	sta	Ze4
Ld1cc:	jsr	Z87
	bcs	Ld1d5
	lda	#$ff
	sta	Z00
Ld1d5:	stz	Zae
	stz	Z13
	jsr	Sd80b
	lda	Z00
	bpl	Ld1cc
	bit	D0a08
	ldx	#$03
	bra	Ld1a6

Sd1e7:	stz	Z56
	stz	Z58
	stz	Z61
	stz	Zb4
	lda	#$ff
	sta	Z15
	sta	Z1b
	sta	Z14
	lda	Z00
	cmp	#$0f
	bcc	Ld213
	cmp	#$7e
	bcc	Ld20c
	eor	#$7e
	beq	Ld207
	lda	#$40
Ld207:	sta	D7c09
	clc
	rts

Ld20c:	cmp	#$3d
	bne	Ld246
	jmp	L8f00

Ld213:	stz	Zb5
Ld215:	lda	Z33
	cmp	Z03
	bcs	Ld235
	lda	Z00
	ora	Z05
	bne	Ld231
	bit	Z02
	bvc	Ld231
	lda	Z03
	bpl	Ld231
	sta	Zb5
	and	#$7f
	sta	Z03
	bne	Ld215
Ld231:	lda	#$11
	bra	Sd297
Ld235:	ldx	Z03
	dex
	stx	Z2f
	bmi	Ld248
	lda	Z34,x
	bpl	Ld248
	lda	Z00
	cmp	#$0d
	bcc	Ld257
Ld246:	bra	Ld295
Ld248:	lda	#$1f
	jsr	Sd651
	jsr	Sd7b0
	lda	Z00
	asl
	tax
	jmp	(Dd277,x)

Ld257:	ldx	#$ff
	stx	Z2f
	jsr	Sd7cc
	jsr	Sd80b
	ldx	Z03
	stx	Z2f
	jsr	Sf812
	lda	Z32
	cmp	#$01
	beq	Ld275
	lda	#$ff
	sta	Z2f
	jsr	Sd7b0
Ld275:	clc
	rts

Dd277:	fdb	Led66
	fdb	Ldf25
	fdb	Le0bf
	fdb	Lefad
	fdb	Leba2
	fdb	Ld112
	fdb	Ld295
	fdb	Ld295
	fdb	Lde50
	fdb	Lde50
	fdb	Lef73
	fdb	Lee77
	fdb	Le1ae
	fdb	Le2c0
	fdb	Le33b

Ld295:	lda	#$01
Sd297:	clc
	sta	Z56
	stz	Z01
	rts

Ld29d:	lda	#$22
	bra	Sd297

Sd2a1:	jsr	Sd301
	lda	#$d2
	sta	Zbb
	lda	#$75
	sta	Zba
	lda	#$ff
	sta	Z2f
	jsr	Sd6e8
	lda	#$96
	jsr	Sf730
	lda	#$1f
	jsr	Sd651
	jsr	Sd7cc
	jsr	Sf71d
	jsr	Sd7b0
	jsr	Sf73c
	jsr	Sd7cc
	jsr	Sd362
	stz	Z32
	ldx	Z33
	inx
	lda	#$00
	jsr	Sf8ba
	beq	Ld2e5
	ldx	Z33
	inx
	stx	Z32
	clc
	adc	Z33
	sta	Z33
Ld2e5:	stz	Z2f
	jsr	Sd30c

Sd2ea:	ldx	#$1f
	lda	#$40
Ld2ee:	stz	D0b00,x
	stz	D0b20,x
	sta	D0b40,x
	cpx	#$12
	bne	Ld2fd
	lda	#$80
Ld2fd:	dex
	bpl	Ld2ee
	rts

Sd301:	ldx	#$bb
Ld303:	lda	D8000,x
	sta	Z00,x
	dex
	bne	Ld303
	rts

Sd30c:	ldx	#$bf
Ld30e:	lda	D8000,x
	sta	Z00,x
	dex
	cpx	#$bb
	bne	Ld30e
	rts

Sd319:	ldy	#$00		; copy cn00 slot ROM image into slot pseudoROM
Ld31b:	lda	D8100,y
	sta	D7b00,y
	iny
	bne	Ld31b

Ld324:	lda	D8200,y		; copy ca00-cfff shared ROM image
	sta	D0200,y
	lda	D8200+$100,y
	sta	D0200+$100,y
	lda	D8200+$0200,y
	sta	D7c00,y
	lda	D8200+$0300,y
	sta	D7c00+$0100,y
	lda	D8200+$0400,y
	sta	D7c00+$0200,y
	lda	D8200+$0500,y
	sta	D7c00+$0300,y

	iny
	bne	Ld324

	lda	#$16
	sta	D7b0b+1		; change target to HLCn23
	stz	D7b21+1		; allow host to proceed

	lda	#$60
	sta	D0b80
	sta	D0ba0
	sta	D0bc0
	sta	D0be0
	rts

Sd362:	jsr	Sd80b
	ldx	#$00
Ld367:	stx	Z13
	stx	Z2f
	jsr	Sd3a2
	bcs	Ld398
	ora	#$01
	sta	Z34,x
	lda	#$03
	jsr	Sd888
	jsr	Sd953
	bvc	Ld383
	jsr	Sd55a
	bra	Ld38e
Ld383:	clc
	jsr	Sd4cc
	bcc	Ld38e
	ldx	Z13
	jsr	Sed05
Ld38e:	jsr	Sd80b
	ldx	Z13
	inx
	cpx	#$02
	bcc	Ld367
Ld398:	stx	Z33
	txa
	beq	Ld3a1
	dex
	jsr	Sd835
Ld3a1:	rts

Sd3a2:	jsr	Sd7b0
	lda	D0a0a,x
	bit	D0a0c
	bit	D0a0e
	bit	D0a09
	lda	#$01
	jsr	Sd888
	lda	#$00
	jsr	Sd892
	bcc	Ld3e0
	lda	#$00
	jsr	Sd888
	lda	#$00
	jsr	Sd892
	bcs	Ld3e0
	lda	#$01
	jsr	Sd888
	lda	#$00
	jsr	Sd892
	bcc	Ld3e0
	lda	#$05
	jsr	Sd892
	bcc	Ld3e1
	lda	#$02
	clc
	rts

Ld3e0:	sec
Ld3e1:	rts

Sd3e2:	stx	Z13
	lda	#$04
	sta	Z58
	jsr	Sd8c1
Ld3eb:	stz	Z16
	jsr	Se500
	bcc	Ld40c
	lda	Z57
	bit	#$20
	bne	Ld400
	bit	#$04
	beq	Ld406
	lda	Z2b
	sta	Z14
Ld400:	dec	Z58
	bne	Ld3eb
	bra	Ld446
Ld406:	bit	#$01
	bne	Ld446
	sec
	rts

Ld40c:	ldx	Z13
	jsr	Sd94d
	ldy	#$04
	lda	Z11,x
	and	#$1f
	cmp	#$02
	bne	Ld41d
	ldy	#$06
Ld41d:	bit	Z0f,x
	bmi	Ld429
	lda	Z46,x
	ora	#$10
	sta	Z46,x
	ldy	#$02
Ld429:	lda	Def63,y
	sta	Z42,x
	lda	Def64,y
	sta	Z44,x
	lda	Z46,x
	and	#$bf
	sta	Z46,x
	lda	Z3a,x
	and	#$94
	ora	Dd4be,y
	sta	Z3a,x
	sty	Z40,x
	clc
	rts

Ld446:	ldx	Z13
	lda	#$02
	bit	Z34,x
	beq	Ld48e
	lda	#$06
	jsr	Sd888
	lda	#$0b
	jsr	Sf730
	jsr	Sd7e8
	lda	#$07
	jsr	Sd892
	bcc	Ld446
	jsr	Sd8c1
	stz	Z14
	lda	#$04
	sta	Z58
Ld46b:	stz	Z16
	jsr	Se500
	bcc	Ld49b
	lda	Z57
	bit	#$20
	bne	Ld480
	bit	#$04
	beq	Ld480
	lda	Z2b
	sta	Z14
Ld480:	dec	Z58
	bne	Ld46b
	lda	#$07
	jsr	Sd888
	lda	#$0b
	jsr	Sf730
Ld48e:	jsr	Sd80b
	ldx	Z13
	lda	Z3a,x
	and	#$9f
	sta	Z3a,x
	sec
	rts

Ld49b:	jsr	Sd76e
	ldx	Z13
	jsr	Sd94d
	ldy	#$08
	lda	Def63,y
	sta	Z42,x
	lda	Def64,y
	sta	Z44,x
	lda	Z46,x
	and	#$bf
	sta	Z46,x
	lda	Dd4be,y
	sta	Z3a,x
	sty	Z40,x
	clc
	rts

Dd4be:	fcb	$00,$00,$11,$88,$11,$88,$11,$88
	fcb	$32,$09,$52,$12,$52,$12

Sd4cc:	php
	pha
	stx	Z13
	jsr	Sd55e
	lda	#$02
	jsr	Sd892
	bcc	Ld4df
	pla
	lda	#$2f
	bra	Ld557
Ld4df:	lda	#$02
	bit	Z34,x
	beq	Ld545
	lda	#$0f
	jsr	Sd892
	bcs	Ld545
	lda	#$80
	sta	Z0f,x
	lda	#$54
	ora	Z3a,x
	sta	Z3a,x
	lda	Z46,x
	and	#$bf
	sta	Z46,x
	jsr	Sd60b
	jsr	Sd7e8
	jsr	Sd576
	stz	Z16
	stz	Z14
	jsr	Sd8c1
	lda	#$04
	sta	Z58
Ld510:	stz	Z16
	jsr	Se500
	bcc	Ld52b
	lda	Z57
	bit	#$20
	bne	Ld525
	bit	#$04
	beq	Ld525
	lda	Z2b
	sta	Z14
Ld525:	dec	Z58
	bne	Ld510
	bra	Ld554
Ld52b:	jsr	Sd76e
	ldx	Z13
	jsr	Sd94d
	ldy	#$0a
	lda	Def63,y
	sta	Z42,x
	lda	Def64,y
	sta	Z44,x
	sty	Z40,x
	clc
Ld542:	pla
	plp
	rts

Ld545:	jsr	Sd60b
	jsr	Sd576
	stz	Z16
	ldx	Z13
	jsr	Sd3e2
	bcc	Ld542
Ld554:	pla
	lda	#$27
Ld557:	plp
	sec
	rts

Sd55a:	lda	#$40
	sta	Z46,x

Sd55e:	stz	Z42,x
	stz	Z44,x
	lda	Z3a,x
	and	#$80
	sta	Z3a,x
	lda	#$ff
	sta	Z0d,x
	stz	Z40,x
	phx
	phy
	jsr	Sda30
	ply
	plx
	rts

Sd576:	lda	#$08
	jsr	Sd892
	bcc	Ld59b
	jsr	Sd59c
	lda	#$08
	jsr	Sd888
	ldx	Z2f
	lda	#$01
	bit	Z46,x
	bne	Ld596
	ora	Z46,x
	sta	Z46,x
	lda	#$c8
	jsr	Sf730
Ld596:	lda	#$64
	jsr	Sf735
Ld59b:	rts

Sd59c:	ldx	Z2f
	lda	#$02
	bit	Z34,x
	beq	Ld5c4
	ldy	#$06
	lda	#$60
	bit	Z3a,x
	bne	Ld5ad
	iny
Ld5ad:	lda	#$07
	jsr	Sd892
	bcs	Ld5ba
	cpy	#$07
	beq	Ld5c4
	bra	Ld5be
Ld5ba:	cpy	#$06
	beq	Ld5c4
Ld5be:	tya
	jsr	Sd888
	lda	#$07
Ld5c4:	rts

Sd5c5:	lda	#$04
	jsr	Sd888
	lda	#$04
	jsr	Sd8d1
	dex
	bne	Sd5c5
	ldx	#$3e
Ld5d4:	dex
	bne	Ld5d4
	rts


; seek
Sd5d8:	jmp	Z7b	; hook to immediately following Ld5db

Ld5db:	ldx	Z2f
	lda	Z0d,x
	bpl	Ld5e6
	jsr	Sd60b
	bcs	Ld60a
Ld5e6:	ldx	Z2f
	lda	Z0d,x
	sec
	sbc	Z14
	beq	Ld609
	ldy	#$01
	bcs	Ld5f9
	ldy	#$00
	eor	#$ff
	adc	#$01
Ld5f9:	tax
	tya
	jsr	Sd888
	jsr	Sd5c5
	ldx	Z2f
	lda	Z14
	sta	Z0d,x
	lda	#$01
Ld609:	clc
Ld60a:	rts

Sd60b:	stz	Z57
	lda	#$01
	jsr	Sd888
	lda	#$0a
	jsr	Sd892
	bcc	Ld63d
	ldy	#$05
Ld61b:	ldx	#$10
	jsr	Sd5c5
	ldx	#$10
Ld622:	lda	#$07
	jsr	Sf735
	lda	#$0a
	jsr	Sd892
	bcc	Ld63d
	dex
	bne	Ld622
	dey
	bne	Ld61b
	lda	#$02
	tsb	Z57
	lda	#$ff
	sec
	bra	Ld640
Ld63d:	lda	#$00
	clc
Ld640:	ldx	Z2f
	sta	Z0d,x
	rts

Sd645:	lda	Z16
	beq	Ld64d
	sta	D0a41
	rts

Ld64d:	sta	D0a40
	rts

Sd651:	bit	D0a0e
	tay
	bit	D0a08
	bit	D0a0d
Ld65b:	lda	D0a0e
	and	#$20
	bne	Ld65b
	bra	Ld667
Ld664:	sty	D0a0f
Ld667:	tya
	eor	D0a0e
	and	#$1f
	bne	Ld664
	lda	#$40
	trb	Zb4
	lda	D0a0c
	rts


Sd677:	lda	Z14
	cmp	#$50
	bcc	Ld67f
	lda	#$00
Ld67f:	ldx	#$fe
Ld681:	inx
	inx
	cmp	Dd6be,x
	bcs	Ld681
	lda	Dd6be+1,x
	tax

	ldy	#$05		; max times to retry writing ISM params

; verify ISM parameters
Ld68e:	lda	#$18		; clear write and action bits, reset param ptr
	sta	ism_w_zeros
	phx			; save table start index in case we rewrite it
Ld694:	dex
	lda	Dd6c6,x
	beq	Ld6a1
	cmp	ism_r_param
	bne	Ld6a4
	bra	Ld694
Ld6a1:	plx			; pop table start index, no longer needed
	clc
	rts

; write ISM parameters
Ld6a4:	lda	#$18		; clear write and action bits, reset param ptr
	sta	ism_w_zeros
	plx			; pop and re-push table start index
	phx
Ld6ab:	pha
	pla
	dex
	lda	Dd6c6,x
	beq	Ld6b8
	sta	ism_w_param
	bra	Ld6ab
Ld6b8:	plx			; pop table start index, no longer needed
	dey			; any retries left?
				;   (stupid, check should be after verify!)
	bne	Ld68e		;   yes, verify ISM parameters
	sec			;   no, fail
	rts


Dd6be:	fcb	$28,Dd6c6_end-Dd6c6
	fcb	$50,Dd6d7_end-Dd6c6
	fcb	$50,$00
	fcb	$50,$00


; ISM parameters (720K?)
; See _SWIM Chip User's Reference_
Dd6c6:	fcb	$00	; end of table
	fcb	$3b	; WR: time 1
	fcb	$57	; WR: late | normal
	fcb	$1b	; WR: time 0
	fcb	$97	; WR: late | normal
	fcb	$19	; RD: LLS
	fcb	$19	; RD: LLL
	fcb	$2f	; RD: LSS
	fcb	$2f	; RD: LSL
	fcb	$1b	; RD: CSLS
	fcb	$1b	; RD: RPB
	fcb	$18	; RD: SLS
	fcb	$18	; RD: SLL
	fcb	$2e	; RD: SSS
	fcb	$2e	; RD: SSL
	fcb	65	; RD: correction multiplier
	fcb	$18	; RD: min cell time
Dd6c6_end:

; ISM parameters (1440K?)
Dd6d7:	fcb	$00
	fcb	$3b,$57,$1b,$97,$19,$19,$2f,$2f
	fcb	$1b,$1b,$18,$18,$2e,$2e,$41,$18
Dd6d7_end:


Sd6e8:	stz	Zb4
	stz	Z6a
	jsr	Sd714
	lda	#$00
	sta	D0a05
	sta	Z6a
	lda	D0a0d
	lda	#$38
	sta	D0a06
	lda	#$00
	sta	D0a02
	lda	D0a0e
	lda	D0a0c
	ora	#$f0
	sta	D0a04
	jsr	Sd677
	jmp	Sd76e

Sd714:	phx

	bit	Zb4
	bvs	Ld743

	bit	D0a0e
	bit	D0a0d
	lda	D0a0e
	pha
	bit	D0a08
	and	#$1f
	ora	#$40
	sta	D0a0f
	eor	#$40
	sta	D0a0f
	eor	#$40
	sta	D0a0f
	sta	D0a0f
	lda	#$40
	tsb	Zb4
	pla
	bit	#$20
	beq	Ld767
Ld743:	lda	D0a0e
	and	#$06
	cmp	#$06
	bne	Ld751
	lda	#$06
	sta	D0a06

Ld751:	ldx	Z2f		; drive number
	cpx	#$02		; out of range?
	bcs	Ld767
	lda	#$06		; deselect both drives
	sta	ism_w_zeros
	lda	Dd76c,x
	sta	ism_w_ones
	lda	#$80		; turn on motor
	sta	ism_w_ones
Ld767:	plx
	lda	D0a0e
	rts

Dd76c:	fcb	$02,$04		; drive enable table for ISM mode


Sd76e:	lda	ism_r_status	; save motor on state
	pha

	lda	#$9e
	sta	ism_w_zeros

	lda	#$40		; switch to IWM mode
	sta	ism_w_zeros

	pha			; delay
	pla

	bit	D0a0e		; Q7L
	bit	D0a0c		; Q6L

	lda	#$40
	trb	Zb4

	pla			; was motor on?
	bmi	Ld797

	phx
	ldx	Z2f
	cpx	#$02
	bcs	Ld795
	bit	D0a0a,x
Ld795:	plx
	rts

Ld797:	phx
	ldx	#$00
	bit	#$04
	beq	Ld7a0
	ldx	#$01
Ld7a0:	bit	D0a0a,x
	plx
	bit	D0a09
	rts


Sd7a8:	bit	Zb4
	bvc	Ld7af

	jsr	Sd76e
Ld7af:	rts

Sd7b0:	pha
	lda	#$02
	bit	Z6a
	bne	Ld7ca
	jsr	Sd714
	lda	#$02
	ora	D0a0d
	sta	D0a05
	sta	Z6a
	cmp	D0a0d
	jsr	Sd76e
Ld7ca:	pla
	rts

Sd7cc:	pha
	lda	#$02
	bit	Z6a
	beq	Ld7e6
	jsr	Sd714
	lda	#$fd
	and	D0a0d
	sta	D0a05
	sta	Z6a
	cmp	D0a0d
	jsr	Sd76e
Ld7e6:	pla
	rts

Sd7e8:	lda	#$80
	tsb	Zb4
	lda	#$20
	bit	Z6a
	bne	Ld80a
	jsr	Sd714
	lda	#$20
	sta	D0a07
	ora	D0a0d
	sta	D0a05
	sta	Z6a
	lda	#$40
	sta	D0a02
	jsr	Sd76e
Ld80a:	rts

Sd80b:	lda	#$80
	trb	Zb4
	lda	#$20
	bit	Z6a
	beq	Ld82f
	jsr	Sd714
	lda	#$20
	sta	D0a06
	lda	D0a0d
	and	#$df
	sta	D0a05
	sta	Z6a
	lda	#$00
	sta	D0a02
	jsr	Sd76e
Ld82f:	lda	#$1f
	jsr	Sd651
	rts

Sd835:	cpx	#$02
	bcs	Ld85d
	stx	Z2f
	jsr	Sd714
	lda	Dd76c,x
	ora	#$80
	sta	D0a07
	lda	#$32
Ld848:	dec
	bne	Ld848
	lda	D0a0d
	and	#$fd
	sta	D0a05
	sta	Z6a
	lda	#$19
Ld857:	dec
	bpl	Ld857
	jsr	Sd76e
Ld85d:	rts

Sd85e:	bit	D0a00
	bit	D0a03
	bit	D0a06
	bit	D0a04
	lsr
	bcc	Ld870
	bit	D0a05
Ld870:	lsr
	bcc	Ld878
	bit	D0a41
	bra	Ld87b
Ld878:	bit	D0a40
Ld87b:	lsr
	bcc	Ld881
	bit	D0a01
Ld881:	lsr
	bcs	Ld887
	bit	D0a02
Ld887:	rts

Sd888:	jsr	Sd85e
	bit	D0a07
	bit	D0a06
	rts

Sd892:	jsr	Sd85e
	bit	D0a0d
	lda	D0a0e
	and	#$80
	asl
	rts

Sd89f:	lda	#$0b
	jsr	Sd892
	bcc	Ld8c0
	ldx	#$03
	ldy	#$e8
Ld8aa:	lda	#$92
	sta	Z30
Ld8ae:	bit	D0a0e
	bpl	Ld8bf
	dec	Z30
	bne	Ld8ae
	dey
	bne	Ld8aa
	dex
	bne	Ld8aa
	sec
	rts

Ld8bf:	clc
Ld8c0:	rts

Sd8c1:	lda	#$0b
	jsr	Sd892
	bcc	Ld8d0
Ld8c8:	lda	D0a0e
	and	#$80
	bmi	Ld8c8
	asl
Ld8d0:	rts

Sd8d1:	jsr	Sd892
Ld8d4:	lda	D0a0e
	and	#$80
	bpl	Ld8d4
	asl
	rts

Sd8dd:	ldx	#$00
	lda	Z34,x
	bmi	Ld904
	beq	Ld904
	jsr	Sd7b0
Ld8e8:	ldy	#$0a
Ld8ea:	dey
	bne	Ld8ea
	jsr	Sd94d
	bvc	Ld8f5
	jsr	Sd55a
Ld8f5:	inx
	cpx	#$01
	bne	Ld900
	lda	Z34,x
	bmi	Ld900
	bne	Ld8e8
Ld900:	dex
	jsr	Sd835
Ld904:	rts

Sd905:	jsr	Sd94d
	bvc	Ld91b
	php
	jsr	Sd55a
	plp
	bpl	Ld916
	jsr	Sd93d
	bcs	Ld939
Ld916:	lda	#$2f
	sec
	bra	Ld939
Ld91b:	bmi	Ld928
	lda	Z40,x
	bne	Sd930
	jsr	Sd930
	bit	Dd93c
	rts

Ld928:	jsr	Sd55e
	jsr	Sd93d
	bcs	Ld939

Sd930:	lda	#$20
	and	Z46,x
	beq	Ld938
	lda	#$2b
Ld938:	clc
Ld939:	bit	Z46,x
	rts

Dd93c:	fcb	$a0

Sd93d:	lda	#$03
	jsr	Sd888
	lda	#$2e
	sec
	bit	Z02
	bvs	Ld94c
	lda	#$00
	clc
Ld94c:	rts

Sd94d:	lda	D0a0a,x
	bit	D0a09

Sd953:	lda	Z46,x
	sta	Z3f
	and	#$1f
	ora	#$20
	sta	Z46,x
	ldy	#$03
Ld95f:	lda	Dd975,y
	jsr	Sd892
	bcc	Ld96e
	lda	Dd978,y
	eor	Z46,x
	sta	Z46,x
Ld96e:	dey
	bne	Ld95f
	lda	#$20
	bit	Z46,x
Dd975:	rts

	fcb	$06,$02
Dd978:	fcb	$0c,$20,$40,$80

Sd97c:	lda	#$80
	ldx	#$12
Ld980:	bit	D0b3f,x
	bvs	Ld988
	sta	D0b3f,x
Ld988:	dex
	bne	Ld980
	rts

	lda	D0b3f,y
	bit	#$40
	bne	Ld998
	lda	#$80
	sta	D0b3f,y
Ld998:	lda	Dd9d9,y
	sty	Z2e
	sta	Z2d
	rts

Sd9a0:	lda	Dd9ee,x
	tax
	lda	#$8f
	sta	D0b3f,x
	lda	Dd9d9,x
	sta	Z2d
	stx	Z2e

Sd9b0:	tax
	lda	Dd9be,x
	sta	Zb0
	dec
	sta	Zac
	stz	Zab
	stz	Zaf
	rts

Dd9be:	fcb	$01,$03,$05,$07,$09,$0b,$0d,$0f
	fcb	$11,$13,$15,$17,$19,$1b,$1d,$1f
	fcb	$21,$23,$25,$27,$29,$2b,$2d,$2f
	fcb	$31,$33,$35

Dd9d9:	fcb	$37,$08,$09,$0a,$0b,$0c,$0d,$0e
	fcb	$0f,$10,$11,$12,$13,$14,$15,$16
	fcb	$17,$18,$19,$1a,$1b

Dd9ee:	fcb	$01,$02,$03,$04,$05,$06,$07,$08
	fcb	$09,$0a,$0b,$0c,$0d,$0e,$0f,$10
	fcb	$11,$12

Sda00:	ldy	Z2e
	beq	Lda1b
	sta	D0b1f,y
	lda	Z16
	cmp	#$01
	lda	Z14
	rol
	sta	D0aff,y
	lda	Z2f
	cmp	Z33
	bcs	Lda1b
	sta	D0b3f,y
	rts

Lda1b:	lda	#$8e
	sta	D0b3f,y
	rts

Sda21:	ldx	Z2f
	lda	Z05
	cmp	Z42,x
	lda	Z06
	sbc	Z44,x
	bcc	Lda2f
	lda	#$2d
Lda2f:	rts

Sda30:	stx	Z13
	ldy	#$12
Lda34:	lda	D0b3f,y
	cmp	#$20
	bcs	Lda44
	cmp	Z13
	bne	Lda44
	lda	#$80
	sta	D0b3f,y
Lda44:	dey
	bne	Lda34
	rts

Sda48:	ldy	Z15
	lda	Dd9ee,y
	tay
	jsr	Sda5a
	bne	Lda58
	lda	Dd9d9,y
	sec
	rts

Lda58:	clc
	rts

Sda5a:	lda	D0b3f,y
	cmp	Z2f
	bne	Lda72
	lda	Z16
	cmp	#$01
	lda	Z14
	rol
	cmp	D0aff,y
	bne	Lda72
	lda	Z15
	cmp	D0b1f,y
Lda72:	rts

Sda73:	ldx	Z2f
	lda	Z40,x
	tax
	jmp	(Dda7b,x)

Dda7b:	fdb	Lda89
	fdb	Lda93
	fdb	Ldb22
	fdb	Ldb22
	fdb	Ldc47
	fdb	Ldbae
	fdb	Ldbae

Lda89:	stz	Z16
	stz	Z14
	stz	Z15
	lda	#$3d
	sec
	rts

Lda93:	lda	Z05
	sta	Z16
	and	#$0f
	sta	Z15
	lda	Z06
	rol	Z16
	rol
	rol	Z16
	rol
	rol	Z16
	rol
	rol	Z16
	rol
	tax
	lda	Ddabe,x
	sta	Z1b
	lda	Ddaf0,x
	and	#$e0
	ora	Z15
	tay
	lda	Ddaf0,x
	jsr	Sdd13
	rts

Ddabe:	fcb	$00,$02,$04,$08,$0a,$0c,$10,$12
	fcb	$14,$18,$1a,$1c,$20,$22,$24,$28
	fcb	$2a,$2e,$30,$34,$36,$3a,$3c,$40
	fcb	$42,$46,$48,$4c,$50,$52,$56,$58
	fcb	$5c,$60,$62,$66,$6a,$6e,$70,$74
	fcb	$78,$7c,$80,$84,$88,$8c,$90,$94
	fcb	$98,$9c

Ddaf0:	fcb	$00,$04,$08,$00,$04,$08,$00,$04
	fcb	$08,$00,$04,$08,$20,$25,$2a,$24
	fcb	$29,$23,$28,$22,$27,$21,$26,$40
	fcb	$46,$42,$48,$44,$40,$46,$42,$48
	fcb	$44,$60,$67,$65,$63,$61,$68,$66
	fcb	$64,$62,$80,$80,$80,$80,$80,$80
	fcb	$80,$80

Ldb22:	lda	Z05
	sta	Z16
	and	#$1f
	sta	Z15
	lda	Z06
	rol	Z16
	rol
	rol	Z16
	rol
	rol	Z16
	rol
	tax
	lda	Ddb4a,x
	sta	Z1b
	lda	Ddb7c,x
	and	#$e0
	ora	Z15
	tay
	lda	Ddb7c,x
	jsr	Sdcd4
	rts

Ddb4a:	fcb	$00,$02,$05,$08,$0a,$0d,$10,$12
	fcb	$15,$18,$1a,$1d,$20,$22,$25,$28
	fcb	$2b,$2e,$31,$34,$37,$3a,$3d,$40
	fcb	$43,$46,$49,$4c,$50,$53,$56,$59
	fcb	$5c,$60,$63,$67,$6a,$6e,$71,$75
	fcb	$78,$7c,$80,$84,$88,$8c,$90,$94
	fcb	$98,$9c

Ddb7c:	fcb	$00,$08,$04,$00,$08,$04,$00,$08
	fcb	$04,$00,$08,$04,$20,$2a,$29,$28
	fcb	$27,$26,$25,$24,$23,$22,$21,$40
	fcb	$42,$44,$46,$48,$40,$42,$44,$46
	fcb	$48,$60,$65,$61,$66,$62,$67,$63
	fcb	$68,$64,$80,$80,$80,$80,$80,$80
	fcb	$80,$80

Ldbae:	ldx	#$fe
Ldbb0:	inx
	inx
	lda	Ddc03,x
	cmp	Z05
	lda	Ddc03+1,x
	sbc	Z06
	bcc	Ldbb0

	lda	Z05
	sbc	Ddc01,x
	sta	Z23
	lda	Z06
	sbc	Ddc01+1,x
	sta	Z24

	lda	Ddc25,x
	tax
	lda	Z23
	bpl	Ldbde
	sec
	sbc	#$7e
	tay
	txa
	clc
	adc	#$07
	tax
	tya
Ldbde:	cmp	#$12
	bcc	Ldbed
Ldbe2:	sec
	sbc	#$12
	bmi	Ldbea
	inx
	bra	Ldbe2
Ldbea:	clc
	adc	#$12
Ldbed:	sta	Z15
	stx	Z1b
	txa
	lsr
	sta	Z14
	lda	#$00
	bcc	Ldbfb
	lda	#$20
Ldbfb:	sta	Z16
	lda	#$12
	clc
	rts

Ddc01:	fdb	$0000

; multiples of 180
Ddc03:
cnt	set	1
	while	cnt <= 16
	fdb	cnt*180
cnt	set	cnt+1
	endm
	fdb	$ffff

; multiples of 10
Ddc25:
cnt	set	0
	while	cnt <= 15
	fdb	cnt*10
cnt	set	cnt+1
	endm
	fdb	$ffff

Ldc47:	ldx	#$fe
Ldc49:	inx
	inx
	lda	Ddc90,x
	cmp	Z05
	lda	Ddc90+1,x
	sbc	Z06
	bcc	Ldc49
	lda	Z05
	sbc	Ddc8e,x
	sta	Z23
	lda	Z06
	sbc	Ddc8e+1,x
	sta	Z24
	lda	Ddcb2,x
	tax
	lda	Z23
	cmp	#$09
	bcc	Ldc7a
Ldc6f:	sec
	sbc	#$09
	bmi	Ldc77
	inx
	bra	Ldc6f
Ldc77:	clc
	adc	#$09
Ldc7a:	sta	Z15
	stx	Z1b
	txa
	lsr
	sta	Z14
	lda	#$00
	bcc	Ldc88
	lda	#$20
Ldc88:	sta	Z16
	lda	#$09
	clc
	rts

Ddc8e:	fdb	$0000

; multiples of 90
Ddc90:
cnt	set	1
	while	cnt <= 16
	fdb	cnt*90
cnt	set	cnt+1
	endm
	fdb	$ffff

; multiples of 10
; (could have used the identical table at Ddc25)
Ddcb2:
cnt	set	0
	while	cnt <= 15
	fdb	cnt*10
cnt	set	cnt+1
	endm
	fdb	$ffff

Sdcd4:	and	#$1f
	clc
	sta	Z15
	lda	Ddd4f,y
	and	#$1f
	adc	Z15
	tax
	lda	Ddd4f,y
	lsr
	lsr
	lsr
	lsr
	lsr
	clc
	adc	Z1b
	sta	Z1b
	lsr
	lsr
	lsr
	lsr
	lsr
	tay
	txa
	cmp	Dde35,y
	bcc	Ldcff
	sbc	Dde35,y
	inc	Z1b
Ldcff:	sta	Z15
	lda	Z1b
	lsr
	sta	Z14
	lda	#$00
	bcc	Ldd0c
	lda	#$20
Ldd0c:	sta	Z16
	lda	Dde35,y
	clc
	rts

Sdd13:	and	#$1f
	clc
	sta	Z15
	lda	Ddd4f,y
	and	#$1f
	adc	Z15
	tax
	lda	Ddd4f,y
	lsr
	lsr
	lsr
	lsr
	and	#$0e
	clc
	adc	Z1b
	sta	Z1b
	lsr
	lsr
	lsr
	lsr
	lsr
	tay
	txa
	cmp	Dde35,y
	bcc	Ldd41
	sbc	Dde35,y
	inc	Z1b
	inc	Z1b
Ldd41:	sta	Z15
	lda	Z1b
	lsr
	sta	Z14
	stz	Z16
	lda	Dde35,y
	clc
	rts

Ddd4f:	fcb	$00,$01,$02,$03,$04,$05,$06,$07
	fcb	$08,$09,$0a,$0b,$20,$21,$22,$23
	fcb	$24,$25,$26,$27,$28,$29,$2a,$2b
	fcb	$40,$41,$42,$43,$44,$45,$46,$47
	fcb	$00,$01,$02,$03,$04,$05,$06,$07
	fcb	$08,$09,$0a,$20,$21,$22,$23,$24
	fcb	$25,$26,$27,$28,$29,$2a,$40,$41
	fcb	$42,$43,$44,$45,$46,$47,$48,$49
	fcb	$00,$01,$02,$03,$04,$05,$06,$07
	fcb	$08,$09,$20,$21,$22,$23,$24,$25
	fcb	$26,$27,$28,$29,$40,$41,$42,$43
	fcb	$44,$45,$46,$47,$48,$49,$60,$61
	fcb	$00,$01,$02,$03,$04,$05,$06,$07
	fcb	$08,$20,$21,$22,$23,$24,$25,$26
	fcb	$27,$28,$40,$41,$42,$43,$44,$45
	fcb	$46,$47,$48,$60,$61,$62,$63,$64
	fcb	$00,$01,$02,$03,$04,$05,$06,$07
	fcb	$20,$21,$22,$23,$24,$25,$26,$27
	fcb	$40,$41,$42,$43,$44,$45,$46,$47
	fcb	$60,$61,$62,$63,$64,$65,$66,$67
	fcb	$00,$01,$02,$03,$04,$05,$06,$07
	fcb	$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
	fcb	$10,$11,$00,$01,$02,$03,$04,$05
	fcb	$06,$07,$08,$09,$0a,$0b,$0c,$0d
	fcb	$0e,$0f,$10,$11,$00,$01,$02,$03
	fcb	$04,$05,$06,$07,$08,$09,$0a,$0b
	fcb	$0c,$0d,$0e,$0f,$10,$11,$00,$01
	fcb	$02,$03,$04,$05,$06,$07,$08,$09
	fcb	$12,$11,$10,$0f,$0e,$0d

Dde35:	fcb	$0c,$0b,$0a,$09,$08

Sde3a:	inc	Z59
	bne	Lde40
	inc	Z5a
Lde40:	dec	Z58
	bpl	Lde4a
	lda	#$27
	sta	Z56
	sec
	rts

Lde4a:	lda	Z57
	stz	Z57
	clc
	rts

Lde50:	lda	#$11
	ldx	Z2f
	bpl	Lde59
Lde56:	jmp	Sd297

Lde59:	jsr	Sd905
	bpl	Lde61
	jsr	Sd4cc
Lde61:	bcs	Lde56
	lda	Z40,y
	cmp	#$04
	beq	Lde73
	cmp	#$02
	beq	Lde73
	lda	#$27
	jmp	Sd297

Lde73:	lda	Z0c
	cmp	#$02
	beq	Lde7c
Lde79:	jmp	Ld29d

Lde7c:	lda	Z0b
	cmp	#$0c
	bne	Lde79
	lda	Z07
	sta	Z05
	lda	Z08
	sta	Z06
	stz	Z07
	stz	Z08
	dec	Z61
	lda	#$06
	sta	Z2d
	lda	Z00
	cmp	#$01
	beq	Lde9d
	jmp	Le0bf

Lde9d:	jsr	Sdec6
	bcs	Ldec4
	ldy	#$0b
Ldea4:	lda	D01b2,y
	sta	D0c00,y
	dey
	bpl	Ldea4
	ldy	#$00
Ldeaf:	lda	D0e00,y
	sta	D0c0c,y
	lda	D0f00,y
	sta	D0d0c,y
	iny
	bne	Ldeaf
	lda	Z2d
	stz	Z56
	sta	Z01
Ldec4:	clc
	rts

Sdec6:	jsr	Sda21
	bcs	Ldf0c
	lda	#$06
	sta	Z58
	stz	Zb4
	jsr	Sd576
	jsr	Sda73
	bcs	Ldf0c
	asl
	asl
	asl
	sta	Z1c
Ldede:	jsr	Sd5d8
	bcs	Ldf0a
Ldee3:	lda	Z2d
	jsr	Sd9b0
	jsr	Sd8c1
Ldeeb:	jsr	Se500
	bcc	Ldf11
	jsr	Sde3a
	bcs	Ldf0a
	bit	#$04
	bne	Ldede
	bit	#$01
	beq	Ldf02
	jsr	Sd60b
	bcc	Ldede
Ldf02:	bit	#$20
	beq	Ldf0a
Ldf06:	dec	Z1c
	bne	Ldeeb
Ldf0a:	lda	#$27
Ldf0c:	jsr	Sd297
	sec
	rts

Ldf11:	lda	Z2a
	cmp	Z15
	bne	Ldf06
	jsr	Se60f
	bcc	Ldf23
	jsr	Sde3a
	bcc	Ldee3
	bra	Ldf0a
Ldf23:	clc
	rts

Ldf25:	lda	#$11
	ldx	Z2f
	bpl	Ldf2e
Ldf2b:	jmp	Sd297

Ldf2e:	jsr	Sd905
	bpl	Ldf36
	jsr	Sd4cc
Ldf36:	bcs	Ldf2b
	jsr	Sda21
	bcs	Ldf2b
	lda	#$80
	sta	Z6b
	ldx	Z2f
	lda	#$60
	bit	Z3a,x
	beq	Ldf55
	bit	Z61
	bpl	Ldf52
	lda	#$21
	sta	Z5e
	rts

Ldf52:	jsr	Sd7e8
Ldf55:	jsr	Sda73
	bcs	Ldf2b
	sta	Z1a
	and	#$10
	asl
	adc	#$60
	sta	Z5d
	jsr	Sda48
	bcc	Ldf6c
	sta	Z01
	clc
	rts

Ldf6c:	lda	#$06
	sta	Z58
	lda	#$04
	sta	Z5c
	lda	#$14
	sta	Z5b
	jsr	Sd576
	lda	#$00
	sta	Zb1
	lda	Z1a
	sta	Zb2
	dec
	sta	Z1c
	lda	#$c0
	ldx	Z1a
Ldf8a:	sta	D0620,x
	cpx	Zb1
	bcc	Ldf98
	cpx	Zb2
	bcs	Ldf98
	stz	D0620,x
Ldf98:	dex
	bpl	Ldf8a
	lda	Z5f
	sta	Z60
	bra	Ldfa6
Ldfa1:	jsr	Sd60b
	bcs	Le007
Ldfa6:	dec	Z5c
	bmi	Le007
	jsr	Sd5d8
	bcs	Le007
	jsr	Sd89f
	bcc	Ldfb8
Ldfb4:	lda	#$2f
	bra	Le009
Ldfb8:	stz	Z57
	jsr	Se500
	bcc	Le010
	lda	Z57
	bit	#$04
	bne	Ldfa6
	bit	#$20
	beq	Ldfe5
	dec	Z5d
	beq	Le007
	lda	Z5d
	and	#$3f
	lsr
	cmp	Z1a
	beq	Ldfdc
	bit	#$08
	beq	Ldfb8
	bra	Ldfa6
Ldfdc:	bit	Z60
	bvc	Ldfa1
Ldfe0:	jsr	Sd7a8
	sec
	rts

Ldfe5:	bit	#$01
	beq	Le007
	bit	Z60
	bvs	Ldfe0
	lda	#$02
	jsr	Sd892
	bcs	Ldfb4
	dec	Z5c
	bmi	Le007
	jsr	Sd60b
	stz	Z57
	jsr	Se500
	bcc	Ldfa6
	ldx	Z2f
	jsr	Sd55a
Le007:	lda	#$27
Le009:	bit	Z60
	bvs	Ldfe0
	jmp	Sd297

Le010:	ldx	Z2a
	cpx	Z15
	bne	Le03b
	bit	Z60
	bvs	Ldfe0
	jsr	Sd9a0
	stz	Z6b
	jsr	Se60f
	bcc	Le02b
	jsr	Sde3a
	bcs	Le007
	bra	Le0aa
Le02b:	lda	Z2d
	sta	Z01
	lda	Z1c
	ora	#$80
	sta	Z00
	lda	#$40
	tsb	Z60
	bra	Le08b
Le03b:	bit	Z60
	bmi	Le0aa
	bit	D0620,x
	bvs	Le065
	ldy	Dd9ee,x
	lda	D0b3f,y
	bmi	Le079
	cmp	Z2f
	bne	Le079
	lda	D0aff,y
	cmp	Z1b
	bne	Le079
	lda	D0b1f,y
	cmp	Z2a
	bne	Le079
	lda	#$40
	sta	D0620,x
	bra	Le09c
Le065:	bit	Z60
	bvc	Le0aa
	ldx	#$08
Le06b:	lda	#$cc
Le06d:	bit	Z00
	bpl	Le0b4
	dec
	bne	Le06d
	dex
	bne	Le06b
	bra	Le0aa
Le079:	jsr	Sd9a0
	jsr	Se60f
	bcc	Le08b
	dec	Z5b
	bpl	Le09c
	lda	#$80
	tsb	Z60
	bra	Le09c
Le08b:	ldx	Z2a
	lda	#$40
	sta	D0620,x
	lda	Z2a
	jsr	Sda00
	bcc	Le09c
Le099:	jmp	Le007

Le09c:	bit	Z60
	bvc	Le0aa
	bmi	Le0b4
	dec	Z1c
	beq	Le0b4
	lda	Z00
	bpl	Le0b4
Le0aa:	jsr	Sd7a8
	dec	Z5d
	beq	Le099
	jmp	Ldfb8

Le0b4:	jsr	Sd7a8
	bit	Z60
	bvs	Le0bd
	clc
	rts

Le0bd:	sec
	rts

Le0bf:	lda	#$11
	ldx	Z2f
	bmi	Le0cf
	jsr	Sd905
	bpl	Le0cd
	jsr	Sd4cc
Le0cd:	bcc	Le0d2
Le0cf:	jmp	Sd297

Le0d2:	bne	Le0cf
	jsr	Sda21
	bcs	Le0cf
	ldx	Z2f
	lda	#$60
	bit	Z3a,x
	beq	Le0ed
	bit	Z61
	bpl	Le0ea
	lda	#$21
	sta	Z5e
	rts

Le0ea:	jsr	Sd7e8
Le0ed:	lda	#$06
	sta	Z58
	lda	#$03
	sta	Z5c
	jsr	Sda73
	bcs	Le0cf
	sta	Z1a
	and	#$18
	asl
	adc	#$60
	sta	Z5d
	ldx	Z15
	jsr	Sd9a0
	stz	Z04
	bit	Zb9
	bmi	Le11d
	bit	D7c09
	bvc	Le11d
	bit	Z61
	bmi	Le11d

	bit	Zb4	; MFM?
	bmi	Le11d	;   yes

	dec	Z04

Le11d:	lda	Z2d
	sta	Z01
	jsr	Sd576
	jsr	Sd5d8
	bcs	Le1a8
	bit	Zb9
	bmi	Le13e
	bit	Z04
	bmi	Le135
Le131:	lda	Z01
	bpl	Le131
Le135:	bit	Z61
	bpl	Le13e
	jsr	Se793
	bra	Le141
Le13e:	jsr	Se797
Le141:	jsr	Sd89f
	bcc	Le14a
Le146:	lda	#$2f
	bra	Le1aa
Le14a:	jsr	Se500
	bcc	Le189
	lda	Z57
	bit	#$04
	bne	Le171
	bit	#$20
	beq	Le17c
	dec	Z5d
	beq	Le1a8
	lda	Z5d
	and	#$3f
	lsr
	cmp	Z1a
	beq	Le16c
	bit	#$08
	beq	Le14a
	bra	Le171
Le16c:	jsr	Sd60b
	bcs	Le1a8
Le171:	dec	Z5c
	bmi	Le1a8
	jsr	Sd5d8
	bcc	Le141
	bra	Le1a8
Le17c:	bit	#$01
	beq	Le1a8
	lda	#$02
	jsr	Sd892
	bcs	Le146
	bra	Le16c
Le189:	lda	Z2a
	cmp	Z15
	beq	Le198
	dec	Z5d
	beq	Le1a8
	jsr	Sd7a8
	bra	Le14a
Le198:	jsr	Se87f
	bcs	Le1a8
	bit	Zb9
	bmi	Le1a6
	lda	Z15
	jsr	Sda00
Le1a6:	clc
	rts

Le1a8:	lda	#$27
Le1aa:	sta	Z56
	clc
	rts

Le1ae:	stz	Z56
	stz	Z16
	stz	Z14
	stz	Z1b
	jsr	Sd97c
	lda	#$01
	sta	Z00
	ora	#$80
	sta	Z02
	stz	Z05
	stz	Z06
	stz	Z07
	stz	Z2f
	lda	#$01
	sta	Z03
	stz	Z13
	ldx	Z13
	lda	Z34,x
	beq	Le1e5
	bmi	Le1dd
	jsr	Sd55a
	jmp	Ld248

Le1dd:	lda	#$ff
	jsr	Sf730
	jmp	Ld257

Le1e5:	lda	#$28
	sta	Z56
	stz	Z01
	clc
	rts

	fillto	$e200

De200:	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$40,$40,$40,$40,$40,$40,$40,$40
	fcb	$40,$40,$40,$40,$40,$40,$40,$40
	fcb	$80,$80,$80,$80,$80,$80,$80,$80
	fcb	$80,$80,$80,$80,$80,$80,$80,$80
	fcb	$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
	fcb	$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
De240:	fcb	$00,$00,$00,$00,$40,$40,$40,$40
	fcb	$80,$80,$80,$80,$c0,$c0,$c0,$c0
	fcb	$00,$00,$00,$00,$40,$40,$40,$40
	fcb	$80,$80,$80,$80,$c0,$c0,$c0,$c0
	fcb	$00,$00,$00,$00,$40,$40,$40,$40
	fcb	$80,$80,$80,$80,$c0,$c0,$c0,$c0
	fcb	$00,$00,$00,$00,$40,$40,$40,$40
	fcb	$80,$80,$80,$80,$c0,$c0,$c0,$c0
De280:	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0
	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0
	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0
	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0
	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0
	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0
	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0
	fcb	$00,$40,$80,$c0,$00,$40,$80,$c0

Le2c0:	lda	#$11
	ldx	Z2f
	bpl	Le2c9
Le2c6:	jmp	Sd297

Le2c9:	jsr	Sd905
	bpl	Le2d1
	jsr	Sd4cc
Le2d1:	bcs	Le2c6
	jsr	Sda21
	bcs	Le2c6
	lda	#$80
	sta	Z6b
	ldx	Z2f
	lda	#$60
	bit	Z3a,x
	beq	Le2e7
	jsr	Sd7e8
Le2e7:	lda	Z06
	pha
	lda	Z05
	pha
	clc
	adc	Z09
	sta	Z05
	lda	Z06
	adc	Z0a
	sta	Z05
	jsr	Sda21
	bcs	Le2c6
	pla
	sta	Z05
	pla
	sta	Z06
	jsr	Sda73
	bcs	Le2c6
	sta	Z1a
	stz	Z0c
	lda	Z1a
	sec
	sbc	Z15
	sta	Z1c
	ldy	Z0a
	bne	Le31f
	cmp	Z09
	beq	Le31f
	bcc	Le31f
	lda	Z09
Le31f:	sta	Z0b
	stz	Z01
	lda	#$ff
	sta	Z00
	lda	#$05
	sta	Zae
	stz	Zad
Le32d:	dec	Zad
	bne	Le335
	dec	Zae
	bmi	Le339
Le335:	lda	Z00
	bmi	Le32d
Le339:	sec
	rts

Le33b:	lda	#$11
	ldx	Z2f
	bpl	Le344
Le341:	jmp	Sd297

Le344:	jsr	Sd905
	bpl	Le34c
	jsr	Sd4cc
Le34c:	bcs	Le341
	jsr	Sda21
	bcs	Le341
	lda	#$80
	sta	Z6b
	ldx	Z2f
	lda	#$60
	bit	Z3a,x
	beq	Le362
	jsr	Sd7e8
Le362:	jsr	Sda73
	bcs	Le341
	sta	Z1a
	lda	Z15
	sta	Z38
	lda	Z1b
	sta	Z39
	lda	Z09
	clc
	adc	Z05
	sta	Z05
	lda	Z0a
	adc	Z06
	sta	Z06
	lda	Z05
	bne	Le384
	dec	Z06
Le384:	dec	Z05
	jsr	Sda21
	bcs	Le341
	jsr	Sda73
	bcs	Le341
	lda	Z1b
	cmp	Z39
	beq	Le39b
	lda	#$2d
	jmp	Sd297

Le39b:	stz	D0600
	stz	D0601
	ldx	Z1a
Le3a3:	dex
	stz	D0602,x
	bne	Le3a3
	lda	Z38
	sta	Zb1
	lda	Z15
	inc
	sta	Zb2
	sec
	sbc	Z38
	sta	Z1c
	asl
	asl
	sta	Z58
	lda	#$40
	ldx	Z1a
	stx	Z2a
Le3c1:	sta	D0620,x
	cpx	Zb1
	bcc	Le3cf
	cpx	Zb2
	bcs	Le3cf
	stz	D0620,x
Le3cf:	dex
	bpl	Le3c1
	lda	#$03
	sta	Z01
	lda	Z1a
	asl
	asl
	inc
	sta	Z5d
	lda	#$02
	sta	Z5c
	jsr	Sd576
	bra	Le3eb
Le3e6:	jsr	Sd60b
	bcs	Le415
Le3eb:	dec	Z5c
	bmi	Le415
	jsr	Sd5d8
	bcs	Le415
	jsr	Sd89f
	bcc	Le400
Le3f9:	lda	#$2f
	bra	Le479
Le3fd:	jsr	Sd7a8
Le400:	stz	Z57
	jsr	Se500
	bcc	Le429
	lda	Z57
	bit	#$04
	bne	Le3eb
	bit	#$20
	bne	Le417
	bit	#$01
	bne	Le3f9
Le415:	bra	Le477
Le417:	dec	Z5d
	beq	Le477
	lda	Z5d
	cmp	Z1a
	bne	Le423
	bra	Le3e6
Le423:	bit	#$08
	beq	Le400
	bra	Le3eb
Le429:	ldx	Z2a
	bit	D0620,x
	bvs	Le452
	jsr	Sd9a0
	jsr	Se60f
	bcs	Le468
	ldx	Z2a
	lda	#$40
	sta	D0620,x
	txa
	sec
	sbc	Z38
	tax
	lda	Z2d
	sta	D0602,x
	inc	D0600
	dec	Z1c
	beq	Le482
	bra	Le462
Le452:	stz	Z2c
	ldx	#$08
Le456:	lda	#$cc
Le458:	bit	Z2c
	bpl	Le45c
Le45c:	dec
	bne	Le458
	dex
	bne	Le456
Le462:	dec	Z5d
	bne	Le3fd
	bra	Le477
Le468:	dec	Z58
	bpl	Le3fd
	lda	Z2a
	sec
	sbc	Z38
	tax
	lda	#$a7
	sta	D0602,x
Le477:	lda	#$27
Le479:	sta	Z56
	lda	#$01
	sta	D0601
	clc
	rts

Le482:	lda	#$ff
	sta	Z00
	lda	#$05
	sta	Zae
	stz	Zad
Le48c:	dec	Zad
	bne	Le494
	dec	Zae
	bmi	Le498
Le494:	lda	Z00
	bmi	Le48c
Le498:	sec
	rts

	fillto	$e500

; read address mark
Se500:	bit	Zb4	; MFM?
	bpl	Le507	;   no
	jmp	Le935

; read address mark, GCR
Le507:	jmp	Z72	; hook to immediately following Le50a

Le50a:	jsr	Se600
	stz	Z57
	lda	D0a0c
	lda	D0a0e
	lda	#$08
	sta	Zad
	ldy	#$00
Le51b:	ldx	#$02
Le51d:	dey
	bne	Le524
	dec	Zad
	beq	Le585
Le524:	lda	D0a0c
	bpl	Le524
	cmp	Z9f,x
	bne	Le51b
	dex
	bpl	Le51d
	ldx	#$04
	stz	Z1e
Le534:	ldy	D0a0c
	bpl	Le534
	lda	Se500,y
	sta	Z27,x
	eor	Z1e
	sta	Z1e
	dex
	bpl	Le534
	tay
	bne	Le589
Le548:	ldx	D0a0c
	bpl	Le548
	cpx	Z97+2
	bne	Le589
Le551:	ldx	D0a0c
	bpl	Le551
	cpx	Z97+1
	bne	Le589
	ldx	Z2f
	lda	Z28
	sta	Z11,x
	and	#$20
	asl
	asl
	sta	Z0f,x
	lda	Z29
	eor	Z16
	lsr
	bne	Le581
	lda	Z2b
	bcc	Le573
	ora	#$40
Le573:	cmp	Z14
	beq	Le57f
	ldx	Z2f
	sta	Z0d,x
	lda	#$04
	bra	Le58b
Le57f:	clc
	rts

Le581:	lda	#$28
	bra	Le58b
Le585:	lda	#$01
	bra	Le58b
Le589:	lda	#$20
Le58b:	tsb	Z57
	sec
	rts

	fcb	$ff,$ff,$ff,$ff,$ff,$ff,$ff

; denibblization table, starting at page offset $96
denib_table	equ	*-$96
	fcb	$00,$01
	fcb	$98,$99,$02,$03,$9c,$04,$05,$06
	fcb	$a0,$a1,$a2,$a3,$a4,$a5,$07,$08
	fcb	$a8,$a9,$aa,$09,$0a,$0b,$0c,$0d
	fcb	$b0,$b1,$0e,$0f,$10,$11,$12,$13
	fcb	$b8,$14,$15,$16,$17,$18,$19,$1a
	fcb	$c0,$c1,$c2,$c3,$c4,$c5,$c6,$c7
	fcb	$c8,$c9,$ca,$1b,$cc,$1c,$1d,$1e
	fcb	$d0,$d1,$d2,$1f,$d4,$d5,$20,$21
	fcb	$d8,$22,$23,$24,$25,$26,$27,$28
	fcb	$e0,$e1,$e2,$e3,$e4,$29,$2a,$2b
	fcb	$e8,$2c,$2d,$2e,$2f,$30,$31,$32
	fcb	$f0,$f1,$33,$34,$35,$36,$37,$38
	fcb	$f8,$39,$3a,$3b,$3c,$3d,$3e,$3f

Se600:	lda	#$01
	jsr	Sd892
	jsr	Sd645
	bit	D0a0c
	bit	D0a0e
	rts


; read data field
Se60f:	bit	Zb4	; MFM?
	bpl	Le616	;   no
	jmp	Lea3d

Le616:	jmp	Z75	; hook to immediately following Le619

; read data field GCR
Le619:	stz	Z21
	stz	Z20
	stz	Z1f
	stz	Z57
	ldy	#$19
Le623:	ldx	#$02
Le625:	dey
	beq	Le642
Le628:	lda	D0a0c
	bpl	Le628
	cmp	Z8e,x
	bne	Le623
	dex
	bpl	Le625
	ldy	#$0c
Le636:	ldx	D0a0c
	bpl	Le636
	lda	denib_table,x
	eor	Z2a
	beq	Le647
Le642:	lda	#$01
	jmp	Le78f

Le647:	clc
Le648:	ldx	D0a0c
	bpl	Le648
	adc	Z1f
	cmp	#$80
	rol
	sta	Z1f
	lda	denib_table,x
	sta	Z23
Le659:	ldx	D0a0c
	bpl	Le659
	lda	denib_table,x
	ldx	Z23
	ora	De200,x
	eor	Z1f
	sta	D01b1,y
	dey
	adc	Z21
	sta	Z21
Le670:	ldx	D0a0c
	bpl	Le670
	lda	denib_table,x
	ldx	Z23
	ora	De240,x
	eor	Z21
	sta	D01b1,y
	dey
	adc	Z20
	sta	Z20
Le687:	ldx	D0a0c
	bpl	Le687
	lda	denib_table,x
	ldx	Z23
	ora	De280,x
	eor	Z20
	sta	D01b1,y
	dey
	bne	Le648
	bra	Le6c2
Le69e:	ldx	D0a0c
	lda	denib_table,x
	ora	De240,y
	eor	Z21
	sta	(Zab)
	inc	Zab
	adc	Z20
	sta	Z20
Le6b1:	ldx	D0a0c
	bpl	Le6b1
	lda	denib_table,x
	ora	De280,y
	eor	Z20
	sta	(Zab)
	inc	Zab
Le6c2:	ldx	D0a0c
	bpl	Le6c2
	adc	Z1f
	cmp	#$80
	rol
	sta	Z1f
	ldy	denib_table,x
Le6d1:	ldx	D0a0c
	bpl	Le6d1
	lda	denib_table,x
	ora	De200,y
	eor	Z1f
	sta	(Zab)
	adc	Z21
	sta	Z21
	inc	Zab
	bne	Le69e
	ldx	D0a0c
	lda	denib_table,x
	ora	De240,y
	eor	Z21
	sta	(Zaf)
	adc	Z20
	sta	Z20
	inc	Zaf
	nop
Le6fc:	ldx	D0a0c
	lda	denib_table,x
	ora	De280,y
	eor	Z20
	sta	(Zaf)
	inc	Zaf
Le70b:	ldx	D0a0c
	bpl	Le70b
	adc	Z1f
	cmp	#$80
	rol
	sta	Z1f
	ldy	denib_table,x
Le71a:	ldx	D0a0c
	bpl	Le71a
	lda	denib_table,x
	ora	De200,y
	eor	Z1f
	sta	(Zaf)
	inc	Zaf
	adc	Z21
	sta	Z21
Le72f:	ldx	D0a0c
	bpl	Le72f
	lda	denib_table,x
	ora	De240,y
	eor	Z21
	sta	(Zaf)
	adc	Z20
	sta	Z20
	inc	Zaf
	bne	Le6fc
	ldx	D0a0c
	ldy	denib_table,x
	lda	De280,y
	sta	Z23
	lda	De240,y
	sta	Z24
	lda	De200,y
	ldx	#$02
Le75b:	ldy	D0a0c
	bpl	Le75b
	ora	denib_table,y
	eor	Z1f,x
	sta	Z1f,x
	lda	Z22,x
	dex
	bpl	Le75b
	ldx	#$02
Le76e:	lda	D0a0c
	bpl	Le76e
	cmp	Z97,x
	bne	Le77c
	dex
	bne	Le76e
	bra	Le780
Le77c:	lda	#$08
	tsb	Z57
Le780:	lda	Z21
	ora	Z20
	ora	Z1f
	bne	Le78d
	lda	Z57
	cmp	#$01
	rts

Le78d:	lda	#$10
Le78f:	tsb	Z57
	sec
	rts

Se793:	ldx	#$af
	bra	Le7a7

Se797:	ldx	#$04
Le799:	stz	D01ab,x
	stz	D06eb,x
	stz	D07eb,x
	dex
	bne	Le799
	ldx	#$ab
Le7a7:	bit	Zb4
	bpl	Le7b5
	lda	Zac
	inc
	sta	Zb0
	lda	Zab
	sta	Zaf
	rts

Le7b5:	stx	Z6e
	lda	Zac
	sta	Zb0
Le7bb:	lda	Z04
	bpl	Le7d4
	cmp	#$d0
	beq	Le7d2
	cmp	#$c1
	beq	Le7d4
	cmp	#$c0
	bne	Le7bb
	ldy	#$c8
Le7cd:	dey
	bne	Le7cd
	bra	Le7d4
Le7d2:	stz	Z04
Le7d4:	stz	Z21
	stz	Z20
	stz	Z1f
	clc
	ldy	#$00
	bra	Le7fc
Le7df:	lda	(Zab),y
	eor	Z20
	sta	D0741,x
	eor	Z20
	adc	Z1f
	cmp	#$80
	rol
	sta	Z1f
	iny
	bne	Le7fc
	inc	Zac
	lda	Z04
	bpl	Le7fc
	eor	#$d0
	bne	Le830
Le7fc:	lda	(Zab),y
	eor	Z1f
	sta	D0100,x
	eor	Z1f
	adc	Z21
	sta	Z21
	iny
	bne	Le816
	inc	Zac
	lda	Z04
	bpl	Le816
	eor	#$d0
	bne	Le830
Le816:	lda	(Zab),y
	eor	Z21
	sta	D0640,x
	eor	Z21
	adc	Z20
	sta	Z20
	iny
	bne	Le844
	inc	Zac
	lda	Z04
	bpl	Le844
	eor	#$d0
	beq	Le844
Le830:	cmp	#$11
	beq	Le83c
	lda	#$d0
Le836:	cmp	Z04
	bne	Le836
	stz	Z04
Le83c:	lda	Zb0
	sta	Zac
	ldx	Z6e
	bra	Le7d4
Le844:	dex
	bne	Le7df
	lda	Z1f
	lsr
	lsr
	eor	Z20
	and	#$30
	eor	Z20
	lsr
	lsr
	eor	Z21
	and	#$3c
	eor	Z21
	lsr
	lsr
	sta	Z22
	lda	D01af
	sta	Z67
	asl
	rol	Z66
	asl
	rol	Z66
	lda	D06ef
	sta	Z68
	asl
	rol	Z66
	asl
	rol	Z66
	lda	D07ef
	sta	Z69
	asl
	rol	Z66
	asl
	rol	Z66
	rts


; write data field
Se87f:	bit	Zb4	; MFM?
	bpl	Le886	;   no
	jmp	Leaf0

Le886:	jmp	Z78	; hook to immediately following Le889

; write data field GCR
Le889:	bit	D0a0d
	lda	#$ff
	sta	D0a0f
	stz	Z57
	ldx	#$07
Le895:	lda	Z8e,x
Le897:	bit	D0a0c
	bpl	Le897
	sta	D0a0d
	dex
	bpl	Le895
	ldy	Z2a
	lda	Dd000,y
Le8a7:	bit	D0a0c
	bpl	Le8a7
	sta	D0a0d
	ldx	#$ae
	bra	Le8c6
Le8b3:	ldy	Z69
	lda	D0741,x
	sta	Z69
	asl
	rol	Z66
	asl
	lda	Dd000,y
	sta	D0a0d
	rol	Z66
Le8c6:	ldy	Z66
	lda	Dd000,y
Le8cb:	bit	D0a0c
	bpl	Le8cb
	sta	D0a0d
	ldy	Z67
	lda	D0100,x
	sta	Z67
	asl
	rol	Z66
	asl
	rol	Z66
	lda	Dd000,y
	sta	D0a0d
	ldy	Z68
	lda	D0640,x
	sta	Z68
	asl
	rol	Z66
	asl
	rol	Z66
	lda	Dd000,y
	sta	D0a0d
	dex
	cpx	#$ff
	bne	Le8b3
	ldx	#$03
Le900:	ldy	Z1f,x
	lda	Dd000,y
Le905:	bit	D0a0c
	bpl	Le905
	sta	D0a0d
	dex
	bpl	Le900
	ldx	#$02
Le912:	lda	Z97,x
Le914:	bit	D0a0c
	bpl	Le914
	sta	D0a0d
	dex
	bpl	Le912
	lda	#$40
	and	D0a0c
	eor	#$40
	tsb	Z57
Le928:	bit	D0a0c
	bvs	Le928
	bit	D0a0e
	lda	Z57
	cmp	#$01
	rts


; read address mark, MFM
Le935:	jsr	Se600
	stz	Z57
	jsr	Sd714
	ldy	#$ff
	sty	Zad
	bra	Le95c
Le943:	ldx	#$02
	ldy	#$ff
Le947:	bit	ism_r_handshake
	bmi	Le951
	dey
	bmi	Le947
	bra	Le95c

Le951:	lda	ism_r_mark
	cmp	Dea33,x
	bne	Le95c
	dex
	bpl	Le947

Le95c:	bit	ism_r_error

	lda	#$18		; clear write and action bits
	sta	ism_w_zeros

	lda	#$01		; clear FIFO
	sta	ism_w_ones
	sta	ism_w_zeros

	bit	ism_r_error

	lda	#$08		; turn on action bit
	sta	ism_w_ones

Le974:	bit	ism_r_handshake
	bmi	Le985
	dey
	bne	Le974
	dec	Zad
	bne	Le974
	lda	#$01
	jmp	Lea1e

Le985:	lda	ism_r_mark
	cmp	#$a1
	beq	Le992
	cmp	#$c2
	beq	Le943
	bra	Le95c

Le992:	ldy	#$ff
	ldx	#$02

Le996:	bit	ism_r_handshake
	bmi	Le9a0
	dey
	bmi	Le996
	bra	Le95c

Le9a0:	lda	ism_r_mark
	cmp	Dea36,x
	bne	Le95c
	dex
	bpl	Le996

Le9ab:	bit	ism_r_handshake
	bpl	Le9ab
	lda	ism_r_data
	sta	Z2b		; save track

Le9b5:	bit	ism_r_handshake
	bpl	Le9b5
	lda	#$00
	ldy	ism_r_data
	beq	Le9c3
	lda	#$20
Le9c3:	sta	Z29		; save side ($00 or $20)

Le9c5:	bit	ism_r_handshake
	bpl	Le9c5
	lda	ism_r_data
	dec
	sta	Z2a		; save sector (-1 to base at zero)

Le9d0:	bit	ism_r_handshake
	bpl	Le9d0
	lda	#$20
	ora	ism_r_data
	sta	Z28		; save block size ored with $20 (why?)

Le9dc:	bit	ism_r_handshake
	bpl	Le9dc
	lda	ism_r_data
	sta	Z1e		; save first CRC byte

Le9e6:	lda	ism_r_handshake
	bpl	Le9e6
	ldy	ism_r_data
	sty	Z1f		; save second CRC byte

	ldy	ism_r_error
	sty	Z20		; save ISM error

	sta	Z21		; save 
	and	#$22
	bne	Lea1c

	lda	#$18		; clear write and action bits
	sta	ism_w_zeros

	ldx	Z2f
	lda	#$80
	sta	Z0f,x
	lda	Z29
	beq	Lea0c
	lda	#$20
Lea0c:	eor	Z16
	bne	Lea2f
	lda	Z2b
	cmp	Z14
	beq	Lea2d
	sta	Z0d,x
	lda	#$04
	bra	Lea1e
Lea1c:	lda	#$20
Lea1e:	tsb	Z57

	lda	#$18		; clear write and action bits
	sta	ism_w_zeros

	lda	ism_r_error
	jsr	Sd76e
	sec
	rts

Lea2d:	clc
	rts

Lea2f:	lda	#$28
	bra	Lea1e

Dea33:	fcb	$fc,$c2,$c2
Dea36:	fcb	$fe,$a1
Dea38:	fcb	$a1,$fb,$a1,$a1,$a1


; read data field, MFM
Lea3d:	bit	D0a0a

	lda	#$18		; clear write and action bits
	sta	ism_w_zeros

	lda	#$01		; clear FIFO
	sta	ism_w_ones
	sta	ism_w_zeros

	bit	ism_r_error

	lda	#$08		; turn on action bit
	sta	ism_w_ones

	ldy	#$80
Lea57:	dey
	bne	Lea64

Lea5a:	lda	#$18		; timeout - clear write and action bits
	sta	ism_w_zeros
	jsr	Sd76e
	sec
	rts

Lea64:	bit	ism_r_handshake
	bpl	Lea57
	lda	ism_r_mark
	cmp	#$a1
	bne	Lea57
	ldx	#$03
	ldy	#$14

Lea74:	bit	ism_r_handshake
	bmi	Lea7e
	dey
	bpl	Lea74
	bra	Lea5a

Lea7e:	lda	ism_r_mark
	cmp	Dea38,x
	bne	Lea5a
	dex
	bne	Lea74

; read first 256 bytes, two at a time
Lea89:	bit	ism_r_handshake
	bvc	Lea89
	lda	ism_r_data
	ldx	ism_r_data
	sta	(Zab)
	inc	Zab
	txa
	sta	(Zab)
	inc	Zab
	bne	Lea89

; read second 256 bytes, two at a time
Lea9f:	bit	ism_r_handshake
	bvc	Lea9f
	lda	ism_r_data
	ldx	ism_r_data
	sta	(Zaf)
	inc	Zaf
	txa
	sta	(Zaf)
	inc	Zaf
	bne	Lea9f

Leab5:	bit	ism_r_handshake
	bpl	Leab5
	lda	ism_r_data
	sta	Z1e
Leabf:	lda	ism_r_handshake
	bpl	Leabf
	ldy	ism_r_data
	sty	Z1f

	ldy	ism_r_error
	sty	Z20
	sta	Z21
	and	#$22
	bne	Leae0

	lda	#$18		; clear write and action bits
	sta	ism_w_zeros
	stz	Z57
	jsr	Sd76e
	clc
	rts


Leae0:	lda	#$18
	sta	D0a06
	jsr	Sd76e
	lda	#$10
	ora	Z57
	sta	Z57
	sec
	rts


; write data field, MFM
Leaf0:	lda	#$f0
	sta	ism_w_phase
	bit	ism_r_error
	lda	#$18
	sta	ism_w_zeros
	lda	#$10
	sta	ism_w_ones
	lda	#$01
	sta	ism_w_ones
	sta	ism_w_zeros
	bit	ism_r_error
	ldy	#$24
Leb0f:	lda	ism_r_handshake
	lda	ism_r_handshake
	lda	ism_r_handshake
	dey
	bne	Leb0f

	stz	ism_w_data
	stz	ism_w_data
	lda	#$08
	sta	ism_w_ones
	ldx	#$0a
Leb28:	bit	ism_r_handshake
	bpl	Leb28
	stz	ism_w_data
	dex
	bne	Leb28
	ldx	#$03
Leb35:	bit	ism_r_handshake
	bpl	Leb35
	lda	#$a1
	sta	ism_w_mark
	dex
	bne	Leb35
Leb42:	bit	ism_r_handshake
	bpl	Leb42
	lda	#$fb
	sta	ism_w_data

; write first 256 bytes
	ldy	#$00
Leb4e:	lda	(Zab),y
Leb50:	bit	ism_r_handshake
	bpl	Leb50
	sta	ism_w_data
	iny
	bne	Leb4e

; write last 256 bytes
Leb5b:	lda	(Zaf),y
Leb5d:	bit	ism_r_handshake
	bpl	Leb5d
	sta	ism_w_data
	iny
	bne	Leb5b

Leb68:	bit	ism_r_handshake
	bpl	Leb68
	stz	ism_w_crc

	ldx	#$04
	lda	#$4e
Leb74:	ldy	ism_r_handshake
	bpl	Leb74
	sta	ism_w_data
	dex
	bne	Leb74

Leb7f:	bit	ism_r_handshake
	bvc	Leb7f
	lda	#$18
	sta	ism_w_zeros
	tya
	and	#$20
	clc
	beq	Leb94
	lda	D0a0a
	sta	Z20
Leb94:	php
	ldx	#$78
Leb97:	bne	Leb99
Leb99:	nop
	dex
	bne	Leb97
	jsr	Sd76e
	plp
	rts


Leba2:	ldx	Z05
	cpx	#$14
	bcs	Lebca
	lda	Z2f
	bpl	Lebb5
	bit	Debd3,x
	bmi	Lebca
	bvc	Lebb5
	bra	Lebca
Lebb5:	ldx	Z0c
	cpx	#$04
	bcs	Lebce
	lda	#$06
	sta	Z01
Lebbf:	lda	Z01
	bpl	Lebbf
	lda	Z05
	asl
	tax
	jmp	(Debe7,x)

Lebca:	lda	#$21
	bra	Lebd0
Lebce:	lda	#$22
Lebd0:	jmp	Sd297

Debd3:	fcb	$80,$80,$80,$80,$80,$80,$80,$80
	fcb	$80,$80,$80,$80,$00,$80,$00,$00
	fcb	$00,$00,$00,$00

Debe7:	fdb	Lec64
	fdb	Lebca
	fdb	Lebca
	fdb	Lebca
	fdb	Lec77
	fdb	Lebca
	fdb	Lebca
	fdb	Lebca
	fdb	Lebca
	fdb	Lec51
	fdb	Lec39
	fdb	Lebca
	fdb	Lec9e
	fdb	ResetMark
	fdb	ResetHook
	fdb	Lec28
	fdb	Lecaa
	fdb	Lecc0
	fdb	Lec86
	fdb	Lec95

ResetMark:
	ldx	#$16
Lec11:	lda	Z8d+$8000-1,x
	sta	Z8d-1,x
	dex
	bne	Lec11
	bra	Lec5f

ResetHook:
	ldx	Z70+$8000
Lec1e:	lda	Z71+$8000,x
	sta	Z71,x
	dex
	bne	Lec1e
	bra	Lec5f

Lec28:	lda	#$01
	jsr	Secfe
	lda	D0c00
	and	#$80
	sta	Z5f
	jsr	Sd97c
	bra	Lec5f

Lec39:	lda	#$01
	jsr	Secfe
	bne	Lebce
	lda	#$32
	ldy	D0c00
	cpy	#$0d
	bcs	Lebd0
	sty	Z62
	ldx	Z2f
	sty	Z4a,x
	bra	Lec5f

Lec51:	lda	#$01
	jsr	Secfe
	bne	Lecbd
	lda	D0c00
	and	#$80
	sta	Z63
Lec5f:	lda	#$00
	jmp	Lebd0

Lec64:	ldx	Z2f
	jsr	Sd55a
	jsr	Sd905
	bpl	Lec71
	jsr	Sd4cc
Lec71:	bcc	Lec76
	jmp	Sd297

Lec76:	rts

Lec77:	ldx	Z2f
	jsr	Sd94d
	jsr	Sed05
	ldx	Z2f
	jsr	Sda30
	clc
	rts

Lec86:	jsr	Sece3
	sta	Z59
	stx	Z5a
	sty	Z5b
	php
	pla
	sta	Z5c

Lec93:	clc
	rts

Lec95:	jsr	Lecaa
	lda	(Z64)
	sta	Z58
	clc
	rts

Lec9e:	lda	#$03
	jsr	Secac
	lda	D0c04
	sta	(Z64)
	clc
	rts

Lecaa:	lda	#$02

Secac:	jsr	Secfe
	bne	Lecbd
	lda	D0c00
	sta	Z64
	lda	D0c01
	sta	Z65
	clc
	rts

Lecbd:	jmp	Lebce

Lecc0:	ldx	Z65
	ldy	#$00
	lda	#$00
	sta	Zad
	lda	#$0c
	sta	Zae
Leccc:	lda	(Zad),y
	sta	(Z64),y
	iny
	bne	Lecd7
	inc	Zae
	inc	Z65
Lecd7:	dec	Z0b
	bne	Leccc
	dec	Z0c
	bpl	Leccc
	stx	Z65
	clc
	rts

Sece3:	lda	D0c04
	sta	Zad
	lda	D0c05
	sta	Zae
	lda	D0c03
	pha
	ldx	D0c01
	ldy	D0c02
	lda	D0c00
	plp
	jmp	(Zad)

Secfe:	ldy	Z0c
	bne	Led04
	cmp	Z0b
Led04:	rts

Sed05:	stx	Z6f
	lda	#$02
	jsr	Sd892
	bcs	Led42
	lda	#$08
	jsr	Sd892
	bcs	Led1f
	lda	#$09
	jsr	Sd888
	lda	#$c8
	jsr	Sf735
Led1f:	lda	#$03
	sta	Z58
	lda	#$0d
	jsr	Sd888
	ldy	#$c3
Led2a:	lda	#$0a
	jsr	Sf735
	lda	#$02
	jsr	Sd892
	bcs	Led3f
	dey
	bne	Led2a
	lda	#$27
	sta	Z56
	bra	Led42
Led3f:	jsr	Sd55a
Led42:	lda	#$80
	sta	Z6f
	clc
Ded47:	rts

	fcb	"APPLE UNIVERSAL 3.5 CONTROLLER"

Led66:	stz	Z0b
	stz	Z0c
	ldx	Z2f
	bpl	Led89
	lda	Z05
	beq	Ledb4
	cmp	#$01
	bne	Led9c
	ldx	#$1e
	stx	D0c00
Led7b:	lda	Ded47,x
	sta	D0c00,x
	dex
	bne	Led7b
	ldx	#$1e
	inx
	bra	Leda1
Led89:	ldx	Z05
	beq	Lede4
	cpx	#$03
	beq	Lede4
	cpx	#$05
	bne	Led98
	jmp	Ledd6

Led98:	cpx	#$06
	bne	Led9c
Led9c:	lda	#$21
	jmp	Sd297

Leda1:	stx	Z0b
	lda	#$06
	sta	Z01
	ldx	Z2f
	bit	Zb5
	bmi	Ledb2
	jsr	Sd835
	clc
	rts

Ledb2:	clc
	rts

Ledb4:	lda	Z33
	sta	D0c00
	ldx	#$01
	lda	#$00
Ledbd:	sta	D0c00,x
	inx
	cpx	#$08
	bne	Ledbd
	lda	#$01
	sta	D0c02
	lda	#$00
	sta	D0c04
	lda	#$01
	sta	D0c05
Ledd4:	bra	Leda1
Ledd6:	ldx	#$00
Ledd8:	lda	Z56,x
	sta	D0c00,x
	inx
	cpx	#$08
	bcc	Ledd8
	bra	Leda1
Lede4:	ldx	Z2f
	jsr	Sd94d
	php
	and	Z46,x
	lsr
	lsr
	lsr
	ora	#$e8
	bvs	Ledf5
	ora	#$10
Ledf5:	plp
	bmi	Ledfe
	bvs	Lee04
	bit	Z3f
	bvc	Lee04
Ledfe:	bit	Z02
	bvc	Lee04
	ora	#$01
Lee04:	sta	D0c00
	jsr	Sd905
	bpl	Lee0f
	jsr	Sd4cc
Lee0f:	ldx	#$04
	ldy	Z2f
	lda	Z42,y
	sta	D0c01
	lda	Z44,y
	sta	D0c02
	stz	D0c03
	bit	Z02
	bvc	Lee2a
	stz	D0c04
	inx
Lee2a:	lda	Z05
	beq	Ledd4
	ldy	Z2f
	lda	Z34,y
	ldy	#$00
	bit	#$02
	beq	Lee3b
	ldy	#Dee61-Dee4b
Lee3b:	lda	Dee4b,y
	sta	D0c00,x
	inx
	iny
	cmp	#$ff
	bne	Lee3b
	dex
	jmp	Leda1

Dee4b:	fcb	$08,"DISK 3.5        ",$01,$c0,$10,$10,$ff
Dee61:	fcb	$08,"DISK 3.5HD      ",$01,$c1,$10,$10,$ff

Lee77:	ldx	Z2f
	bpl	Lee80
	lda	#$11
	jmp	Sd297

Lee80:	jsr	Sd905
	bpl	Lee88
	jsr	Sd4cc
Lee88:	ldx	#$ff
Lee8a:	stz	D0c00,x
	stz	D0d00,x
	dex
	bne	Lee8a
	lda	#$08
	sta	Zaf
	lda	#$0c
	sta	Zb0
	stz	D0c00
	stz	D0c02
	ldx	Z2f
	lda	Z40,x
	sta	D0c06
	lda	#$02
	bit	Z34,x
	beq	Leecf
	lda	#$0a
	sta	D0c04
	lda	Z3a,x
	bit	#$40
	bne	Leebe
	lda	#$06
	sta	D0c04
Leebe:	lda	#$0a
	jsr	Sef01
	lda	#$06
	jsr	Sef01
	lda	#$08
	jsr	Sef01
	bra	Leed9
Leecf:	lda	#$06
	sta	D0c04
	lda	#$06
	jsr	Sef01
Leed9:	ldy	#$00
	lda	D0c00
	asl
	asl
	asl
	asl
	bcc	Leee5
	iny
Leee5:	clc
	adc	#$08
	cpy	Z06
	bcc	Leef7
	beq	Leef1
Leeee:	jmp	Ld29d

Leef1:	cmp	Z05
	beq	Leef7
	bcs	Leeee
Leef7:	sta	Z0b
	sty	Z0c
	lda	#$06
	sta	Z01
	clc
	rts

Sef01:	inc	D0c00
	inc	D0c02
	ldy	#$00
	sta	(Zaf)
	tax
	lda	Def55,x
	and	#$0f
	ldy	#$04
	sta	(Zaf),y
	lda	Def55,x
	lsr
	lsr
	lsr
	lsr
	ldy	#$0c
	sta	(Zaf),y
	lda	Def63,x
	ldy	#$06
	sta	(Zaf),y
	iny
	lda	Def64,x
	sta	(Zaf),y
	ldy	#$0b
	lda	#$02
	sta	(Zaf),y
	lda	Def64,x
	lsr
	ldy	#$0f
	sta	(Zaf),y
	lda	Def63,x
	ror
	dey
	sta	(Zaf),y
	lda	Zaf
	clc
	adc	#$10
	sta	Zaf
	bcc	Lef4d
	inc	Zb0
Lef4d:	lda	Def56,x
	beq	Lef54
	bpl	Sef01
Lef54:	rts

Def55:	fcb	$00
Def56:	fcb	$00,$25,$00,$45,$00,$25,$04,$16
	fcb	$00,$24,$0c,$14,$00

Def63:	fcb	$00
Def64:	fcb	$00,$20,$03,$40,$06,$40,$06,$a0
	fcb	$05,$40,$0b,$40,$0b,$00,$00

Lef73:	lda	Z06
	beq	Lef7a
Lef77:	jmp	Lebca

Lef7a:	lda	Z05
	cmp	#$0d
	bcs	Lef77
	and	#$01
	bne	Lef77
	ldx	Z2f
	lda	Z05
	bne	Lef93
	lda	#$02
	sta	Z48,x
	jsr	Sf0a0
	bra	Lefa9
Lef93:	sta	Z48,x
	tay
	lda	Def55,y
	lsr
	lsr
	lsr
	lsr
	sta	Z4a,x
	lda	Z07
	beq	Lefa9
	cmp	#$0d
	bcs	Lef77
	sta	Z4a,x
Lefa9:	stz	Z01
	clc
	rts


; format
Lefad:	jmp	Z7e	; hook to immediately following Lefb0

Lefb0:	lda	#$01
	ldx	Z2f
	bmi	Lefc8
	jsr	Sda30
	lda	#$03
	jsr	Sd888
	jsr	Sd80b
	ldx	Z2f
	jsr	Sd905
	bcc	Lefcb
Lefc8:	jmp	Sd297

Lefcb:	bne	Lefc8
	lda	#$80
	sta	Z0f,x
	lda	#$02
	bit	Z34,x
	bne	Lefe9
	lda	Z48,x
	beq	Lefdf
	cmp	#$08
	bcs	Lf004
Lefdf:	jsr	Sefe6
	bcs	Lf004
	bra	Lf029

Sefe6:	jmp	(Zba)

Lefe9:	lda	#$0f
	jsr	Sd892
	bcc	Lf008
	ldy	Z48,x
	cpy	#$08
	bne	Lf000
	lda	#$50
	sta	Zb6
	lda	#$20
	sta	Z3a,x
	bra	Lf022
Lf000:	cpy	#$08
	bcc	Lf029
Lf004:	lda	#$21
	bra	Lefc8
Lf008:	lda	#$40
	sta	Z3a,x
	lda	#$02
	sta	Z62
	lda	#$65
	sta	Zb6
	ldx	Z2f
	lda	Z48,x
	beq	Lf022
	cmp	#$0a
	beq	Lf022
	cmp	#$0c
	bne	Lf004
Lf022:	jsr	Sd7e8
	stz	Z66
	stz	Z67
Lf029:	jsr	Sda30
	jsr	Sd576
	jsr	Sd60b
	bcs	Lf091
	jsr	Sd89f
	bcs	Lf091
	ldy	Z2f
	ldx	Z48,y
	beq	Lf04a
	lda	Z4a,y
	sta	Z62
	cpx	#$02
	bne	Lf04a
	stz	Z63
Lf04a:	stz	Z16
	stz	Z14
Lf04e:	lda	#$03
	sta	Z58
Lf052:	jsr	Sf0f2
	bcs	Lf091
	jsr	Sf1e7
	bcc	Lf063
	jsr	Sde3a
	bcc	Lf052
	bra	Lf091
Lf063:	bit	Z63
	bmi	Lf06e
	lda	#$20
	sta	Z16
	jsr	Sf0b1
Lf06e:	lda	#$20
	eor	Z16
	sta	Z16
	bne	Lf04e
	inc	Z14
	lda	Z14
	cmp	#$50
	bcc	Lf04e
	stz	Z16
	stz	Z14
	ldx	Z2f
	jsr	Sf0a0
	jsr	Sd60b
	clc
	jsr	Sd4cc
	bcs	Lf093
	rts

Lf091:	lda	#$27
Lf093:	pha
	ldx	Z2f
	jsr	Sf0a0
	jsr	Sed05
	pla
	jmp	Sd297

Sf0a0:	lda	Z48,x
	beq	Lf0b0
	lda	#$80
	sta	Z63
	lda	#$04
	sta	Z62
	stz	Z4a,x
	stz	Z48,x
Lf0b0:	rts

Sf0b1:	bit	Zb4
	bmi	Lf0e7
	lda	Z14
	lsr
	lsr
	lsr
	and	#$0e
	sta	Z2c
	jsr	Se600
	ldx	Z2c
	lda	Df0e9,x
	tay
	lda	Df0e8,x
	tax
	lda	#$bb
	bit	D0a0d
	sta	D0a0f
Lf0d3:	bit	D0a0c
	bpl	Lf0d3
	sta	D0a0d
	dex
	bne	Lf0d3
	dey
	bne	Lf0d3
	bit	D0a0e
	bit	D0a0c
Lf0e7:	rts

Df0e8:	fcb	$94
Df0e9:	fcb	$25,$74,$22,$54,$1f,$34,$1c,$14
	fcb	$19


; write track
Sf0f2:	bit	Zb4
	bpl	Lf0f9
	jmp	Lf2a3

; write track GCR
Lf0f9:	jmp	Z81	; hook to immediately following Lf0fc

Lf0fc:	jsr	Sd5d8
	jsr	Sf22b
	jsr	Sd8c1
	stz	Z57
	lda	Z16
	bne	Lf11e
	lda	Z14
	and	#$0f
	bne	Lf11e
	lda	Z14
	lsr
	lsr
	lsr
	lsr
	tax
	lda	Df1e2,x
	jsr	Sf730
Lf11e:	jsr	Se600
	lda	Z1a
	sta	Z1c
	ldy	#$c8
	lda	#$ff
	bit	D0a0d
	sta	D0a0f
Lf12f:	ldx	#$04
Lf131:	lda	Z92,x
Lf133:	bit	D0a0c
	bpl	Lf133
	sta	D0a0d
	dex
	bpl	Lf131
	dey
	bne	Lf12f
	ldx	#$03
Lf143:	lda	Z9f,x
Lf145:	bit	D0a0c
	bpl	Lf145
	sta	D0a0d
	dex
	bpl	Lf143
	ldx	#$04
Lf152:	ldy	Z27,x
	lda	Dd000,y
Lf157:	bit	D0a0c
	bpl	Lf157
	sta	D0a0d
	dex
	bpl	Lf152
	ldx	#$0b
Lf164:	lda	Z8e,x
Lf166:	bit	D0a0c
	bpl	Lf166
	sta	D0a0d
	dex
	bpl	Lf164
	ldx	Z2a
	lda	Dd000,x
Lf176:	bit	D0a0c
	bpl	Lf176
	sta	D0a0d
	ldx	#$03
	ldy	#$eb
	bra	Lf186
Lf184:	ldy	#$ea
Lf186:	lda	#$96
Lf188:	bit	D0a0c
	bpl	Lf188
	sta	D0a0d
	dey
	bne	Lf186
	dex
	bne	Lf184
	ldx	#$01
Lf198:	lda	Z97+1,x
Lf19a:	bit	D0a0c
	bpl	Lf19a
	sta	D0a0d
	dex
	bpl	Lf198
	dec	Z1c
	beq	Lf1c2
	lda	Z2a
	eor	Z27
	ldy	Z1c
	ldx	D05ff,y
	stx	Z2a
	eor	Z2a
	ldy	#$ff
	sty	D0a0d
	sta	Z27
	ldy	#$0a
	jmp	Lf12f

Lf1c2:	lda	#$40
	and	D0a0c
	eor	#$40
	tsb	Z57
Lf1cb:	lda	D0a0c
	bpl	Lf1cb
	lda	#$ff
	sta	D0a0d
Lf1d5:	bit	D0a0c
	bvs	Lf1d5
	bit	D0a0e
	lda	Z57
	cmp	#$01
	rts

Df1e2:	fcb	$96,$19,$19,$19,$19


; verify
Sf1e7:	jmp	Z84	; hook to immediately following Lf1ea

Lf1ea:	jsr	Sf73c
	lda	#$00
	sta	Zab
	sta	Zaf
	lda	#$0c
	sta	Zac
	sta	Zb0
	jsr	Se600
	ldx	Z1a
	stx	Z1c
Lf200:	stz	D0620,x
	dex
	bpl	Lf200
Lf206:	jsr	Se500
	bcs	Lf229
	ldx	Z2a
	cpx	Z1a
	bcs	Lf226
	lda	D0620,x
	bmi	Lf226
	lda	#$ff
	sta	D0620,x
	jsr	Se60f
	bcs	Lf229
	dec	Z1c
	bne	Lf206
	clc
	rts

Lf226:	jsr	Sd7a8
Lf229:	sec
	rts

Sf22b:	lda	Z14
	lsr
	lsr
	lsr
	lsr
	tax
	lda	Dde35,x
	sta	Z1a
	jsr	Sf262
	lda	Z14
	and	#$3f
	sta	Z2b
	stz	Z2a
	lda	Z14
	and	#$40
	beq	Lf249
	inc
Lf249:	ldx	Z16
	beq	Lf24f
	ora	#$20
Lf24f:	sta	Z29
	lda	Z62
	bit	Z63
	bpl	Lf259
	ora	#$20
Lf259:	sta	Z28
	eor	Z29
	eor	Z2b
	sta	Z27
	rts

Sf262:	lda	Z62
	bne	Lf26a
	lda	#$01
	sta	Z62
Lf26a:	lda	Z1a
	dec
	dec
	cmp	Z62
	bcs	Lf274
	sta	Z62
Lf274:	ldx	Z1a
	inx
	lda	#$ff
Lf279:	sta	D0600,x
	dex
	bpl	Lf279
	ldx	Z1a
	dex
	ldy	#$00
Lf284:	tya
	sta	D0600,x
	iny
	cpy	Z1a
	beq	Lf2a1
	txa
	sec
	sbc	Z62
	tax
Lf292:	bpl	Lf299
	txa
	clc
	adc	Z1a
	tax
Lf299:	bit	D0600,x
	bmi	Lf284
	dex
	bra	Lf292
Lf2a1:	clc
Lf2a2:	rts


; write track, MFM
Lf2a3:	jsr	Sd5d8
	stz	Zb5
	lda	#$12
	ldx	Z2f
	ldy	Z48,x
	cpy	#$08
	bne	Lf2b6
	lda	#$09
	dec	Zb5
Lf2b6:	sta	Z1a
	sta	Z1c
	jsr	Sf262
	jsr	Sd89f
	bcs	Lf2a2
	lda	Z14
	bne	Lf2d4
	lda	Z16
	bne	Lf2d4
	lda	#$96
	jsr	Sf730
	lda	#$96
	jsr	Sf730
Lf2d4:	jsr	Se600
	jsr	Sd714
	bit	D0a0a
	lda	#$18
	sta	D0a06
	lda	#$10
	sta	D0a07
	lda	#$01
	sta	D0a07
	sta	D0a06
	sta	Z2a
	bit	D0a0a
	ldy	#$34
	ldx	#$35
	bit	Zb5
	bpl	Lf300
	ldy	#$9a
	ldx	#$1a
Lf300:	lda	#$4e
	sta	D0a00
	sta	D0a00
	lda	#$08
	sta	D0a07
Lf30d:	bit	D0a0f
	bpl	Lf30d
	beq	Lf324
	lda	#$4e
	sta	D0a00
	lda	#$08
	dey
	bne	Lf30d
	dex
	bne	Lf30d
	jmp	Lf4ac

Lf324:	lda	#$4e
	sta	D0a00
	lda	#$08
Lf32b:	bit	D0a0f
	bpl	Lf32b
	bne	Lf342
	lda	#$4e
	sta	D0a00
	lda	#$08
	dey
	bne	Lf32b
	dex
	bne	Lf32b
	jmp	Lf4ac

Lf342:	lda	#$4e
	sta	D0a00
	lda	#$f0
	sta	D0a04
	ldx	#$4f
	lda	#$4e
Lf350:	bit	D0a0f
	bpl	Lf350
	sta	D0a00
	dex
	bne	Lf350
	ldx	#$0c
Lf35d:	bit	D0a0f
	bpl	Lf35d
	stz	D0a00
	dex
	bne	Lf35d
	ldx	#$03
Lf36a:	bit	D0a0f
	bpl	Lf36a
	lda	#$c2
	sta	D0a01
	dex
	bne	Lf36a
Lf377:	bit	D0a0f
	bpl	Lf377
	lda	#$fc
	sta	D0a00
	ldx	#$32
	lda	#$4e
Lf385:	bit	D0a0f
	bpl	Lf385
	sta	D0a00
	dex
	bne	Lf385
	bra	Lf3a1
Lf392:	ldx	Zb6
	lda	#$4e
Lf396:	bit	D0a0f
	bpl	Lf396
	sta	D0a00
	dex
	bne	Lf396
Lf3a1:	ldx	#$0c
Lf3a3:	bit	D0a0f
	bpl	Lf3a3
	stz	D0a00
	dex
	bne	Lf3a3
	ldx	#$03
Lf3b0:	bit	D0a0f
	bpl	Lf3b0
	lda	#$a1
	sta	D0a01
	dex
	bne	Lf3b0
Lf3bd:	bit	D0a0f
	bpl	Lf3bd
	lda	#$fe
	sta	D0a00
	lda	Z14
Lf3c9:	bit	D0a0f
	bpl	Lf3c9
	sta	D0a00
	lda	#$00
	ldx	Z16
	beq	Lf3d8
	inc
Lf3d8:	bit	D0a0f
	bpl	Lf3d8
	sta	D0a00
	lda	Z2a
Lf3e2:	bit	D0a0f
	bpl	Lf3e2
	sta	D0a00
Lf3ea:	bit	D0a0f
	bpl	Lf3ea
	lda	#$02
	sta	D0a00
Lf3f4:	bit	D0a0f
	bpl	Lf3f4
	stz	D0a02
	ldx	#$16
	lda	#$4e
Lf400:	bit	D0a0f
	bpl	Lf400
	sta	D0a00
	dex
	bne	Lf400
	ldx	#$0c
Lf40d:	bit	D0a0f
	bpl	Lf40d
	stz	D0a00
	dex
	bne	Lf40d
	ldx	#$03
Lf41a:	bit	D0a0f
	bpl	Lf41a
	lda	#$a1
	sta	D0a01
	dex
	bne	Lf41a
Lf427:	bit	D0a0f
	bpl	Lf427
	lda	#$fb
	sta	D0a00
	ldx	#$00
	lda	#$00
Lf435:	bit	D0a0f
	bpl	Lf435
	sta	D0a00
	dex
	bne	Lf435
Lf440:	bit	D0a0f
	bpl	Lf440
	sta	D0a00
	dex
	bne	Lf440
Lf44b:	bit	D0a0f
	bpl	Lf44b
	stz	D0a02
	dec	Z1c
	beq	Lf462
	ldy	Z1c
	lda	D05ff,y
	inc
	sta	Z2a
	jmp	Lf392

Lf462:	lda	#$04
	sta	Z2c
	ldx	#$05
Lf468:	bit	D0a0f
	bpl	Lf468
	lda	#$4e
	sta	D0a00
	dex
	bne	Lf468
	ldy	#$00
	lda	#$f4
	sta	D0a04
	ldx	#$4e
Lf47e:	lda	D0a0f
	bpl	Lf47e
	stx	D0a00
	bit	#$08
	bne	Lf493
	dey
	bne	Lf47e
	dec	Z2c
	bne	Lf47e
	bra	Lf4ac
Lf493:	and	#$20
	beq	Lf49c
	lda	#$34
	sec
	bra	Lf49f
Lf49c:	lda	#$00
	clc
Lf49f:	sta	Z57
	php
	lda	#$18
	sta	D0a06
	jsr	Sd76e
	plp
	rts

Lf4ac:	lda	#$35
	sec
	bra	Lf49f

	fillto	$f500

Sf500:	stz	Za4
	ldx	#$08
	lda	Zae
Lf506:	asl	Zad
	rol
	cmp	#$07
	bcc	Lf50f
	sbc	#$07
Lf50f:	rol	Za4
	dex
	bne	Lf506
	sta	Za5
	rts

Sf517:	ldx	#$07
Lf519:	stz	Za3,x
	dex
	bne	Lf519
	stz	Z1e
	stz	Z57
	jsr	Sf713
	tsx
Lf526:	stz	D0100,x
	dex
	cpx	#$e1
	bcs	Lf526
	bit	D0a0d
	ldx	Z1e
Lf533:	lda	#$64
Lf535:	ldy	#$cd
Lf537:	bit	D0a0e
	bmi	Lf547
	dey
	bne	Lf537
	dec
	bne	Lf535
	dex
	bne	Lf533
	bra	Lf550
Lf547:	lda	D0a01
	ldy	#$00
Lf54c:	lda	D0a0c
	dey
Lf550:	beq	Lf5ca
	cmp	#$c3
	bne	Lf54c
	ldy	#$07
Lf558:	lda	D0a0c
	bpl	Lf558
	and	#$7f
	sta	Za3,y
	ora	#$80
	eor	Z1e
	sta	Z1e
	dey
	bne	Lf558
	lda	Za4
	bmi	Lf5c6
	sta	Z18
	ldx	Za5
	beq	Lf596
Lf575:	lda	D0a0c
	bpl	Lf575
	asl
	sta	Z17
Lf57d:	lda	D0a0c
	bpl	Lf57d
	asl	Z17
	bcs	Lf588
	and	#$7f
Lf588:	sta	(Zab),y
	eor	Z1e
	sta	Z1e
	iny
	bne	Lf593
	inc	Zac
Lf593:	dex
	bne	Lf57d
Lf596:	ldx	#$07
	dec	Z18
	bpl	Lf575
Lf59c:	lda	D0a0c
	bpl	Lf59c
	sta	Z2c
Lf5a3:	lda	D0a0c
	bpl	Lf5a3
	sec
	rol
	and	Z2c
	eor	Z1e
	bne	Lf5d2
Lf5b0:	lda	D0a0c
	bpl	Lf5b0
	cmp	#$c8
	bne	Lf5ce
	lda	D0a0d
Lf5bc:	lda	D0a0e
	bmi	Lf5bc
	lda	D0a00
	clc
	rts

Lf5c6:	lda	#$8a
	bra	Lf5d4
Lf5ca:	lda	#$80
	bra	Lf5d4
Lf5ce:	lda	#$81
	bra	Lf5d4
Lf5d2:	lda	#$83
Lf5d4:	sta	Z57
	sec
	rts

Sf5d8:	bit	D0a0e
	bit	D0a0c
	jsr	Sf6dc
	jsr	Sf713
	lda	D0a0a
	lda	D0a09
	bit	D0a0d
	ldy	#$fa
Lf5ef:	lda	D0a0e
	bmi	Lf5fc
	dey
	bne	Lf5ef
	lda	#$84
	jmp	Lf697

Lf5fc:	lda	D0a01
	ldy	#$05
	lda	#$ff
	sta	D0a0f
Lf606:	lda	Df754,y
Lf609:	bit	D0a0c
	bpl	Lf609
	sta	D0a0d
	dey
	bpl	Lf606
	lda	#$00
	sta	Z1e
	lda	Z2f
	ora	#$80
	jsr	Sf6cb
	jsr	Sf6c9
	lda	Z19
	jsr	Sf6cb
	jsr	Sf6c9
	jsr	Sf6c9
	lda	Za5
	ora	#$80
	jsr	Sf6cb
	lda	Za4
	ora	#$80
	jsr	Sf6cb
	ldy	#$00
	ldx	Za5
	beq	Lf64f
	lda	Z17
	jsr	Sf6d3
Lf646:	lda	(Zab),y
	jsr	Sf6cb
	iny
	dex
	bne	Lf646
Lf64f:	dec	Za4
	bmi	Lf674
	lda	Z18
	jsr	Sf6d3
	lda	#$01
	sta	Z18
	ldx	#$07
Lf65e:	lda	(Zab),y
	jsr	Sf6cb
	lda	(Zad),y
	asl
	rol	Z18
	iny
	bne	Lf66f
	inc	Zac
	inc	Zae
Lf66f:	dex
	bne	Lf65e
	beq	Lf64f
Lf674:	lda	Z1e
	ora	#$aa
	jsr	Sf6d3
	lda	Z1e
	lsr
	ora	#$aa
	jsr	Sf6d3
	lda	#$c8
	jsr	Sf6d3
Lf688:	bit	D0a0c
	bvs	Lf688
	sta	D0a0d
	ldy	#$fa
Lf692:	dey
	bne	Lf69a
	lda	#$82
Lf697:	sec
	bra	Lf6a2
Lf69a:	lda	D0a0e
	bmi	Lf692
	lda	#$00
	clc
Lf6a2:	bit	D0a00
	bit	D0a0c
	sta	Z57
	rts

Sf6ab:	stz	Z2c
	lda	Za4
	asl
	rol	Z2c
	asl
	rol	Z2c
	asl
	rol	Z2c
	sec
	sbc	Za4
	bcs	Lf6bf
	dec	Z2c
Lf6bf:	clc
	adc	Za5
	bcc	Lf6c6
	inc	Z2c
Lf6c6:	ldy	Z2c
	rts

Sf6c9:	lda	#$80

Sf6cb:	pha
	eor	Z1e
	sta	Z1e
	pla
	ora	#$80

Sf6d3:	bit	D0a0c
	bpl	Sf6d3
	sta	D0a0d
	rts

Sf6dc:	lda	Z6c
	sta	Zad
	lda	Z6d
	sta	Zae
	jsr	Sf500
	lda	Zab
	clc
	adc	#$07
	sta	Zad
	lda	Zac
	adc	#$00
	sta	Zae
	ldy	#$00
	jsr	Sf703
	lda	Z18
	sta	Z17
	ldy	Za5
	jsr	Sf703
	rts

Sf703:	ldx	#$07
	lda	#$01
	sta	Z18
Lf709:	lda	(Zab),y
	asl
	rol	Z18
	iny
	dex
	bne	Lf709
	rts

Sf713:	jsr	Sf747
	lda	D0a03
	lda	D0a07
	rts

Sf71d:	jsr	Sf747
	lda	D0a01
	lda	D0a05
	lda	#$50
	jsr	Sf735
	jsr	Sf747
	lda	#$05

Sf730:	pha
	jsr	Sf735
	pla

Sf735:	jsr	Sf73c
	dec
	bne	Sf735
	rts

Sf73c:	pha
	lda	#$cb
Lf73f:	dec
	bne	Lf742
Lf742:	nop
	bne	Lf73f
	pla
	rts

Sf747:	bit	D0a00
	bit	D0a02
	bit	D0a04
	bit	D0a06
	rts

Df754:	fcb	$c3,$ff,$fc,$f3,$cf,$3f

Sf75a:	lda	#$80
	sta	Z19
	lda	Z02
	and	#$0f
	sta	Z4c
	ldy	Z00
	lda	Df8b0,y
	and	#$0f
	sta	Z4d
	stz	Z4e
	stz	Z4f
	ldx	#$06
Lf773:	lda	Z04,x
	sta	Z4f,x
	dex
	bne	Lf773

Sf77a:	lda	#$09
	sta	Z6c
	stz	Z6d
	lda	#$4c
	sta	Zab
	stz	Zac
	rts

Sf787:	jsr	Sf7bc
	bcs	Sf78d
	rts

Sf78d:	lda	Z2f
	pha
	ldx	Z32
	lda	#$80
	jsr	Sf8ba
	pla
	sta	Z2f
	sec
	rts

Sf79c:	lda	#$01
	jsr	Sf7be
	bcc	Lf7bb
	jsr	Sf78d
	jsr	Sf75a
	lda	#$64
	jsr	Sf7be
	bcc	Lf7bb
	jsr	Sf78d
	jsr	Sf75a
	lda	#$64
	jsr	Sf7be
Lf7bb:	rts

Sf7bc:	lda	#$20

Sf7be:	ldx	Z6d
	beq	Lf7c6
Lf7c2:	lsr
	dex
	bne	Lf7c2
Lf7c6:	sta	Z58
Lf7c8:	jsr	Sf5d8
	bcc	Lf7dc
	dec	Z58
	beq	Lf7dc
	ldx	Z6d
	bne	Lf7c8
	lda	#$05
	jsr	Sf735
	bra	Lf7c8
Lf7dc:	rts

Sf7dd:	lda	#$05
	sta	Z58
	lda	Z00
	cmp	#$03
	bne	Lf7eb
	lda	#$3c
	sta	Z58
Lf7eb:	jsr	Sf517
	bcc	Lf7fe
	jsr	Sf73c
	sec
	bit	D0a00
	bit	D0a0c
	dec	Z58
	bne	Lf7eb
Lf7fe:	rts

Sf7ff:	ldy	#$19
Lf801:	lda	D0bff,y
	sta	D0c00,y
	dey
	cpy	#$04
	bne	Lf801
	stz	D0c04
	inc	Z0b
	rts

Sf812:	lda	#$17
	jsr	Sd651
	stz	Za6
	jsr	Sf75a
	jsr	Sf747
	jsr	Sf79c
	bcs	Lf868
	ldx	Z00
	bit	Df8b0,x
	bpl	Lf86a
	cpx	#$02
	beq	Lf83e
	lda	Z0c
	cmp	#$05
	bcc	Lf83e
	bit	Df8b0
	ldy	#$00
	lda	#$22
	bra	Lf897
Lf83e:	lda	#$06
	sta	Z01
Lf842:	lda	Z01
	bpl	Lf842
	ldx	Z0b
	ldy	Z0c
	lda	Z00
	cmp	#$02
	bne	Lf854
	ldy	#$02
	ldx	#$00
Lf854:	sty	Z6d
	stx	Z6c
	lda	#$82
	sta	Z19
	jsr	Sf747
	stz	Zab
	lda	#$0c
	sta	Zac
	jsr	Sf787
Lf868:	bcs	Lf8aa
Lf86a:	stz	Zab
	lda	#$0c
	sta	Zac
	jsr	Sf7dd
	bcs	Lf8a2
	jsr	Sf6ab
	sta	Z0b
	sty	Z0c
Lf87c:	ldy	#$00
	ldx	Z00
	bne	Lf889
	bit	Z02
	bvc	Lf889
	jsr	Sf7ff
Lf889:	cpx	#$0a
	clv
	bcs	Lf897
	bit	Df8b0,x
	bvc	Lf895
	ldy	#$06
Lf895:	lda	Za6
Lf897:	sta	Z56
	bvc	Lf89d
	sty	Z01
Lf89d:	jsr	Sf747
	clc
	rts

Lf8a2:	cmp	#$80
	beq	Lf8aa
	lda	#$27
	bra	Lf8ac
Lf8aa:	lda	#$06
Lf8ac:	sta	Za6
	bra	Lf87c

Df8b0:	fcb	$43,$43,$83,$01,$83,$01,$01,$01
	fcb	$44,$84

Sf8ba:	sta	Z50
	phx
	lda	#$00
Lf8bf:	sta	Z33,x
	inx
	cpx	#$04
	bcc	Lf8bf
	bit	D0a08
	lda	#$ff
	sta	Z2f
	jsr	Sd7cc
	jsr	Sd80b
	lda	#$17
	jsr	Sd651
	plx
	stx	Z2f
	jsr	Sf71d
	jsr	Sf747
	stz	Z13
Lf8e3:	lda	#$80
	sta	Z19
	lda	#$05
	sta	Z4c
	lda	#$02
	sta	Z4d
	stz	Z4f
	stz	Z51
	jsr	Sf77a
	jsr	Sf5d8
	bcs	Lf928
	stz	Zab
	lda	#$0c
	sta	Zac
	jsr	Sf517
	bcs	Lf928
	ldy	Z2f
	cpy	#$05
	bcs	Lf916
	lda	#$80
	sta	Z33,y
	lda	#$00
	sta	Z39,y
Lf916:	inc	Z13
	inc	Z2f
	lda	Za6
	beq	Lf8e3
	lda	Z13
	cmp	#$03
	bcc	Lf928
	lda	#$02
	sta	Z13
Lf928:	jsr	Sf747
	bit	D0a08
	lda	Z13
	rts

IRQ:	ldx	#$ff
Lf933:	inx
	bit	D0a80,x
	ldy	#$00
Lf939:	lda	#$00
Lf93b:	dec
	bne	Lf93e
Lf93e:	bne	Lf93b
	dey
	bne	Lf939
	txa
	beq	Lf933
	bra	IRQ

	fillto	$ffda

Dffda:	fcb	$50,$c8,$a7,$b8,$ec,$67,$86,$46
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$ca,$89,$f6,$c2
	fcb	$19,$73,$9a,$b1,$81,$9e,$78,$73

Dfffa:
; vectors
	fdb	RESET
	fdb	RESET
	fdb	IRQ
