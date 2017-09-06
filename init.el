;;; package --- Summary
;;; Commentary:
;;Rays init.el

;;; Code:
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages
   (quote
    (flymake-go go-autocomplete go-guru auto-complete exec-path-from-shell go-mode paredit geiser blank-mode yaml-mode flycheck-pyflakes flycheck swiper smex jedi magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-initialize)
(menu-bar-mode 0)

;;install missing packages if any
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;set some global things you want
(electric-pair-mode t)
(show-paren-mode t)
(global-linum-mode 1) ;always start with linum

;; some appearance
(ido-mode t)
(tool-bar-mode 0)
;;(scroll-bar-mode 0)
(setq inhibit-startup-screen t)
(when window-system (set-frame-size (selected-frame) 120 46))

;; keys
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

;; deft
(setq deft-extensions '("md" "txt"))
(global-set-key [f8] 'deft)
(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)

;; font
(set-face-attribute 'default nil :family "PT Mono" :height 140 :weight 'normal)


;; scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step            1
      scroll-conservatively  10000)

;;python stuff
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(global-flycheck-mode)

;;paredit stuff
(add-hook 'scheme-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'run-guile)

;; ;;NO WHITESPACE
;;(setq indent-tabs-mode nil)
;; (add-hook 'before-save-hook 'whitespace-cleanup)

;; Spaces 4 lyfe
(setq-default indent-tabs-mode nil)

;;GOLANG STUFF
;;ENV STUFF: invoke shell and print variables.. for exec-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; auto fmt code on save
(add-to-list 'exec-path "~/Development/go/bin")


(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'go-guru)

;;function for GO Autocomplete
(defun auto-complete-for-go ()
  (auto-complete-mode 1))

;;do nice things with go-guru
(go-guru-hl-identifier-mode)
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (auto-complete-mode)
  (electric-pair-mode)
  (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
  (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
  (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
  (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg
  (setq gofmt-command "goimports")
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'before-save-hook 'gofmt-before-save)
;;; init.el ends here

