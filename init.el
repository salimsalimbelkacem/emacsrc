(load "~/.emacs.d/packages.el") (setq custom-file "~/.emacs.d/custom.el")


;;; LOOKS AND FEELS ----------------

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)

(setq-default display-line-numbers-type 'relative)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq scroll-conservatively 101)
(setq make-backup-files nil)
(setq scroll-margin 10)

(spacious-padding-mode 1)

(setq spacious-padding-widths
   '(:internal-border-width 20 :header-line-width 4 :mode-line-width 6
			    :custom-button-width 3 :tab-width 4
			    :right-divider-width 30 :scroll-bar-width
			    8 :fringe-width 8))

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-10")

;;; PACKAGES? ---------------------
(setq evil-want-keybinding nil)
(setq evil-undo-system 'undo-redo)

(require 'kanagawa-themes)
(require 'evil)
(require 'evil-leader)
(require 'evil-collection)
(require 'dashboard)

(setq initial-buffer-choice 'dashboard-open)

;; theme
(load-theme 'kanagawa-dragon t)

;; dashboard splash screen
(dashboard-setup-startup-hook)

;; evil
(evil-collection-init)

(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

(evil-leader/set-key
  "e" 'dired-jump

  "gg" 'magit-status
  "gc" 'magit-commit-create
  "gC" 'magit-clone
  "gp" 'magit-push-current-to-upstream
  "gP" 'magit-pull

  "cc" 'compile
  )

(evil-mode 1)


;;; SNIPPETS, HIGHLIGHTS AND LSP ---------------
(require 'yasnippet)

(add-hook 'prog-mode-hook 'eglot-ensure)
(add-hook 'prog-mode-hook #'tree-sitter-mode)

(yas-global-mode 1)
