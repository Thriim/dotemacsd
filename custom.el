;;; package --- Customization for emacs
;;; Commentary:
;; Global customization should be made with M-x customize-variable/face
;; so everything can be found in this file
;;;
;; If there is any question about what these variables/faces do just
;; M-x customize-variable/face <ret> name_of_the_variable/face and see the doc
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(auth-sources '("~/.authinfo"))
 '(blink-cursor-mode t)
 '(calendar-month-abbrev-array
   ["Jan" "Fév" "Mar" "Avr" "Mai" "Jun" "Jul" "Aoû" "Sep" "Oct" "Nov" "Déc"])
 '(completion-ignored-extensions (remove ".git/" completion-ignored-extensions))
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application eshell) eshell-connection-default-profile)
     ((:application tramp) tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97
                               (tramp-kubernetes--container
                                (car tramp-current-connection))
                               104
                               (tramp-kubernetes--pod
                                (car tramp-current-connection))
                               120
                               (tramp-kubernetes--context-namespace
                                (car tramp-current-connection))))
     (eshell-connection-default-profile (eshell-path-env-list))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                          (user . string) (egid . number)
                                          (comm . 52) (state . 5)
                                          (ppid . number) (pgrp . number)
                                          (sess . number) (ttname . string)
                                          (tpgid . number) (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time) (pri . number)
                                          (nice . number) (vsize . number)
                                          (rss . number) (etime . tramp-ps-time)
                                          (pcpu . number) (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number) (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number) (ttname . string)
                                          (time . tramp-ps-time) (nice . number)
                                          (etime . tramp-ps-time) (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                          (user . string) (egid . number)
                                          (group . string) (comm . 52)
                                          (state . string) (ppid . number)
                                          (pgrp . number) (sess . number)
                                          (ttname . string) (tpgid . number)
                                          (minflt . number) (majflt . number)
                                          (time . tramp-ps-time) (pri . number)
                                          (nice . number) (vsize . number)
                                          (rss . number) (etime . number)
                                          (pcpu . number) (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile (shell-file-name . "/bin/sh")
                                                   (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile (path-separator . ":")
                                                    (null-device . "/dev/null"))))
 '(cursor-intangible-mode t t)
 '(cursor-type t)
 '(custom-safe-themes
   '("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8"
     "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350"
     "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561"
     "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25"
     "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00"
     "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee"
     "0fe24de6d37ea5a7724c56f0bb01efcbb3fe999a6e461ec1392f3c3b105cc5ac"
     "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4"
     "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3"
     "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" default))
 '(describe-char-unidata-list
   '(name old-name general-category decomposition decimal-digit-value digit-value
          numeric-value))
 '(doom-modeline-bar-width 4)
 '(doom-modeline-height 12)
 '(doom-modeline-window-width-limit 80)
 '(doom-themes-enable-bold t)
 '(doom-themes-enable-italic t)
 '(eaf-browser-blank-page-url "https://duckduckgo.com/")
 '(electric-indent-mode t)
 '(fill-column 80)
 '(flycheck-languagetool-server-jar
   (concat (getenv "HOME") "/.emacs.d/LanguageTool-6.1/languagetool-server.jar"))
 '(hl-todo-keyword-faces
   '(("TODO" warning bold) ("FIXME" error bold)
     ("REVIEW" font-lock-keyword-face bold)
     ("DEPRECATED" font-lock-doc-face bold) ("NOTE" success bold)
     ("XXXX*" font-lock-constant-face bold)))
 '(lsp-auto-guess-root nil)
 '(lsp-file-watch-threshold 50000)
 '(lsp-java-completion-lazy-resolve-text-edit-enabled t)
 '(lsp-java-format-enabled nil)
 '(magit-diff-refine-hunk 'all)
 '(mini-frame-color-shift-step 10)
 '(mini-frame-show-parameters
   '((left . 0.5) (top . 0.3) (width . 0.6) (height . 1)
     (child-frame-border-width . 2)))
 '(mode-line-right-align-edge 'right-fringe)
 '(org-export-backends '(ascii html icalendar latex md odt pandoc))
 '(package-selected-packages nil)
 '(pokemacs-columns 4)
 '(pokemacs-dict "en-GB")
 '(pokemacs-mono-font "Fira Code" t)
 '(pokemacs-repeat-timeout 0.5)
 '(pokemacs-dark-theme 'doom-nord t)
 '(pokemacs-layout-columns 3)
 '(pokemacs-light-theme 'doom-nord-light t)
 '(pokemacs-mode-line-right-align 'right-fringe t)
 '(pokemacs-variable-font "Fira Code" t)
 '(proced-enable-color-flag t)
 '(rustic-cargo-check-arguments "--benches --tests")
 '(safe-local-variable-values
   '((lsp-rust-analyzer-linked-projects . ["etherlink/kernel_evm/Cargo.toml"])
     (lsp-rust-analyzer-linked-projects . ["src/kernel_evm/Cargo.toml"])
     (lsp-rust-analyzer-linked-projects . ["src/kernel_evm"])
     (lsp-rust-analyzer-linked-projects
      . ["src/kernel_evm/Cargo.toml" "src/kernel_sdk/Cargo.toml"])
     (lsp-rust-analyzer-cargo-watch-args . ["--all-features"])
     (rustic-compile-directory-method . rustic-buffer-workspace)
     (rustic-compile-command . "make")
     (projectile-project-root-functions projectile-root-top-down
                                        projectile-root-bottom-up
                                        projectile-root-top-down-recurring)))
 '(sh-basic-offset 2)
 '(show-paren-priority -50)
 '(show-paren-style 'mixed)
 '(split-height-threshold nil)
 '(tuple-mono-font
   (if (window-system)
       (cond ((x-list-fonts pokemacs-mono-font) `(:font ,pokemacs-mono-font))
             ((x-list-fonts "Fira Code") '(:font "Fira Code"))
             ((x-list-fonts "Inconsolata") '(:font "Inconsolata"))
             ((x-family-fonts "DejaVu") '(:family "DejaVu"))
             (nil (warn "Cannot find a monospaced font.")))
     '(:family "Monospace")) t)
 '(tuple-variable-font
   (if (window-system)
       (cond
        ((x-list-fonts pokemacs-variable-font) `(:font ,pokemacs-variable-font))
        ((x-list-fonts "Iosevka Aile") '(:font "Iosevka Aile"))
        ((x-list-fonts "ETBembo") '(:font "ETBembo"))
        ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
        ((x-list-fonts "Lucida Grande") '(:font "Lucida Grande"))
        ((x-list-fonts "Verdana") '(:font "Verdana"))
        ((x-family-fonts "Sans Serif") '(:family "Sans Serif"))
        (nil (warn "Cannot find a Sans Serif Font.")))
     '(:family "Monospace")) t)
 '(use-all-the-icons nil)
 '(use-clojure nil)
 '(use-dashboard t)
 '(use-eaf nil)
 '(use-elm t)
 '(use-fsharp t)
 '(use-gcal nil)
 '(use-god nil)
 '(use-header-line nil)
 '(use-java nil)
 '(use-kotlin t)
 '(use-latex nil)
 '(use-magit-todos nil)
 '(use-markdown t)
 '(use-maximize nil)
 '(use-michelson nil)
 '(use-mu4e nil)
 '(use-ocaml t)
 '(use-org-agenda-startup nil)
 '(use-org-roam t)
 '(use-pandoc t)
 '(use-posframe t)
 '(use-python t)
 '(use-racket nil)
 '(use-rainbow nil)
 '(use-reason nil)
 '(use-ruby nil)
 '(use-rust t)
 '(use-sicp nil)
 '(use-solaire t)
 '(use-spotify nil)
 '(use-treemacs nil)
 '(use-visual-fill nil)
 '(use-web t)
 '(use-window-purpose t)
 '(vertico-multiform-categories
   '((imenu buffer)
     (file (vertico-sort-function . sort-directories-first))
     (corfu (vertico-sort-function . vertico-sort-alpha))
     (jinx grid (vertico-grid-annotate . 20))
     (symbol (vertico-sort-function . vertico-sort-history-length-alpha))))
 '(vertico-multiform-commands
   '((consult-imenu buffer)
     (consult-line buffer)
     (execute-extended-command mouse)
     (find-file (vertico-sort-function . sort-directories-first))
     (insert-char (vertico-sort-function . sort-characters))
     (describe-symbol (vertico-sort-override-function . vertico-sort-alpha))))
 '(warning-suppress-types '((flycheck syntax-checker) (treesit) (comp)))
 '(vertico-posframe-width 160 nil nil "Customized with use-package vertico-posframe")
 '(warning-suppress-types '((flycheck syntax-checker) (treesit) (lsp-mode) (comp)))
 '(x-stretch-cursor nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 `(default ((t (,@tuple-mono-font :slant normal :weight normal :height 90 :width normal :foundry "CTDB"))))
 `(fixed-pitch ((t (,@tuple-mono-font :slant normal :weight normal :height 100 :width normal :foundry "CTDB"))))
 `(lsp-lens-face ((t (,@tuple-mono-font :foundry "CTDB" :inherit lsp-details-face))))
 '(menu ((t (:inherit mode-line))))
 '(mode-line ((t :inherit fixed-pitch)))
 `(mode-line-inactive ((nil ,@tuple-mono-font)))
 '(secondary-selection   ((t (:inherit region))))
 '(show-paren-match ((t (:background unspecified :foreground "#bf616a"))))
 `(variable-pitch ((t (,@tuple-variable-font :weight light :height 1.3)))))

(provide 'custom)
;;; custom.el ends here
