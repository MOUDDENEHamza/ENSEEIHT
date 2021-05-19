tiny:
	make -C src tiny

doc:
	make -C src doc

install-emacs-mode:
	touch ~/.emacs ; \
	if ! $$(grep -q tiny ~/.emacs) ; then \
          rm -f ~/.emacs.tiny ; \
	  echo ";; Tiny" > ~/.emacs.tiny ; \
	  echo "(setq load-path (cons \"$$(pwd)\" load-path))" >> ~/.emacs.tiny ; \
	  echo "(autoload 'tiny-mode \"tiny\" \"Major mode for editing TINY code\" t)" >> ~/.emacs.tiny ; \
	  echo "(setq auto-mode-alist (append '((\"\\\\.tiny\" . tiny-mode)) auto-mode-alist))" >> ~/.emacs.tiny ; \
	  echo "" >> ~/.emacs.tiny ; \
	  cat ~/.emacs >> ~/.emacs.tiny ; \
	  mv -f ~/.emacs.tiny ~/.emacs ; \
	fi

clean:
	make -C src clean
	rm -f *~

.PHONY: tiny doc install-emacs-mode clean