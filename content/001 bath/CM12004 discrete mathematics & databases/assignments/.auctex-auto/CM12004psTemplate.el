;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "CM12004psTemplate"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("amsmath" "") ("amssymb" "") ("amsthm" "") ("enumerate" "") ("enumitem" "shortlabels")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "amsmath"
    "amssymb"
    "amsthm"
    "enumerate"
    "enumitem")
   (TeX-add-symbols
    "lnand"
    "lnor"))
 :latex)

