# RMarkdown templates for the lab


テンプレートが増えれば，ここに追加します。

そのままテンプレートをつかうと，図の位置は Latex に任せられます。
確実に，図の位置を固定したいのであれば，作業フォルダにつぎの内容の
tex ファイルを作ってください (参考リンク：<https://stackoverflow.com/a/33801326>)。

```
\usepackage{float}
\let\origfigure\figure
\let\endorigfigure\endfigure
\renewenvironment{figure}[1][2] {
    \expandafter\origfigure\expandafter[H]
} {
    \endorigfigure
}
```

ファイル名を `force-figure-position.tex` にした場合，RMarkdown ファイルの
YAMLの `output` の部分を次のように，変えてください。

**Before:**

```
output: 
  bookdown::pdf_document2:
    latex_engine: xelatex
    dev: cairo_pdf
    keep_tex: yes
    citation_package: biblatex
    toc: true
    toc_depth: 3
documentclass: bxjsarticle
```

**After:**

```
output: 
  bookdown::pdf_document2:
    latex_engine: xelatex
    dev: cairo_pdf
    keep_tex: yes
    citation_package: biblatex
    toc: true
    toc_depth: 3
    includes:
      in-header: force-figure-position.tex
documentclass: bxjsarticle
```


greg
