;;; mdrp-fsharp.el --- -*- lexical-binding: t -*-

;; Copyright (c) 2020-2020 mdrp and contributors.

;; Author: mdrp
;; Maintainer: mdrp <https://github.com/mattiasdrp>
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

(when use-fsharp
  (use-package fsharp-mode
    :init
    (add-to-list 'exec-path (concat (getenv "HOME") "/.dotnet"))
    (add-to-list 'exec-path (concat (getenv "HOME") "/.dotnet/tools"))
    (setenv "PATH"
            (concat
             (concat (getenv "HOME") "/.dotnet")
             ":"
             (concat (getenv "HOME") "/.dotnet/tools")
             ":"
             (getenv "PATH")))
    :defer t
    :ensure t))

(provide 'mdrp-fsharp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; mdrp-fsharp.el ends here
