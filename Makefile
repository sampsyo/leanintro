.PHONY: all lean
all: lean

# Madoko.
TARGETS := ch1
DEPS := style.mdk sendcode.js
include madoko.mk

# Build Lean web interface. Shamelessly ripped off from the mkleanbook
# include.mk.
MKLEANBOOK_PATH ?= mkleanbook
LEANBOOK_BUILD ?= lean
lean:
	mkdir -p $(LEANBOOK_BUILD)
	sed 's|COPYRIGHT_NOTICE|$(COPYRIGHT_NOTICE)|;s|AUTHORS|$(AUTHORS)|;s|TITLE|$(TITLE)|' $(MKLEANBOOK_PATH)/index.html > $(LEANBOOK_BUILD)/index.html
	cp $(MKLEANBOOK_PATH)/juicy-ace-editor.html $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/css $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/fonts $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/images $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/js $(LEANBOOK_BUILD)
	cp nav_data.js $(LEANBOOK_BUILD)/js
