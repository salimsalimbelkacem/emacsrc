(setq custom-file "~/.emacs.d/custom.el")

;;; PACKAGES -----------------------
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(setq package-selected-packages
      '(evil
	evil-leader
	evil-collection

	magit

	kanagawa-themes
	spacious-padding
	dashboard

	which-key

	tree-sitter-langs

	treemacs

	lsp-mode
	lsp-treemacs
	lsp-ui

	company

	yasnippet
	yasnippet-snippets

	flycheck
	))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;;; LOOKS AND FEELS ----------------
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(electric-pair-mode)

(setq-default display-line-numbers-type 'relative)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq scroll-conservatively 101)
(setq make-backup-files nil)
(setq scroll-margin 10)

(set-face-attribute 'fill-column-indicator nil
                      :foreground "#717C7C"
                      :background "transparent")

(spacious-padding-mode 1)

(setq spacious-padding-widths
      '(:internal-border-width 20
	:header-line-width 4
	:mode-line-width 6
	:custom-button-width 3 
	:tab-width 4
	:right-divider-width 30
	:scroll-bar-width 8
	:fringe-width 8))

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-10")

;;; PACKAGES CONFIG ---------------------
(setq evil-want-keybinding nil)
(setq evil-undo-system 'undo-redo)
(setq initial-buffer-choice 'dashboard-open)

(require 'evil)
(require 'evil-leader)
(require 'evil-collection)
(require 'dashboard)

;; theme
(load-theme 'kanagawa-dragon t)

;; dashboard splash screen
(dashboard-setup-startup-hook)

;; evil
(evil-collection-init)

(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

(evil-leader/set-key
  "e" 'treemacs

  "gg" 'magit-status
  "gc" 'magit-commit-create
  "gC" 'magit-clone
  "gp" 'magit-push-current-to-upstream
  "gP" 'magit-pull

  "cc" 'compile

  "t" 'tetris
  )

(evil-mode 1)
(which-key-mode)

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn (setq treemacs-position 'right)))

;;; SNIPPETS, HIGHLIGHTS AND LSP ---------------
(setq lsp-warn-no-matched-clients nil)

(setq company-backends
      '((company-capf company-yasnippet)
        company-files
        company-dabbrev))
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.1)
(global-company-mode)

(setq major-mode-remap-alist
      '((c-mode           . c-ts-mode)
        (c++-mode         . c++-ts-mode)
        (go-mode          . go-ts-mode)
        (java-mode        . java-ts-mode)
        (python-mode      . python-ts-mode)
        (js-mode          . js-ts-mode)
        (typescript-mode  . typescript-ts-mode)
        (json-mode        . json-ts-mode)
        (css-mode         . css-ts-mode)
        ))
(add-hook 'prog-mode-hook 'tree-sitter-hl-mode)

(add-hook 'prog-mode-hook #'lsp)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))

