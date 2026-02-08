(setq custom-file "~/.emacs.d/custom.el")

;;; PACKAGES -----------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(setq package-selected-packages
      '(
	evil evil-leader evil-collection

	magit

	kanagawa-themes
	spacious-padding
	dashboard

	treemacs
	lsp-mode lsp-treemacs lsp-ui

	tree-sitter-langs

	company
	yasnippet yasnippet-snippets

	flycheck

	websocket
	typst-preview

	olivetti
	org-superstar
	org-modern
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

(setq
 create-lockfiles nil
 auto-save-default nil
 scroll-conservatively 101
 make-backup-files nil
 scroll-margin 10
 which-key-idle-delay 0.5
 dired-listing-switches "-alhv"
 )

(setq spacious-padding-widths
      '(:internal-border-width 20
	:header-line-width 4
	:mode-line-width 6
	:custom-button-width 3
	:tab-width 4
	;:right-divider-width 30
	:scroll-bar-width 8
	:fringe-width 8))

(spacious-padding-mode 1)

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-10")

(which-key-mode)

(load-theme 'kanagawa-wave t)

(set-frame-parameter nil 'alpha-background 80)

(add-to-list 'default-frame-alist '(alpha-background . 85))

(dashboard-setup-startup-hook)

;;; PACKAGES CONFIG ---------------------
(setq
 evil-want-keybinding nil
 evil-undo-system 'undo-redo

 initial-buffer-choice 'dashboard-open
 )

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

  "c" 'compile

  "t" 'tetris

  "oc" #'org-capture
  "oa" #'org-agenda
  "ol" #'org-store-link

  "x" 'lsp-treemacs-errors-list

  "f" 'find-file
  "w" 'save-buffer
  )

(evil-global-set-key 'normal "gc" 'comment-line)
(evil-global-set-key 'visual "gc" 'comment-line)

(evil-mode 1)

;;; SNIPPETS, HIGHLIGHTS AND LSP ---------------
(setq lsp-warn-no-matched-clients nil 

      company-backends '((company-capf company-yasnippet)
			 company-files
			 company-dabbrev)

      company-minimum-prefix-length 1
      company-idle-delay 0.1
      )

(setq major-mode-remap-alist
      '((c-mode           . c-ts-mode)
        (c++-mode         . c++-ts-mode)
        (go-mode          . go-ts-mode)
        (java-mode        . java-ts-mode)
        (python-mode      . python-ts-mode)
        (js-mode          . js-ts-mode)
        (typescript-mode  . typescript-ts-mode)
        (json-mode        . json-ts-mode)
        (css-mode         . css-ts-mode)))

(global-company-mode)
(add-hook 'prog-mode 'lsp)
(with-eval-after-load 'lsp
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode)
  (flycheck-mode))

;;; org mode -----------------------------------

(setq
 org-agenda-files '("~/org")
 org-hide-emphasis-markers t

 olivetti-margin-width 0
 olivetti-body-width 140

 org-adapt-indentation t
 org-hide-leading-stars t
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "  ·"

 org-modern-tag nil
 org-modern-priority nil
 org-modern-todo nil
 org-modern-table nil

 org-capture-templates '(    
			 ("u" "unimportant list"
			  entry (file "~/org/not_important.org")
			  "* TODO [#B] %?\n:"
			  :empty-lines 0)
			 
			 ("g" "general notes"
			  entry (file+datetree "~/org//general.org")
			  "* %?"
			  :empty-lines 0)

			 ("t" "general todos"
			  entry (file+datetree "~/org/general.org")
			  "* TODO [#B] %?\n:"
			  :empty-lines 0))

 org-todo-keywords '(
		     (sequence "TODO(t)" "IN-PROGRESS(i@/!)"
			       "VERIFYING(v!)" "BLOCKED(b@)"  "|"
			       "DONE(d!)" "WONT-DO(w@/!)"))
 )

(global-org-modern-mode)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'olivetti-mode)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
