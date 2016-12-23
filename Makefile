.PHONY: all
all: leanbook

# Madoko.
TARGETS := ch1
DEPS := style.mdk
include madoko.mk

# Leanbook.
COPYRIGHT_NOTICE := foo
AUTHORS := bar
TITLE := baz
LEANBOOK_BUILD := book
include leanbook.mk
