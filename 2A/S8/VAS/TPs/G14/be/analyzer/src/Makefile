OCAMLBUILD=ocamlbuild -use-ocamlfind -classic-display -no-links
LOCAL_DOCDIR=doc

tiny:
	$(OCAMLBUILD) main.native
	cp _build/main.native tiny

test-domain: 
	$(OCAMLBUILD) test_domain.native
	cp _build/test/test_domain.native test-domain

test: test-domain 
	./test-domain


doc:
	$(OCAMLBUILD) tiny.docdir/index.html
	rm -rf $(LOCAL_DOCDIR)
	cp -rf _build/tiny.docdir $(LOCAL_DOCDIR)

clean:
	$(OCAMLBUILD) -clean
	rm -f *~ domains/*~

.PHONY: tiny doc clean test test-domain
