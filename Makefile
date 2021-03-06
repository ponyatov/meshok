# \ var
MODULE  = $(notdir $(CURDIR))
OS      = $(shell uname -s)
NOW     = $(shell date +%d%m%y)
REL     = $(shell git rev-parse --short=4 HEAD)
BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
CORES   = $(shell grep processor /proc/cpuinfo| wc -l)
# / var

# \ dir
CWD     = $(CURDIR)
BIN     = $(CWD)/bin
DOC     = $(CWD)/doc
LIB     = $(CWD)/lib
SRC     = $(CWD)/src
TMP     = $(CWD)/tmp
PYPATH  = $(HOME)/.local/bin
CAR     = $(HOME)/.cargo/bin
# / dir

# \ tool
CURL    = curl -L -o
PY      = $(shell which python3)
PIP     = $(shell which pip3)
PEP     = $(PYPATH)/autopep8
PYT     = $(PYPATH)/pytest
RUSTUP  = $(CAR)/rustup
CARGO   = $(CAR)/cargo
CWATCH  = $(CAR)/cargo-watch
RUSTC   = $(CAR)/rucstc
# / tool

# \ src
Y += $(MODULE).py metaL.py
R += $(shell find src -type f -regex ".+.rs$$")
S += $(Y) $(R)
# / src

# \ all

all:

meta: $(PY) $(MODULE).py
	$^ $@
	$(MAKE) format

test:

format: tmp/format_py
tmp/format_py: $(Y)
	$(PEP) --ignore=E26,E302,E305,E401,E402,E701,E702 --in-place $?
	touch $@

rust:
	$(CWATCH) -w Cargo.toml -w src -x test -x fmt -x run
# / all

# \ doc
doxy:
	doxygen doxy.gen 1>/dev/null
doc:
# / doc

# \ install
install: $(OS)_install doc $(RUSTUP)
	$(MAKE) update
update: $(OS)_update
	$(PIP) install --user -U pytest autopep8
	$(RUSTUP) update && $(CARGO) update

Linux_install Linux_update:
	sudo apt update
	sudo apt install -u `cat apt.txt apt.dev`

$(RUSTUP):
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# / install

# \ merge
MERGE  = Makefile README.md .gitignore apt.dev apt.txt $(S)

ponymuck:
	git push -v
	git checkout $@
	git pull -v

dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout ponymuck -- $(MERGE)

release:
	git tag $(NOW)-$(REL)
	git push -v --tags
	$(MAKE) ponymuck

ZIP = $(TMP)/$(MODULE)_$(BRANCH)_$(NOW)_$(REL).src.zip

zip:
	git archive --format zip --output $(ZIP) HEAD
# / merge
