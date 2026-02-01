(load "~/.emacs.d/packages.el")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode)

(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq scroll-conservatively 101)
(setq make-backup-files nil)

(setq-default display-line-numbers-type 'relative)


(spacious-padding-mode 1)


(setq evil-want-keybinding nil)

(require 'evil)
(require 'evil-leader)
(require 'evil-collection)

(evil-collection-init)

(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

(evil-leader/set-key
  "e" 'dired-jump

  "gg" 'magit-status
  "gc" 'magit-commit
  "gC" 'magit-clone
  "gp" 'magit-push
  "gP" 'magit-pull
  )

(evil-mode 1)

(require 'kanagawa-themes)
(load-theme 'kanagawa-dragon t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-undo-system 'undo-redo)
 '(package-selected-packages
   '(elpy evil evil-collection goto-last-change kanagawa-themes lsp-mode
	  magit org-babel-eval-in-repl slime spacious-padding
	  undo-tree))
 '(spacious-padding-widths
   '(:internal-border-width 20 :header-line-width 4 :mode-line-width 6
			    :custom-button-width 3 :tab-width 4
			    :right-divider-width 30 :scroll-bar-width
			    8 :fringe-width 8))
 '(warning-suppress-log-types '((native-compiler))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
