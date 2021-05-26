;; tiny.el, TINY (Tiny Is Not Yasa (Yet Another Static Analyzer)) mode for Emacs.

;; Copyright © 2012 - Pierre ROUX
;;
;; This is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; How to install:
;; copy the following in your .emacs file
;;
;; (setq load-path (cons "/directory/in/which/you/put/the/file/tiny.el" load-path))
;; (autoload 'tiny-mode "tiny" "Major mode for editing TINY code" t)
;; ;; uncomment this if you want to automatically load TINY mode with each TINY file 
;; ;;(setq auto-mode-alist
;; ;;      (append
;; ;;       '(("\\.tiny" . tiny-mode))
;; ;;       auto-mode-alist))
;;
;; you can then load the mode in emacs with M-x tiny-mode

;; code

;; syntax table

(defvar tiny-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?\" "." st)  ; no string in TINY
    (modify-syntax-entry ?/ ". 14" st)
    (modify-syntax-entry ?* ". 23" st)
    st)
  "Syntax table in use in TINY mode buffers.")

;; font-lock

(defconst tiny-keywords
  '("while"
    "if"
    "else"
    "rand")
  "List of TINY keywords to highlight.")

(defvar tiny-font-lock-keywords
    (list
     `(,(concat (regexp-opt tiny-keywords 'words)) . font-lock-keyword-face)
     `(,"\\<[a-zA-Z][a-zA-Z0-9_]*\\>" . font-lock-variable-name-face)
     `(,"\\<[1-9][0-9]*\\|0\\>" . font-lock-constant-face)
     )
  "Default highlighting for TINY mode")

(defun tiny-font-lock-init ()
  "Initialize font-lock for TINY."
  (setq font-lock-defaults '(tiny-font-lock-keywords)))

;; indent

(defun tiny-indent-command (&optional arg)
  "Indent TINY code."
  (interactive "*")
  (save-excursion
    (beginning-of-line)
    (delete-horizontal-space)
    (if (nth 4 (syntax-ppss)) 
                                        ; comments (not the first line)
        (let ((nb-indent (save-excursion
                           (goto-char (nth 8 (syntax-ppss)))
                           (current-column))))
          (insert-char ?  (+ nb-indent 1))
          (if (not (looking-at "\\*")) (insert "* ")))
                                        ; not comments (or first line)
      (let ((nb-indent
             (if (looking-at "}")
                                        ; }, indent on matching {
                 (save-excursion
                   (setq nbopen 1)  ; look for matching opening bracket
                   (while (and (> (point) (point-min)) (> nbopen 0))
                     (re-search-backward "{\\|}" (point-min) t)
                     (if (not (nth 4 (syntax-ppss)))
                         (if (looking-at "}")
                             (setq nbopen (+ nbopen 1))
                           (if (looking-at "{")
                               (setq nbopen (- nbopen 1))))))
                   (beginning-of-line)
                   (skip-chars-forward "[ \t]"))
                                        ; anything else, indent on previous line
               (save-excursion
                 (forward-line -1)
                 (if (nth 4 (syntax-ppss)) (goto-char (nth 8 (syntax-ppss))))
                 (let ((bl
                        (save-excursion
                          (beginning-of-line)
                          (skip-chars-forward "[ \t]"))))
                   (if (save-excursion
                         (end-of-line)
                         (skip-chars-backward "[ \t]")
                         (backward-char 1)
                         (looking-at "{"))
                       (+ bl 2)
                     bl)
                   )))))
        (insert-char ? nb-indent))))
  (skip-chars-forward "[ \t]")
  (if (and (nth 4 (syntax-ppss)) (looking-at "\* "))
      (forward-char 2)))

(defun tiny-electric-indent ()
  "Insert typed character and reindent line."
  (interactive "*")
  (self-insert-command 1)
  (tiny-indent-command))

(defun tiny-indent-init ()
  (set (make-local-variable 'indent-line-function) 'tiny-indent-command))

;; custom variables

(require 'custom)

(defcustom tiny-prog-name "../src/tiny"
  "TINY executable name."
  :group 'tiny
  :type 'string)

(defcustom tiny-verbosity 1
  "Verbosity."
  :group 'tiny
  :type 'number)

(defcustom tiny-descending-iterations 0
  "Number of descending iterations ot perform once fixpoint reached."
  :group 'tiny
  :type 'number)

(defun tiny-compilation-mode-hook ()
  "Hook to get font-lock in compilation mode when analyzing TINY programs."
  (font-lock-add-keywords
   nil
   (cons
    '("/\\*\\([^*]\\|\\*[^/]\\)*\\*/" . font-lock-comment-face)
    tiny-font-lock-keywords) t)
  (remove-hook 'compilation-mode-hook 'tiny-compilation-mode-hook))

(defun tiny-analyze ()
  "Analyze TINY programs."
  (interactive)
  (add-hook 'compilation-mode-hook 'tiny-compilation-mode-hook)
  (compile (concat tiny-prog-name
                   " -v " (number-to-string tiny-verbosity)
		   " -d " (number-to-string tiny-descending-iterations)
		   " " (file-name-nondirectory (buffer-file-name)))))

(defun tiny-compile ()
  "Compile TINY programs."
  (interactive)
  (compile (concat tiny-prog-name
                   " -v " (number-to-string tiny-verbosity)
		   " -c "
		   (buffer-file-name))))

(defun tiny-compile-and-run ()
  "Compile then run TINY programs."
  (interactive)
  (compile (concat "TMPC=`mktemp`; TMPE=`mktemp`; "
                   tiny-prog-name
                   " -q -c "
                   (buffer-file-name)
                   " -o ${TMPC}.c && gcc -Wall ${TMPC}.c -o ${TMPE} "
                   "&& echo \"\" && ${TMPE} && rm -f ${TMPC}.c ${TMPE} "
                   "|| rm -f ${TMPC}.c ${TMPE}")))

;; keymap

(defun tiny-keymap-init ()
  "Init keymap"
  (define-key tiny-mode-map ";" 'tiny-electric-indent)
  (define-key tiny-mode-map "=" 'tiny-electric-indent)
  (define-key tiny-mode-map "{" 'tiny-electric-indent)
  (define-key tiny-mode-map "}" 'tiny-electric-indent)
  (define-key tiny-mode-map "\C-c\C-a" 'tiny-analyze)
  (define-key tiny-mode-map "\C-c\C-c" 'tiny-compile)
  (define-key tiny-mode-map "\C-c\C-r" 'tiny-compile-and-run))

;; menu

(require 'easymenu)

(defun tiny-increase-verbosity ()
  "Increase tiny-verbosity by 1"
  (interactive)
  (setq tiny-verbosity (+ tiny-verbosity 1))
  (message "Variable tiny-verbosity set to %d." tiny-verbosity))

(defun tiny-decrease-verbosity ()
  "Decrease tiny-verbosity by 1"
  (interactive)
  (setq tiny-verbosity (- tiny-verbosity 1))
  (message "Variable tiny-verbosity set to %d." tiny-verbosity))

(defun tiny-1-descending-iteration ()
  "Set tiny-descending-iterations to 1."
  (interactive)
  (setq tiny-descending-iterations 1)
  (message "Variable tiny-descending-iterations set to %d." tiny-descending-iterations))

(defun tiny-no-descending-iteration ()
  "Set tiny-descending-iterations to 0."
  (interactive)
  (setq tiny-descending-iterations 0)
  (message "Variable tiny-descending-iterations set to %d." tiny-descending-iterations))

(defun tiny-menu-init ()
  (easy-menu-define
   tiny-menu (list tiny-mode-map)
   "TINY Mode Menu." 
   '("TINY"
     ["Customize TINY mode" (customize-group 'tiny) t]
     "---"
     ["Increase verbosity" tiny-increase-verbosity :key-sequence nil :active t]
     ["Decrease verbosity" tiny-decrease-verbosity :key-sequence nil :active t]
     "---"
     ["Perform one descending iteration" tiny-1-descending-iteration :key-sequence nil :active t]
     ["No descending iterations" tiny-no-descending-iteration :key-sequence nil :active t]
     "---"
     ["Analyze" tiny-analyze t]
     ["Compile" tiny-compile t]
     ["Compile and run" tiny-compile-and-run t]
     ))
  (easy-menu-add tiny-menu))

;; main function for the mode

(define-derived-mode tiny-mode fundamental-mode "TINY"
  "Major mode for editing TINY programs.
Special key bindings:
\\{tiny-mode-map}"
  (set (make-local-variable 'comment-start) "/*")
  (set (make-local-variable 'comment-end) "*/")
  (set (make-local-variable 'comment-start-skip) "/*+[ \t]*")
  (set (make-local-variable 'comment-multi-line) t)
  (make-local-variable 'compile-command)
  (set-syntax-table tiny-mode-syntax-table)
  (tiny-font-lock-init)
  (tiny-indent-init)
  (tiny-keymap-init)
  (tiny-menu-init))

(provide 'tiny-mode)
