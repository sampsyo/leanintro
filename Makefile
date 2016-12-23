.PHONY: all pubhtml lean
all: pubhtml lean

# Madoko.
TARGETS := ch1
DEPS := style.mdk sendcode.js
BUILD_DIR := html
include madoko.mk

# Copy HTML output.
pubhtml: $(HTML)
	mkdir -p build
	cp $(HTML) build/

# Build Lean web interface. Shamelessly ripped off from the mkleanbook
# include.mk.
MKLEANBOOK_PATH ?= mkleanbook
LEANBOOK_BUILD ?= build/lean
lean:
	mkdir -p $(LEANBOOK_BUILD)
	sed 's|COPYRIGHT_NOTICE|$(COPYRIGHT_NOTICE)|;s|AUTHORS|$(AUTHORS)|;s|TITLE|$(TITLE)|' $(MKLEANBOOK_PATH)/index.html > $(LEANBOOK_BUILD)/index.html
	cp $(MKLEANBOOK_PATH)/juicy-ace-editor.html $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/css $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/fonts $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/images $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/js $(LEANBOOK_BUILD)
	cp nav_data.js $(LEANBOOK_BUILD)/js
