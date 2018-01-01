(find-file "~/todo.org")
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'dracula t)

(define-key global-map [f8] 'shell)                        ; F8

(global-auto-revert-mode t)

(global-set-key "\M-g" 'goto-line)

(global-set-key "\C-x/" 'point-to-register)

(global-set-key "\C-xj" 'jump-to-register)

(global-set-key "\C-xx" 'copy-to-register)

(global-set-key "\C-xg" 'insert-register)

					;disable backup
(setq backup-inhibited t)
					;disable auto save
(setq auto-save-default nil)

(setq confirm-kill-emacs 'yes-or-no-p)          ; Confirm quit

;; Define a keybinding for renaming the buffer
(global-set-key "\C-xr" 'rename-buffer)

;; Define a keybinding for clearing buffer
(global-set-key "\C-xe" 'erase-buffer)

(put 'erase-buffer 'disabled nil)

;; Make emacs window title show path of current file
(setq-default frame-title-format
              '(:eval
                (format "Happy Hacking! %s"
		;;(format "Plug your deficiencies! %s"
                        ;;(or (file-remote-p default-directory 'user)
                        ;;    user-real-login-name)
                        ;;(or (file-remote-p default-directory 'host)
                        ;;    system-name)
                        (buffer-name)
                        (cond
                         (buffer-file-truename
                          (concat "(" buffer-file-truename ")"))
                         (dired-directory
                          (concat "{" dired-directory "}"))
                         (t
                          "[no file]")))))

(setq js-indent-level 2)

   ;; (defun autopair-insert-opening ()
   ;;   (interactive)
   ;;   (when (autopair-pair-p)
   ;;     (setq autopair-action (list 'opening (autopair-find-pair) (point))))
   ;;   (autopair-fallback))

;; (autopair-global-mode) ;; enable autopair in all buffers

(add-hook 'web-mode-hook
      (lambda ()
        ;; short circuit js mode and just do everything in jsx-mode
        (if (equal web-mode-content-type "javascript")
            (web-mode-set-content-type "jsx")
          (message "now set to: %s" web-mode-content-type))))
;; alarm
(setq alert-default-style 'libnotify)

;; https://stackoverflow.com/questions/4006005/how-can-i-set-emacs-tab-settings-by-file-type
(setq css-indent-offset 2)
;; follow this : https://github.com/prathamesh-sonpatki/dotemacs/blob/master/hooks/web.el

;; mongo
;;(add-to-list 'load-path "~/.emacs.d/vendor/inf-mongo")
;;(require 'inf-mongo)

;; markdown mode
(add-to-list 'load-path "/Users/shishir.biyyala/.emacs.d/vendor/markdown-mode")

;; Remember last session
(desktop-save-mode 1)

(provide 'init-sbiyyala)
