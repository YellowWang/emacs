;; -------- c# hightlight --------
(load-file "~/.emacs.d/site-lisp/csharp-mode-0.8.5.el")
;; --------------------------------------------------

;; -------- title format --------
;;(setq frame-title-format
;;       '("YellowIs Geek!@%S" (buffer-file-name "%f"
;;                    (dired-directory dired-directory "%b"))))
;; --------------------------------------------------

;; -------- highlight-tail-colors
(load-file "~/.emacs.d/site-lisp/highlight-tail.el")
(highlight-tail-mode t)
(setq highlight-tail-colors
        '(("#c1e156" . 0)
          ("#b8ff07" . 25)
          ("#00c377" . 60)))
;; --------------------------------------------------

;; -------- cedet --------
;;(add-to-list 'load-path "~/.emacs.d/cedet-1.1/common")
;;(require 'cedet)
(load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
;;(defconst cedet-user-include-dirs
;;  (list ".." "../include" 
;;	"../inc" 
;;	"../common" 
;;	"../public"
;;      "../.." "../../include" 
;;	"../../inc" 
;;	"../../common" 
;;	"../../public"))
;;(require 'semantic-c nil 'noerror)
;;(let ((include-dirs cedet-user-include-dirs))
;;  (when (eq system-type 'windows-nt)
;;    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
;;  (mapc (lambda (dir)
;;          (semantic-add-system-include dir 'c++-mode)
;;          (semantic-add-system-include dir 'c-mode))
;;        include-dirs))

;; semantic settings
;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:
;;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

;; enable minor mode
;;(semantic-idle-summary-mode  t)
;;(semantic-idle-tag-highlight-mode t)

;; Enable EDE (Project Management) features
;; -------- ede --------
(global-ede-mode 1)
 
;; Enable SRecode (Template management) minor-mode.
;;(global-srecode-minor-mode 1)

;; Enable source code folding
;;(global-semantic-tag-folding-mode 1)
 
;; global key bingding
(global-set-key [f9] 'semantic-ia-fast-jump)
(global-set-key (kbd "C-0") 'semantic-ia-complete-symbol-menu)
;;(global-set-key (kbd "c-i c-i")  'semantic-ia-fast-jump)


(defun my-cedet-hook ()

  (local-set-key [(control return)] 'semantic-ia-complete-symbol)

  (local-set-key "/C-c?" 'semantic-ia-complete-symbol-menu)

  (local-set-key "/C-cd" 'semantic-ia-fast-jump)

  (local-set-key "/C-cr" 'semantic-symref-symbol)

  (local-set-key "/C-cR" 'semantic-symref))
;;(add-hook 'c-mode-common-hook 'my-cedet-hook)

 

;;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员

(defun my-c-mode-cedet-hook ()

  (local-set-key "." 'semantic-complete-self-insert)

  (local-set-key ">" 'semantic-complete-self-insert))

;;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; -------- ECB --------
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40")
(require 'ecb)
(require 'ecb-autoloads)
(setq stack-trace-on-error nil)
(setq ecb-auto-activate nil
      ecb-tip-of-the-day nil)
;; --------------------------------------------------
