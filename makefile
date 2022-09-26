# Path to the mapperproxy-mume sources
MAPDIR=$(HOME)/var/src/mapperproxy-mume
# Path to place executables
BINDIR=$(HOME)/.local/bin/

mume: mume.sh
	sed -e "s,^mapdir=,mapdir=$(MAPDIR)," $< > $@

install: mume
	install -m 755 $< $(BINDIR)

uninstall:
	rm -f $(BINDIR)/mume

clean:
	rm mume
