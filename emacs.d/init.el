;; <Alt> to Super and <Cmd> to Meta.
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; UTF-8 by default
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; Get rid of the start screen
(setq inhibit-startup-message t)

;; Backup-file stuff
(setq backup-by-copying      t                      ; don't clobber symlinks
      backup-directory-alist '(("." . "~/.saves/")) ; don't litter my fs tree
      delete-old-versions    t
      kept-new-versions      6
      kept-old-versions      2
      version-control        t)

;; Make the UI cleaner
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; "Natural title bar"
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist
             '(ns-appearance . dark)) ;; or dark - depending on your theme

;; Don't indent with tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Auto reload files from disk
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(use-package org
  :ensure t
  :config
  (setq org-ellipsis "↴")
  (use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll  t
        evil-want-integration nil)

  :config
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>"))
  (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-escape
    :ensure t
    :config
    (evil-escape-mode)
    (setq-default evil-escape-key-sequence "jk"))
  (use-package evil-collection
    :ensure t
    :config
    (evil-collection-init)))

(use-package expand-region
  :ensure t
  :defer t
  :init (evil-leader/set-key "v" 'er/expand-region)
  :config
  (setq expand-region-contract-fast-key "V"
	expand-region-reset-fast-key "r"))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

(use-package avy
  :ensure t
  :bind
  ("C-:"   . 'avy-goto-char)
  ("C-'"   . 'avy-goto-char-2)
  ("M-g f" . 'avy-goto-line))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :bind ("M-/" . 'company-complete-common-or-cycle)
  :config (setq company-idle-delay 0))

;; "All the icons"
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config (setq flycheck-check-syntax-automatically
                '(mode-enabled idle-change save)))

(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'lsp-mode)
  :config
  (use-package lsp-flycheck
    :ensure f
    :after flycheck))

(use-package lsp-rust
  :ensure t
  :after lsp-mode
  :init
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  :config
  (add-hook 'rust-mode-hook #'lsp-rust-enable)
  (add-hook 'rust-mode-hook #'flycheck-mode))

(use-package flycheck-rust
  :ensure t
  :after lsp-rust
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package cquery
  :ensure t
  :after lsp-mode
  :config
  (setq cquery-executable "/usr/local/bin/cquery"))

(use-package auctex
  :ensure t)

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package magit
  :ensure t
  :config
  (use-package evil-magit
    :ensure t
    :config
    (setq evil-magit-state 'normal)))

;; Proof-general
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; Haskell
(use-package haskell-mode
  :ensure t)

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

;; (use-package liquid-types
;;   :ensure t
;;   :config
;;   (add-hook 'haskell-mode-hook
;;             '(lambda () (flycheck-select-checker 'haskell-liquid)))
;;   (add-hook 'literate-haskell-mode-hook
;;             '(lambda () (flycheck-select-checker 'haskell-liquid)))
;;   (require 'liquid-types)
;;   (add-hook 'haskell-mode-hook
;;             '(lambda () (liquid-types-mode)))
;;   (add-hook 'literate-haskell-mode-hook
;;             '(lambda () (liquid-types-mode))))

;; Idris
(use-package idris-mode
  :ensure t)

;; 80-char rule
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; Markdown Mode
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

(use-package hledger-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))
  (setq hledger-jfile "/Users/anrddh/Documents/Finance/Main.journal"))

;; FISH
(use-package fish-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-rust projectile idris-mode intero haskell-mode evil-magit magit hungry-delete auctex cquery lsp-rust f lsp-mode flycheck company-box company avy counsel expand-region evil-collection evil-escape evil-surround evil-leader evil which-key try dracula-theme exec-path-from-shell org-bullets use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
