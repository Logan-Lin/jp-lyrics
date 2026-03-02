DIRS := $(shell find src -mindepth 1 -maxdepth 1 -type d)

.PHONY: all clean $(DIRS)

all: $(DIRS)

$(DIRS):
	cd "$@" && latexmk -lualatex -interaction=nonstopmode -outdir=out lyrics.tex
	mkdir -p out
	mv "$@/out/lyrics.pdf" "out/$(@F).pdf"
	rm -rf "$@/out" "$@/lyrics.ltjruby"

clean:
	rm -rf out
	find src -mindepth 2 \( -name out -type d -o -name '*.ltjruby' -o -name '*.pdf' \) -exec rm -rf {} +
