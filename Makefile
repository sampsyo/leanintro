COPYRIGHT_NOTICE := foo
AUTHORS := bar
TITLE := baz

BUILD_DIR := build
MKLEANBOOK_PATH := mkleanbook
HTMLS := somepage.html
NAV_DATA := $(BUILD_DIR)/js/nav_data.js

.PHONY: all copy-assets copy-html

all: copy-assets $(NAV_DATA) copy-html

$(NAV_DATA):
	mkdir -p $(dir $(NAV_DATA))
	echo "var lean_nav_data = [" > $(NAV_DATA)
	for i in $(HTMLS); do echo $$i; done | sed 's/\(.*\)/"\1",/' >> $(NAV_DATA)
	echo "];" >> $(NAV_DATA)

copy-assets:
	mkdir -p $(BUILD_DIR)
	sed 's|COPYRIGHT_NOTICE|$(COPYRIGHT_NOTICE)|;s|AUTHORS|$(AUTHORS)|;s|TITLE|$(TITLE)|' $(MKLEANBOOK_PATH)/index.html > $(BUILD_DIR)/index.html
	cp $(MKLEANBOOK_PATH)/juicy-ace-editor.html $(BUILD_DIR)
	cp -r $(MKLEANBOOK_PATH)/css $(BUILD_DIR)
	cp -r $(MKLEANBOOK_PATH)/fonts $(BUILD_DIR)
	cp -r $(MKLEANBOOK_PATH)/images $(BUILD_DIR)
	cp -r $(MKLEANBOOK_PATH)/js $(BUILD_DIR)

copy-html:
	cp $(HTMLS) $(BUILD_DIR)
