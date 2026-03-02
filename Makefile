DIRS := $(shell find . -mindepth 1 -maxdepth 1 -type d)

.PHONY: all clean $(DIRS)

all: $(DIRS)

$(DIRS):
	cd "$@" && latexmk -lualatex -interaction=nonstopmode -outdir=out lyrics.tex
	mv "$@/out/lyrics.pdf" "$@/$(@F).pdf"
	rm -rf "$@/out" "$@/lyrics.ltjruby"

clean:
	find . -mindepth 2 \( -name out -type d -o -name '*.pdf' -o -name '*.ltjruby' \) -exec rm -rf {} +
