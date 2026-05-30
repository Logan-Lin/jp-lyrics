# Adding a new song

1. Create the file at `src/<artist>/<song-title>/lyrics.tex`.
The artist and song-title directory names use the original Japanese.
2. Use the template below.
Title and artist go in the centered header.
Each paragraph from the source is wrapped in its own `\noindent\begin{minipage}{\linewidth} ... \end{minipage}`, separated by `\vspace{2em}`.
Within a paragraph, each line is separated by a blank line.
Initially preserve the source's line and paragraph breaks exactly as given.
Existing files under `src/` can also be referenced as examples of the document structure and conventions.
3. Annotate kanji with `\ruby{漢字}{かんじ}`.
Group readings naturally rather than per character.
For the title, ruby only the kanji that need it.
4. Compile only the new song by passing its directory as the make target.
Do not run a bare `make` since that rebuilds every song in the project.
Especially, never run a `make clean` command since it will cleanup all songs in the project while you are often only working on one song.

   ```sh
   make src/<artist>/<song-title>
   ```

5. Verify the output PDF at `out/<artist>/<song-title>.pdf` fits on one page.
Only if it overflows, compact within paragraphs, i.e., merge short related lines or drop redundant blank lines.
Beware that each line have a relatively tight maxlength due to the layout. So, if in-paragraph merge don't work since merged lines wrap, compact between paragraphs by merging paragraphs into one.

## Template

```latex
\documentclass[a4paper,tate,twocolumn,12pt]{ltjtarticle}
\usepackage{luatexja}
\usepackage{luatexja-ruby}
\usepackage[top=1cm,bottom=1cm,left=1cm,right=1cm,landscape]{geometry}

\begin{document}

\thispagestyle{empty}

% Title
\begin{center}
{\LARGE <song title with optional ruby>}

{\large <artist with optional ruby>}
\end{center}

\vspace{1em}

\begin{flushleft}

\noindent\begin{minipage}{\linewidth}
<line 1>

<line 2>
\end{minipage}

\vspace{2em}

\noindent\begin{minipage}{\linewidth}
<next paragraph>
\end{minipage}

\end{flushleft}

\end{document}
```
