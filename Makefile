DIRS := $(shell find src -mindepth 2 -maxdepth 2 -type d)

.PHONY: all clean $(DIRS)

all: $(DIRS)

$(DIRS):
	cd "$@" && latexmk -lualatex -interaction=nonstopmode -outdir=out lyrics.tex
	mkdir -p "out/$(word 2,$(subst /, ,$@))"
	mv "$@/out/lyrics.pdf" "out/$(word 2,$(subst /, ,$@))/$(@F).pdf"
	rm -rf "$@/out" "$@/lyrics.ltjruby"

clean:
	rm -rf out
	find src -mindepth 3 \( -name out -type d -o -name '*.ltjruby' -o -name '*.pdf' \) -exec rm -rf {} +
