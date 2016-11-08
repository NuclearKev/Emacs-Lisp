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

;; This will kill the current buffer and delete the window so if you have
;; multiple windows open, it will remove the killed window's window
(defun kill-and-delete-window ()
	(interactive)
	(kill-buffer)
	(if (equal 1 (length (window-list)))
	    nil
		(delete-window)))


;;; I got tired of typing out the long commands for youtube-dl.
;;; BUG: Can't use async-shell-command due to the parens

(setq youtube-dl-dir "~/Downloads/") ;make sure to have the '/' at the end

(defun youtube-dl-video (url)
	"Easily download youtube videos in Emacs!

Pass it the URL of the video you wish to download.  Then it will
	place the full youtube-dl command in your kill ring.  Yank this
	to an eshell buffer or something."
	(interactive "sURL: ")
	(kill-append (concat "youtube-dl --output " youtube-dl-dir
											 "\%\(title\)s.\%\(ext\)s ")
							 t))

(defun youtube-dl-ogg (url)
	"Easily download youtube videos in Emacs!

Pass it the URL of the video you wish to convert to ogg and
	download.  Then it will place the full youtube-dl command in
	your kill ring.  Yank this to an eshell buffer or something."
	(interactive "sURL: ")
	(kill-append (concat "youtube-dl -x --audio-format vorbis "
											 "--output " youtube-dl-dir
											 "\%\(title\)s.\%\(ext\)s ")
							 t))

;;; elisp-fun.el ends here
