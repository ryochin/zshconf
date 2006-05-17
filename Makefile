#
# $URL$
# $Id$

PREFIX = $(HOME)

ZSHBASE = $(PREFIX)
ZSHDIR = $(ZSHBASE)/.zsh

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 640

RIVISION = ` perl -e ' $$d = q|$$Rivision: 2$$|; $$d =~ s/^.+: (\d).+$$/$$1/; print $$d ' `

all:
	
risision:
	echo "rivison is $(RIVISION)."

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

dist: clean

	mkdir zshconf-r$(RIVISION)

	for i in Makefile README.txt; do \
		cp -p $$i zshconf-r$(RIVISION); \
	done	

	for i in .zlogin .zlogout .zshrc .zshenv .zprofile; do \
		cp -p dot$$i zshconf-r$(RIVISION); \
	done

	for i in aliases completions functions lscolors zshoptions zshrc.bsd zshrc.darwin zshrc.gnu zshrc.user; do \
		cp -p $$i zshconf-r$(RIVISION); \
	done

	tar zcvf zshconf-r$(RIVISION).tar.gz zshconf-r$(RIVISION)

clean:
	rm -rf zshconf-r$(RIVISION)
	rm -f zshconf-r$(RIVISION).tar.gz

