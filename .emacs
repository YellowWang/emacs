;; -------- c# hightlight --------
(load-file "~/.emacs.d/site-lisp/csharp-mode-0.8.5.el")
;; --------------------------------------------------

;; -------- title format --------
;;(setq frame-title-format
;;       '("YellowIs Geek!@%S" (buffer-file-name "%f"
;;                    (dired-directory dired-directory "%b"))))
;; --------------------------------------------------

;; -------- yasnippet --------
 (add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet-0.6.1c")
 (require 'yasnippet) ;; not yasnippet-bundle
 (yas/initialize)
 (yas/load-directory "~/.emacs.d/site-lisp/yasnippet-0.6.1c/snippets")
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;; -------- ace jump mode major function --------
;; https://github.com/winterTTr/ace-jump-mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode-pop-mark)

;;If you use viper mode :
;;(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
;; --------------------------------------------------

;;
;; -------- mark multi-line --------
;; https://github.com/magnars/mark-multiple.el
(add-to-list 'load-path "~/.emacs.d/site-lisp/mark-multiple.el/")
;;(require 'multiple-cursors)
;;(require 'inline-string-rectangle)
;;(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)
;;(add-hook 'sgml-mode-hook
;;          (lambda ()
;;            (require 'rename-sgml-tag)
;;            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))
;; --------------------------------------------------

;;
;; -------- expand-region --------
;; https://github.com/magnars/expand-region.el
(add-to-list 'load-path "~/.emacs.d/site-lisp/expand-region/")  
(require 'expand-region)  
(global-set-key (kbd "C-=") 'er/expand-region)  
;; --------------------------------------------------

;;
;; -------- helm --------
;; https://github.com/emacs-helm/helm
(add-to-list 'load-path "~/.emacs.d/site-lisp/helm/")
(require 'helm-config)
;;(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
(defvar folders (list  "~/test/")
  "test")

(require 'helm-files)
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
(setq helm-c-locate-command "locate-with-mdfind %.0s %s")
(loop for ext in '("\\.swf$" "\\test\.cs$" "\\.pyc$")
      do (add-to-list 'helm-c-boring-file-regexp-list ext))
(define-key global-map [(alt t)] 'helm-for-files))
