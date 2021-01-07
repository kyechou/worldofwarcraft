#
# Makefile for installing/packaging world of warcraft helper program
#

pkgname     := worldofwarcraft

prefix      := $(DESTDIR)/usr
bindir      := $(prefix)/bin
datarootdir := $(prefix)/share
docdir      := $(datarootdir)/doc/$(pkgname)
iconsdir    := $(datarootdir)/icons
licensesdir := $(datarootdir)/licenses/$(pkgname)
bashcompdir := $(datarootdir)/bash-completion/completions


nop:

install:
	install -Dm755 wow                      -t $(bindir)
	install -Dm644 worldofwarcraft.desktop  -t $(datarootdir)/applications
	install -Dm644 worldofwarcraft.png      -t $(iconsdir)/hicolor/256x256/apps
	install -Dm644 worldofwarcraft.reg      -t $(docdir)
	install -Dm644 LICENSE                  -t $(licensesdir)
	install -Dm644 completion.bash             $(bashcompdir)/wow

uninstall:
	@rm -vf $(bindir)/worldofwarcraft
	@rm -vf $(datarootdir)/applications/worldofwarcraft.desktop
	@rm -vf $(iconsdir)/hicolor/256x256/apps/worldofwarcraft.png
	@rm -vf $(docdir)/worldofwarcraft.reg
	@rm -vf $(licensesdir)/LICENSE
	@rm -vf $(bashcompdir)/$(pkgname)

.PHONY: nop install uninstall
