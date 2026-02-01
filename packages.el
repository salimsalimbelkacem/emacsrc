(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(unless (package-installed-p 'kanagawa-themes)
  (package-install 'kanagawa-themes))

(unless (package-installed-p 'magit)
  (package-install 'magit))

(unless (package-installed-p 'spacious-padding)
  (package-install 'spacious-padding))

(unless (package-installed-p 'tree-sitter)
  (package-install 'tree-sitter))

(unless (package-installed-p 'tree-sitter-langs)
  (package-install 'tree-sitter-langs))

(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(unless (package-installed-p 'yasnippet-snippets)
  (package-install 'yasnippet-snippets))
