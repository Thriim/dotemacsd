;;; mdrp-ocaml.el --- -*- lexical-binding: t -*-

;; Copyright (c) 2020-2020 mdrp and contributors.

;; Author: mdrp
;; Maintainer: mdrp <https://github.com/MonsieurPi>
;; Version: 1.0
;; Licence: GPL2+
;; Keywords: convenience, configuration

;;; License:

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(use-package tuareg
  :config
  ;; tuareg-mode has the prettify symbols itself
  ;; (ligature-set-ligatures 'tuareg-mode '(tuareg-prettify-symbols-basic-alist))
  ;; (ligature-set-ligatures 'tuareg-mode '(tuareg-prettify-symbols-extra-alist))
  ;; harmless if `prettify-symbols-mode' isn't active
  ;; (setq tuareg-prettify-symbols-full t)

  ;; Use opam to set environment
  (setq tuareg-opam-insinuate t)
  (setq tuareg-electric-indent t)

  (tuareg-opam-update-env (tuareg-opam-current-compiler))
  (add-hook
   'tuareg-mode-hook
   (lambda ()
     ;; Commented symbols are actually prettier with ligatures or just ugly
     (setq prettify-symbols-alist
           '(
             ("sqrt" . ?√)
             ("&&" . ?⋀)        ; 'N-ARY LOGICAL AND' (U+22C0)
             ("||" . ?⋁)        ; 'N-ARY LOGICAL OR' (U+22C1)
             ;; ("+." . ?∔)        ;DOT PLUS (U+2214)
             ;; ("-." . ?∸)        ;DOT MINUS (U+2238)
             ;; ("*." . ?×)
             ;; ("*." . ?•)   ; BULLET OPERATOR
             ;; ("/." . ?÷)
             ;; ("<-" . ?←)
             ;; ("<=" . ?≤)
             ;; (">=" . ?≥)
             ("<>" . ?≠)
             ;; ("==" . ?≡)
             ;; ("!=" . ?≢)
             ;; ("<=>" . ?⇔)
             ;; ("infinity" . ?∞)
             ;; Some greek letters for type parameters.
             ("'a" . ?α)
             ("'b" . ?β)
             ("'c" . ?γ)
             ("'d" . ?δ)
             ("'e" . ?ε)
             ("'f" . ?φ)
             ("'i" . ?ι)
             ("'k" . ?κ)
             ("'m" . ?μ)
             ("'n" . ?ν)
             ("'o" . ?ω)
             ("'p" . ?π)
             ("'r" . ?ρ)
             ("'s" . ?σ)
             ("'t" . ?τ)
             ("'x" . ?ξ)
             ("fun" . ?λ)
             ("not" . ?¬)
             ;; ("[|" . ?〚)        ;; 〚
             ;;  ("|]" . ?⟭)        ;; 〛
             ;; ("->" . ?→)
             (":=" . ?⇐)
             ;; ("::" . ?∷))
             )
           )
     )
   )
  )

(use-package opam-user-setup
  :after tuareg
  :load-path "custom/"
  :config (ignore "Loaded 'flycheck-popup")
  )

;; (use-package utop
;;   :after tuareg
;;   :config
;;   (utop-minor-mode 1))

(use-package merlin
  :hook ((tuareg-mode . merlin-mode)
         (merlin-mode . company-mode))
  :custom
  (merlin-error-after-save nil)
  (merlin-completion-with-doc t)
  :config
  (add-to-list 'company-backends 'merlin-company-backend)
)

(use-package flycheck-ocaml
  :hook (merlin-mode . +ocaml-init-flycheck-h)
  :config
  (defun +ocaml-init-flycheck-h ()
    "Activate `flycheck-ocaml`"
    ;; Enable Flycheck checker
    (flycheck-ocaml-setup)))

(use-package merlin-eldoc
  :hook (merlin-mode . merlin-eldoc-setup)
  :custom
  (eldoc-echo-area-use-multiline-p t) ; use multiple lines when necessary
  (merlin-eldoc-max-lines 8)          ; but not more than 8)
  )

(use-package merlin-imenu
  :hook (merlin-mode . merlin-use-merlin-imenu))

(use-package ocp-indent
  ;; must be careful to always defer this, it has autoloads that adds hooks
  ;; which we do not want if the executable can't be found
  :hook (tuareg-mode-local-vars . +ocaml-init-ocp-indent-h)
  :config
  (defun +ocaml-init-ocp-indent-h ()
    "Run `ocp-setup-indent', so long as the ocp-indent binary exists."
    (when (executable-find "ocp-indent")
      (ocp-setup-indent))))

(use-package dune-mode
  :mode ("dune" "dune-project")
  )

(provide 'mdrp-ocaml)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mdrp-ocaml.el ends here
