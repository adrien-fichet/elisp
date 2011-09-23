;; Prise en compte du fichier de configuration personnalisé (init.el) :
;; Insérer la ligne suivante dans le fichier ~/.emacs :
;; (load "~/elisp/init.el")
;; Ou remplacer le fichier ~/.emacs par un lien symbolique vers ~/elisp/init.el

;; Répertoire perso
(add-to-list 'load-path "~/elisp")

;; Encodage des caractères en UTF-8
(set-language-environment "UTF-8")

;; Configuration de l'apparence
(set-background-color "black")
(set-foreground-color "gray80")
(set-cursor-color "gray80")

;; Fenêtre transparente
(set-frame-parameter (selected-frame) 'alpha '(90 50))
(add-to-list 'default-frame-alist '(alpha 90 50))

;; Indentation automatique de 4 espaces
(setq standard-indent 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Scrolling ligne par ligne
(setq scroll-step 1)

;; Pas de fichiers de sauvegarde
(setq make-backup-files nil)

;; Indication du numéro de ligne et de colonne
(line-number-mode 1)
(column-number-mode 1)

;; Largeur d'indentation des paragraphes
(setq auto-fill-mode -1)
(setq-default fill-column 72)

;; Raccourcis claviers persos (C-c suivi d'une seule lettre)
(global-set-key (kbd "C-c b") 'ecb-toggle-ecb-windows)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c e") 'eval-buffer)
(global-set-key (kbd "C-c g") 'gdb)
(global-set-key (kbd "C-c k") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c o") 'buffer-menu-other-window)
(global-set-key (kbd "C-c p") 'clipboard-yank)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c t") 'ansi-term)
(global-set-key (kbd "C-c v") 'virtualenv-workon)
(global-set-key (kbd "C-c w") 'webjump)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

;; Scrolling de la fenêtre en entier
(require 'view)
(global-set-key (kbd "M-n") 'View-scroll-line-forward)
(global-set-key (kbd "M-p") 'View-scroll-line-backward)

;; Suppression des éléments d'interface inutiles
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Désactivation du bip
(setq ring-bell-function 'ignore)

;; Affichage de l'heure et de la date
(setq display-time-24hr-format t)
(display-time-mode t)
(setq display-time-day-and-date 1)

;; Affichage du numéro des lignes dans la marge gauche
(require 'linum)
(global-linum-mode t)

;; PHP Mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Code snippets
(add-to-list 'load-path "~/elisp/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/elisp/yasnippet-0.6.1c/snippets")

;; Python mode
(add-to-list 'load-path "~/elisp/python-mode/")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; AucTeX
;; (load "auctex.el" nil t t)
;; (setq TeX-PDF-mode t)
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; Pymacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;; Ropemacs
;; (pymacs-load "ropemacs" "rope-")

;; Web Browser intégré (w3m)
(load "w3m-el-snapshot")
(add-to-list 'load-path "~/elisp/w3m")
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(setq w3m-use-cookies t)
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

;; Bookmarks webjump
(require 'webjump)
(setq webjump-sites
      (append '(
                ("Python". "python.org")
                ("Python Documentation" . "docs.python.org/modindex.html")
                ("Emacs Wiki" . "emacswiki.org")
                ("Qt Documentation" .
                 "http://doc.qt.nokia.com/4.7/classes.html")
                )
              webjump-sample-sites))

;; Virtualenv
(require 'virtualenv)

;; Org mode
(require 'org)

;; Indication des lignes de plus de 80 caractères
(require 'whitespace)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

;; CEDET
(add-to-list 'load-path "~/elisp/cedet-1.0/common/")
(require 'cedet)
(global-ede-mode 1)

;; ECB
(add-to-list 'load-path "~/elisp/ecb-2.40/")
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)
(ecb-activate)

;; Configurations personnalisées
(custom-set-variables '(ecb-options-version "2.40"))
(custom-set-faces)

;; CSS mode
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
     (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(setq cssm-indent-function #'cssm-c-style-indenter)

;; Debug mode
(setq debug-on-error nil)

;; Auto complétion
(add-to-list 'load-path "~/elisp/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/elisp/auto-complete-1.3.1/dict")
(ac-config-default)

;; Personnalisation des buffers au démarrage
(setq initial-scratch-message ";;                _\n;; __      ____ _| |_\n;; \\ \\ /\\ / / _` | __|\n;;  \\ V  V / (_| | |_\n;;   \\_/\\_/ \\__,_|\\__|\n;;\n\n")
(setq inhibit-startup-screen t)

;; Fullscreen avec F11
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)
