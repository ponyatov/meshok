.PHONY : install update ref gz
install: $(WS)_install $(RUSTUP) doc ref gz
	$(MAKE) update
update : $(WS)_update $(RUSTUP)
	$(RUSTUP) self update && $(RUSTUP) update
ref    : $(RF)
gz     : $(GZ)
