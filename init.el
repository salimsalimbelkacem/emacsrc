(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq scroll-conservatively 101)
(setq make-backup-files nil)

(setq-default display-line-numbers-type 'relative)

(global-display-line-numbers-mode)

(load "~/.emacs.d/packages.el")

(load "~/.emacs.d/evil-leader.el")
(load "~/.emacs.d/evil-numbers.el")



(require 'evil-numbers.el)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elpy evil goto-last-change kanagawa-themes lsp-mode magit
	  org-babel-eval-in-repl slime undo-tree))
 '(warning-suppress-log-types '((native-compiler))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
