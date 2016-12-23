# Shamelessly ripped off from the mkleanbook include.mk. Include this file
# after defining $(HTML) to point toward source HTML files.

.PHONY: leanbook copy-assets copy-html

MKLEANBOOK_PATH ?= mkleanbook
LEANBOOK_BUILD ?= build

NAV_DATA := $(LEANBOOK_BUILD)/js/nav_data.js

leanbook: copy-assets $(NAV_DATA) copy-html

$(NAV_DATA):
	mkdir -p $(dir $(NAV_DATA))
	echo "var lean_nav_data = [" > $(NAV_DATA)
	for i in $(HTML); do echo $$i; done | sed 's/\(.*\)/"\1",/' >> $(NAV_DATA)
	echo "];" >> $(NAV_DATA)

copy-assets:
	mkdir -p $(LEANBOOK_BUILD)
	sed 's|COPYRIGHT_NOTICE|$(COPYRIGHT_NOTICE)|;s|AUTHORS|$(AUTHORS)|;s|TITLE|$(TITLE)|' $(MKLEANBOOK_PATH)/index.html > $(LEANBOOK_BUILD)/index.html
	cp $(MKLEANBOOK_PATH)/juicy-ace-editor.html $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/css $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/fonts $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/images $(LEANBOOK_BUILD)
	cp -r $(MKLEANBOOK_PATH)/js $(LEANBOOK_BUILD)

copy-html: $(HTML)
	cp $(HTML) $(LEANBOOK_BUILD)
