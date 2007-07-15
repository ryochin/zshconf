#
# $URL$
# $Id$

PREFIX = $(HOME)

ZSHBASE = $(PREFIX)
ZSHDIR = $(ZSHBASE)/.zsh

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 640

REVISION = ` perl -e ' $$d = q|$$Revision$$d =~ s/^.+: (\d).+$$/$$1/; print $$d ' `

all:

revision:
	echo "revison is $(REVISION)."

install:

	if [ ! -e $(ZSHBASE) ]; then \
		mkdir $(ZSHBASE); \
	fi

	if [ ! -e $(ZSHDIR) ]; then \
		mkdir $(ZSHDIR); \
		chmod 750 $(ZSHDIR); \
	fi

	for i in .zlogin .zlogout .zshrc .zshenv .zprofile; do \
		$(INSTALL_DATA) dot$$i $(ZSHBASE)/$$i; \
	done

	if [ ! -e $(ZSHBASE)/.zsh_history ]; then \
		touch $(ZSHBASE)/.zsh_history; \
		chmod 600 $(ZSHBASE)/.zsh_history; \
	fi

	for i in aliases completions functions lscolors zshoptions zshrc.bsd zshrc.darwin zshrc.gnu zshrc.user; do \
		$(INSTALL_DATA) $$i $(ZSHDIR)/$$i; \
	done

dist: distclean

	mkdir zshconf-r$(REVISION)

	for i in Makefile README.txt; do \
		cp -p $$i zshconf-r$(REVISION); \
	done	

	for i in .zlogin .zlogout .zshrc .zshenv .zprofile; do \
		cp -p dot$$i zshconf-r$(REVISION); \
	done

	for i in aliases completions functions lscolors zshoptions zshrc.bsd zshrc.darwin zshrc.gnu zshrc.user; do \
		cp -p $$i zshconf-r$(REVISION); \
	done

	tar zcvf zshconf-r$(REVISION).tar.gz zshconf-r$(REVISION)

distclean:
	rm -rf zshconf-r$(REVISION)
	rm -f zshconf-r$(REVISION).tar.gz

clean: distclean

