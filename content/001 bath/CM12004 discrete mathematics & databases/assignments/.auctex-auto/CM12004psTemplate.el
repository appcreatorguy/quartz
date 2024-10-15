;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "CM12004psTemplate"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("amsmath" "") ("enumerate" "") ("enumitem" "shortlabels")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "amsmath"
    "enumerate"
    "enumitem"))
 :latex)

