;;; Conall's emacs config


;;; Modeline settings
;;; Prettier than the default
(setq default-mode-line-format
      '("-"
	mode-line-mule-info
	mode-line-modified
	mode-line-frame-identification
	mode-line-buffer-identification
	"  "
	global-mode-string
	"   %[(" mode-name mode-line-process minor-mode-alist "%n"")%]--"
	(line-number-mode "L%l--")
	(column-number-mode "C%c--")
	(-3 . "%p")
	"------------------------"
	system-name)
      )

;;; Encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;;; Text files end in new lines.                                                               
(setq require-final-newline t)

;;; Change backup behavior to save in a specified directory                                       
(setq backup-directory-alist '(("." . "~/.emacs.d/saves/"))
 backup-by-copying      t
 version-control        t
 delete-old-versions    t
 kept-new-versions      6
 kept-old-versions      2
)


;;; Rectangle select is fun
(add-to-list 'load-path "~/.emacs.d/")
(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-@") 'rm-set-mark)
(global-set-key (kbd "C-w")  
  '(lambda(b e) (interactive "r") 
     (if rm-mark-active 
       (rm-kill-region b e) (kill-region b e))))
(global-set-key (kbd "M-w")  
  '(lambda(b e) (interactive "r") 
     (if rm-mark-active 
       (rm-kill-ring-save b e) (kill-ring-save b e))))
(global-set-key (kbd "C-x C-x")  
  '(lambda(&optional p) (interactive "p") 
     (if rm-mark-active 
       (rm-exchange-point-and-mark p) (exchange-point-and-mark p))))

;;; Get rid of the menu bar
(menu-bar-mode -1)

;;; Don't display the 'Welcome to GNU Emacs' buffer on startup
;;; and make the Scratch buffer blank
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;;; Always highlight syntax
(global-font-lock-mode t)

;;; Electric minibuffer!
;;; When selecting a file to visit, // will mean / and
;;; ~ will mean $HOME regardless of preceding text.
(setq file-name-shadow-tty-properties '(invisible t))
(file-name-shadow-mode 1)

;;; Display the line and column number in the modeline
(setq line-number-mode t)
(setq column-number-mode t)
(line-number-mode t)
(column-number-mode t)

;;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;;; Paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

;;; Slime
;;;(setq inferior-lisp-program "/usr/bin/sbcl")
;;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;;;(require 'slime)
;;;(slime-setup '(slime-fancy))

;;; C stuff
(setq c-basic-offset 8)

;;; Android Mode
;;;(require 'android-mode)
;;;(setq android-mode-sdk-dir "/opt/android-sdk/")
;;;(setq android-mode-avd "galaxy2")

;;; Lua Mode
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;;; Making sure dabbrev works nicely
(setq dabbrev-case-fold-search t)

;;; Other aliases and keybindings
(defalias 'cr            'comment-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
