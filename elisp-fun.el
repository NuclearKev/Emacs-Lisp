;; This file is Free Software under the GNU GPLv3.

;; One day this will contain a bunch of fun Elisp functions that might help
;; some sad sack, someday. Enjoy.

(defun replace-a-word (org-word new-word)
  "Replace a word with a different one!"
  (interactive "sWord to replace:\nsNew word:") ;\n allows for [RET] between
  (let ((found-flag nil))
    (goto-char (point-min))
    (while (integerp (search-forward org-word nil "done"))
      (setq found-flag t)		;not very good practice..
      (replace-match new-word))
    (if found-flag
	(message "Replaced!")
      (message "The word %s wasn't found!" org-word))))
