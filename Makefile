.SUFFIXES:
.SUFFIXES: .pcf.gz .bdf

bdf = tewi-medium-11.bdf tewi-bold-11.bdf tewifw-medium-11.bdf tewifw-bold-11.bdf
pcf = $(bdf:%.bdf=%.pcf.gz)

all: out $(pcf)

.bdf.pcf.gz:
	bdftopcf ${.IMPSRC} | gzip -9 > out/${.TARGET}

out:
	mkdir -p out

install:
	cp out/*.pcf.gz /usr/share/fonts/
	fc-cache

clean:
	rm -rf out

.PHONY: all clean install
