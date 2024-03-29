;;; 50w3m-el-snapshot.el --- Debian w3m-el-snapshot startup file  -*-mode: emacs-lisp;-*-

(let* ((pkg "w3m-el-snapshot")
       (pkg-sname "w3m")
       (flavor-name (if (boundp 'debian-emacs-flavor)
			(symbol-name debian-emacs-flavor)
		      "emacs"))
       (pkg-inst (concat "/usr/lib/emacsen-common/packages/install/" pkg))
       (elc-dir (concat "/usr/share/" flavor-name "/site-lisp/" pkg-sname)))
  (when (and (file-exists-p elc-dir)
	     (file-exists-p pkg-inst))
    (when (and (not (featurep 'mule))
	       (file-exists-p (concat elc-dir "/nomule")))
      (setq elc-dir (concat elc-dir "/nomule")))
    (if (fboundp 'debian-pkg-add-load-path-item)
        (progn
          (debian-pkg-add-load-path-item (concat elc-dir "/shimbun"))
          (debian-pkg-add-load-path-item elc-dir))
      (setq load-path (cons (concat elc-dir "/shimbun") load-path))
      (setq load-path (cons elc-dir load-path)))
    ;;
    (if (featurep 'xemacs)
	(setq w3m-icon-directory "/usr/share/pixmaps/w3m-el")
      (setq w3m-icon-directory "/usr/share/pixmaps/w3m-el/small"))
    (if (file-exists-p (concat elc-dir "/w3m-load.el"))
        (require 'w3m-load))
    ;;
    ))

;;; 50w3m-el-snapshot.el ends here
