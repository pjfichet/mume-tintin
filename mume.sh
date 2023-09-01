#! /bin/sh

# to install mapperproxy-mume:
# $ bash -i
# $ python -m venv venv
# $ source .venv/bin/activate
# $ pip install --update-pip
# $ pip install poetry
# $ poetry install

mapdir=

if [ "$1" = "-e" ]; then
	# start emulation
	(cd $mapdir
	source .venv/bin/activate
	mapper -i sighted -lh 127.0.0.1 -lp 4000 -f tintin -e) &
	sleep 5
	tintin $2
elif [ "$1" = "-n" ]; then
	# without sighted gui
	(cd $mapdir
	source .venv/bin/activate
	mapper -lh 127.0.0.1 -lp 4000 -rh mume.org \
	-rp 4242 -ff "{vnum}, {name}, {attribute}" -ptlf -f tintin) &
	sleep 5
	tintin $2
else
	# start sighted gui
	(cd $mapdir
	source .venv/bin/activate
	mapper -i sighted -lh 127.0.0.1 -lp 4000 -rh mume.org \
	-rp 4242 -ff "{vnum}, {name}, {attribute}" -ptlf -f tintin) &
	sleep 5
	tintin $1
fi
#echo -e "use 'jobs' to see processes running in the background
#and 'fg' to bring them back in foreground."
