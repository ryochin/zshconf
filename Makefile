#
# $URL$
# $Id$

PREFIX = $(HOME)

ZSHBASE = $(PREFIX)
ZSHDIR = $(ZSHBASE)/.zsh

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 640

all:
	

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

