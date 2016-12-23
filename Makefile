.PHONY: all pubhtml lean deploy-all
all: pubhtml lean

RSYNCARGS := --compress --recursive --checksum --itemize-changes \
	--delete -e ssh
DEST := dh:domains/adriansampson.net/doc/leanintro
deploy-all: all
	rsync $(RSYNCARGS) build/ $(DEST)

# Madoko.
TARGETS := index
DEPS := style.mdk sendcode.js
BUILD_DIR := html
include madoko.mk

# Copy HTML output.
pubhtml: $(HTML)
	mkdir -p build
	cp $(HTML) build/

# Build Lean web interface. Shamelessly ripped off from the mkleanbook
# include.mk.
MKLEANBOOK_PATH := mkleanbook
LEANBOOK_BUILD := build/lean
SCRIPT_HTML := \<script src="js/recvcode.js"\>\</script\>
lean:
	mkdir -p $(LEANBOOK_BUILD)
	sed 's|\<script\>|$(SCRIPT_HTML)\<script\>|' $(MKLEANBOOK_PATH)/index.html > $(LEANBOOK_BUILD)/index.html
	cp $(MKLEANBOOK_PATH)/juicy-ace-editor.html $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/css $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/fonts $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/images $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/js $(LEANBOOK_BUILD)
	cp recvcode.js $(LEANBOOK_BUILD)/js
