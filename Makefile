VIM=vim
AUTOLOAD=$(VIM)/autoload/
PATHOGEN=$(AUTOLOAD)/pathogen.vim
BUNDLE=$(VIM)/bundle
COLORS=$(VIM)/colors
SWP=$(VIM)/.swp
GIT_COMPLETION=git-completion.bash

all: $(PATHOGEN) \
	$(GIT_COMPLETION) \
	$(COLORS)/molokai.vim \
	$(SWP)

clean:
	rm -rf $(VIM) ;
	rm -rf $(SWP) ;
	rm -f $(GIT_COMPLETION) ;

install: all | uninstall
	ln -s $(PWD)/vimrc $(HOME)/.vimrc ;
	ln -s $(PWD)/vim $(HOME)/.vim ;
	ln -s $(PWD)/$(GIT_COMPLETION) $(HOME)/.$(GIT_COMPLETION) ;
	ln -s $(PWD)/bashrc $(HOME)/.bashrc ;
	ln -s $(PWD)/profile $(HOME)/.profile ;
	ln -s $(PWD)/profile $(HOME)/.bash_profile ;

uninstall:
	if [ -h $(HOME)/.vim ] ; then \
		rm -f $(HOME)/.vim ; \
	else \
		rm -rf $(HOME)/.vim ; \
	fi
	rm -f $(HOME)/.vimrc ;
	rm -f $(HOME)/.$(GIT_COMPLETION) ;
	rm -f $(HOME)/.bashrc ;
	rm -f $(HOME)/.profile ;
	rm -f $(HOME)/.bash_profile ;

$(GIT_COMPLETION):
	curl -LSo $(GIT_COMPLETION) \
	https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ;

$(PATHOGEN): $(AUTOLOAD) $(BUNDLE)
	curl -LSo $(PATHOGEN) \
	https://tpo.pe/pathogen.vim ;

$(COLORS)/molokai.vim: $(COLORS)
	curl -LSo $(COLORS)/molokai.vim \
	https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim ;

$(AUTOLOAD):
	mkdir -p $(AUTOLOAD) ;

$(BUNDLE):
	mkdir -p $(BUNDLE) ;

$(COLORS):
	mkdir -p $(COLORS) ;

$(SWP):
	mkdir -p $(SWP) ;

.PHONY: all \
	install
