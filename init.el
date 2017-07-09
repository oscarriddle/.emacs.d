;; ==========================================================================
;; init.el --- Emacs major lisps configuration for preference 
;; Author: Xiaolun Cao <xiaolun.cao@gmail.com> <https://github.com/oscarridder>
;; Keywords: init.el
;; Maintainer: Xiaolun Cao <xiaolun.cao@gmail.com> <https://github.com/oscarridder>
;; Created: July 9, 2017

;; This program is inspired by multiple contributors:
;; > Yuseke Ujitoko <https://github.com/Ujitoko>
;; > Steve Purcell <https://github.com/purcell>
;; > Guillaume Papin <https://github.com/Sarcasm>
;; > etc.
;; integrated and modificated by Xiaolun Cao for persenal preference.
;; You can redistribute it and/or modify it under the terms of the
;; GNU General Public License as published by the Free Software Foundation,
;; either version 3 of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; Main Packages Support:
;; > quickrun
;; > auto-complete
;; > flycheck
;; > sublime-themes
;; > helm
;; > melpa
;; > irony-mode
;; > minimap
;; > markdown-mode
;; > ctags
;; ==========================================================================

;;package-installation
;;Adding packages MELPA, MELPA-stable, Marmalade, Org
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/#/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;;load-path setting
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;;Add more directories to load-path
(add-to-load-path "lisps" "elpa")

;;Packages Installation Automatically
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/lisps/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

;;Setting up UTF-8 code system
(set-language-environment "utf-8")
(prefer-coding-system 'utf-8)

;;Keyboard Transaltion:
(keyboard-translate ?\C-h ?\C-?) ;; Backspace->"Ctrl-h"

;; Switching Buffer by "Ctrl-t"
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;;Don't express the startup message
(setq inhibit-startup-message t)

;;Don't create the backup files
(setq make-backup-files nil)

;;Show column number
(column-number-mode t)

;;Show line number
(global-linum-mode t)
(setq linum-format "%4d")

;;Highlighting the Matching ()
(show-paren-mode 1)

;;Visible SPACE and TAB
;;(global-whitespace-mode 1)

;;Substitute "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; unvisualize menubar, toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

;;One-line-comment out: "M-x one-line-comment"
(defun one-line-comment ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (comment-or-uncomment-region (region-beginning) (region-end))))
(global-set-key (kbd "M-;") 'one-line-comment)

;; Auto Complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)       ;; Select candidates by "Ctrl-n/p"
(setq ac-use-fuzzy t)          ;; Fuzzy matching

;; DEFAULT Theme: sanityinc-tomorrow-bright
(load-theme 'sanityinc-tomorrow-bright t) ;; NO_CONFIRM parametered

;; Implement markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'gfm-mode "gfm-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;;Company Setting
(require 'company)
(global-company-mode) ;;Globally activation
(setq company-idle-delay 0) ;;Default as 0.5
(setq company-minimum-prefix-length 2) ;;Minimum prefix length 2
(setq company-selection-wrap-around t) 

;; irony-mode setting
(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)

;;for ctags.el
(require 'ctags nil t)
(setq tags-revert-without-query t)
(setq ctags-command "ctags -R --fields=\"+afikKlmnsSzt\" ")
(global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)
(global-set-key (kbd "M-.") 'ctags-search)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-irony flycheck-irony irony sublime-themes minimap ctags company auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
