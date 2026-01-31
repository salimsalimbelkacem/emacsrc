(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'kanagawa-themes)
  (package-install 'kanagawa-themes))

(setq evil-undo-system 'undo-redo)
(require 'evil)
(evil-mode 1)

(require 'kanagawa-themes)
(load-theme 'kanagawa-wave t)


;(setq python-shell-interpreter "ipython"
;    python-shell-interpreter-args "-i --simple-prompt")

;(org-babel-do-load-languages 'org-babel-load-languages '((python . t)))

;(setq org-babel-python-command "ipython --simple-prompt")

;(require 'ob-python)
;(setq org-babel-python-command "ipython")
