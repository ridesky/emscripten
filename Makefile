VERSION=$(shell cat emscripten-version.txt | sed s/\"//g)
DISTDIR=../emscripten-$(VERSION)
EXCLUDES=tests site __pycache__ node_modules docs Makefile
DISTFILE=emscripten-$(VERSION).tar.bz2
EXCLUDE_PATTERN=--exclude='*.pyc' --exclude='*/__pycache__'

dist: $(DISTFILE)

$(DISTFILE):
	@rm -rf $(DISTDIR)
	mkdir $(DISTDIR)
	cp -ar * $(DISTDIR)
	for ext in $(EXCLUDES); do rm -rf $(DISTDIR)/$$ext; done
	tar cf $@ $(EXCLUDE_PATTERN) -C `dirname $(DISTDIR)` `basename $(DISTDIR)`

.PHONY: dist
