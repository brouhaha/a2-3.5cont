all: apple35cont.bin apple35cont.lst check

%.p %.lst: %.asm
	asl -L $<

%.bin: %.p
	p2bin -r '$$-$$' $<

check: apple35cont.bin
	echo '084587835c1d2c92f5708a9745fdd43ba32136fcdb861a12ee7d690de22dc172 apple35cont.bin' | sha256sum -c -

clean:
	rm -f apple35cont.bin apple35cont.lst
