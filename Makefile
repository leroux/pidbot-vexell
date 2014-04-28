TRGT  = arm-none-eabi-
HSDIR = build_haskell

include setup.mk

all: $(HSDIR)/hs_main.c
	make -f forc.mk
	cortexflash -X -w bin/output.bin -v /dev/tty.usbmodem1420

$(HSDIR)/hs_main.c: hs_src/Main.hs
	mkdir -p $(HSDIR)
	ajhc -fffi -pjhc-1.0 -ptransformers-0.2.1.0 --tdir=$(HSDIR) -C --include=hs_src --include=$(VEXELL)/src -o $@ $<

clean:
	rm -rf build_haskell
	make -f forc.mk clean

shell:
	screen /dev/tty.usbmodem1421 115200
