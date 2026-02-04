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

	company
	yasnippet yasnippet-snippets

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

(setq which-key-idle-delay 0.5)

(which-key-mode)

(load-theme 'kanagawa-wave t)

(set-frame-parameter nil 'alpha-background 80)

(add-to-list 'default-frame-alist '(alpha-background . 85))

(dashboard-setup-startup-hook)

;;; PACKAGES CONFIG ---------------------
(setq evil-want-keybinding nil)
(setq evil-undo-system 'undo-redo)
(setq initial-buffer-choice 'dashboard-open)

(require 'evil)
(require 'evil-leader)
(require 'evil-collection)

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

  "t" 'tetris

  "oc" #'org-capture
  "oa" #'org-agenda
  "ol" #'org-store-link

  "x" 'lsp-treemacs-errors-list

  "f" 'find-file
  )

(evil-global-set-key 'normal "gc" 'comment-line)
(evil-global-set-key 'visual "gc" 'comment-line)

(evil-mode 1)

;;; SNIPPETS, HIGHLIGHTS AND LSP ---------------
(setq lsp-warn-no-matched-clients nil)

(setq company-backends
      '((company-capf company-yasnippet)
        company-files
        company-dabbrev))
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.1)
(global-company-mode)

(flycheck-mode)

(add-hook 'prog-mode-hook #'lsp)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))


;;; org mode -----------------------------------

(setq org-agenda-files '("~/org"))
(setq org-hide-emphasis-markers t)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-capture-templates
      '(    
	("g" "unimportant list"
	 entry (file+headline "~/org/not_important.org" "yaeh")
	 "** %?"
	 :empty-lines 0)
	
	("u" "university")
	("ug" "general notes"
	 entry (file+datetree "~/org/uni/s2/general.org")
	 "* %?"
	 :empty-lines 0)
	("uc" "crypto")
	("ucn" "crypto notes"
	 entry (file+datetree "~/org/uni/s2/crypto.org")
	 "* %?"
	 :empty-lines 0)
	("usct" "crypto tasks"
	 entry (file+datetree "~/org/uni/s2/crypto.org")
	 "* TODO [#B] %?\n:"
	 :empty-lines 0)

	("uv" "computer vision")
	("uvn" "computer vision notes"
	 entry (file+datetree "~/org/uni/s2/computer_vision.org")
	 "** %?"
	 :empty-lines 0)

	("uvt" "computer vision tasks"
	 entry (file+datetree "~/org/uni/s2/computer_vision.org")
	 "* TODO [#B] %?\n:"
	 :empty-lines 0)
	))

(setq org-todo-keywords
      '((sequence "TODO(t)"  "IN-PROGRESS(i@/!)" "VERIFYING(v!)" "BLOCKED(b@)"  "|" "DONE(d!)" "WONT-DO(w@/!)" )))
