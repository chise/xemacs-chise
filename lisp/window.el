;;; window.el --- XEmacs window commands aside from those written in C.

;; Copyright (C) 1985, 1989, 1993-94, 1997 Free Software Foundation, Inc.
;; Copyright (C) 1995, 1996 Ben Wing.

;; Maintainer: XEmacs Development Team
;; Keywords: frames, extensions, dumped

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Synched up with: Emacs/Mule zeta.

;;; Commentary:

;; This file is dumped with XEmacs.

;;; Code:

;;;; Window tree functions.

(defun one-window-p (&optional nomini all-frames device)
  "Return non-nil if the selected window is the only window (in its frame).
Optional arg NOMINI non-nil means don't count the minibuffer
even if it is active.

The optional arg ALL-FRAMES t means count windows on all frames.
If it is `visible', count windows on all visible frames.
ALL-FRAMES nil or omitted means count only the selected frame,
plus the minibuffer it uses (which may be on another frame).
ALL-FRAMES = 0 means count windows on all visible and iconified frames.
If ALL-FRAMES is any other value, count only the selected frame.

If optional third argument DEVICE is nil or omitted, count frames
on all devices.
If a device, count frames only on that device.
If a device type, count frames only on devices of that type.
Otherwise, count frames only on the selected device."
  (let ((base-window (selected-window)))
    (if (and nomini (eq base-window (minibuffer-window)))
	(setq base-window (next-window base-window)))
    (eq base-window
	(next-window base-window (if nomini 'arg) all-frames device))))

(defun walk-windows (proc &optional minibuf all-frames device)
  "Cycle through all visible windows, calling PROC for each one.
PROC is called with a window as argument.

Optional second arg MINIBUF t means count the minibuffer window even
if not active.  MINIBUF nil or omitted means count the minibuffer iff
it is active.  MINIBUF neither t nor nil means not to count the
minibuffer even if it is active.

Several frames may share a single minibuffer; if the minibuffer
counts, all windows on all frames that share that minibuffer count
too.  Therefore, when a separate minibuffer frame is active,
`walk-windows' includes the windows in the frame from which you
entered the minibuffer, as well as the minibuffer window.  But if the
minibuffer does not count, only windows from WINDOW's frame count.

ALL-FRAMES is the optional third argument.
ALL-FRAMES nil or omitted means cycle within the frames as specified above.
ALL-FRAMES = `visible' means include windows on all visible frames.
ALL-FRAMES = 0 means include windows on all visible and iconified frames.
ALL-FRAMES = t means include windows on all frames including invisible frames.
Anything else means restrict to WINDOW's frame.

If optional fourth argument DEVICE is nil or omitted, include frames
on all devices.
If a device, include frames only on that device.
If a device type, include frames only on devices of that type.
Otherwise, include frames only on the selected device."
  ;; If we start from the minibuffer window, don't fail to come back to it.
  (if (window-minibuffer-p (selected-window))
      (setq minibuf t))
  ;; Note that, like next-window & previous-window, this behaves a little
  ;; strangely if the selected window is on an invisible frame: it hits
  ;; some of the windows on that frame, and all windows on visible frames.
  (let* ((walk-windows-start (selected-window))
	 (walk-windows-current walk-windows-start))
    (while (progn
	     (setq walk-windows-current
		   (next-window walk-windows-current minibuf all-frames
				device))
	     (funcall proc walk-windows-current)
	     (not (eq walk-windows-current walk-windows-start))))))
;; The old XEmacs definition of the above clause.  It's more correct in
;; that it will never hit a window that's already been hit even if you
;; do something odd like `delete-other-windows', but has the problem
;; that it conses. (This may be called repeatedly, from lazy-lock
;; for example.)
;  (let* ((walk-windows-history nil)
;	 (walk-windows-current (selected-window)))
;    (while (progn
;	     (setq walk-windows-current
;		   (next-window walk-windows-current minibuf all-frames
;				device))
;	     (not (memq walk-windows-current walk-windows-history)))
;      (setq walk-windows-history (cons walk-windows-current
;				       walk-windows-history))
;      (funcall proc walk-windows-current))))

(defun minibuffer-window-active-p (window)
  "Return t if WINDOW (a minibuffer window) is now active."
  (eq window (active-minibuffer-window)))

(defmacro save-selected-window (&rest body)
  "Execute BODY, then select the window that was selected before BODY."
  (list 'let
	'((save-selected-window-window (selected-window)))
	(list 'unwind-protect
	      (cons 'progn body)
	      (list 'and ; XEmacs
		    (list 'window-live-p 'save-selected-window-window)
		    (list 'select-window 'save-selected-window-window)))))

(defun count-windows (&optional minibuf)
   "Return the number of visible windows.
Optional arg MINIBUF non-nil means count the minibuffer
even if it is inactive."
   (let ((count 0))
     (walk-windows (function (lambda (w)
			       (setq count (+ count 1))))
		   minibuf)
     count))

(defun balance-windows ()
  "Make all visible windows the same height (approximately)."
  (interactive)
  (let ((count -1) levels newsizes size)
        ;FSFmacs
	;;; Don't count the lines that are above the uppermost windows.
	;;; (These are the menu bar lines, if any.)
	;(mbl (nth 1 (window-edges (frame-first-window (selected-frame))))))
    ;; Find all the different vpos's at which windows start,
    ;; then count them.  But ignore levels that differ by only 1.
    (save-window-excursion
      (let (tops (prev-top -2))
	(walk-windows (function (lambda (w)
                        (setq tops (cons (nth 1 (window-pixel-edges w))
                                         tops))))
		      'nomini)
	(setq tops (sort tops '<))
	(while tops
	  (if (> (car tops) (1+ prev-top))
	      (setq prev-top (car tops)
		    count (1+ count)))
	  (setq levels (cons (cons (car tops) count) levels))
	  (setq tops (cdr tops)))
	(setq count (1+ count))))
    ;; Subdivide the frame into that many vertical levels.
    ;FSFmacs (setq size (/ (- (frame-height) mbl) count))
    (setq size (/ (window-pixel-height (frame-root-window)) count))
    (walk-windows (function
		   (lambda (w)
                    (select-window w)
                    (let ((newtop (cdr (assq (nth 1 (window-pixel-edges))
                                             levels)))
                          (newbot (or (cdr (assq
					    (+ (window-pixel-height)
					       (nth 1 (window-pixel-edges)))
					    levels))
                                      count)))
                      (setq newsizes
                            (cons (cons w (* size (- newbot newtop)))
                                  newsizes)))))
		  'nomini)
    (walk-windows (function (lambda (w)
			      (select-window w)
			      (let ((newsize (cdr (assq w newsizes))))
				(enlarge-window
				 (/ (- newsize (window-pixel-height))
				    (face-height 'default))))))
                  'nomini)))

;;; I think this should be the default; I think people will prefer it--rms.
(defcustom split-window-keep-point t
  "*If non-nil, split windows keeps the original point in both children.
This is often more convenient for editing.
If nil, adjust point in each of the two windows to minimize redisplay.
This is convenient on slow terminals, but point can move strangely."
  :type 'boolean
  :group 'windows)

(defun split-window-vertically (&optional arg)
  "Split current window into two windows, one above the other.
The uppermost window gets ARG lines and the other gets the rest.
Negative arg means select the size of the lowermost window instead.
With no argument, split equally or close to it.
Both windows display the same buffer now current.

If the variable split-window-keep-point is non-nil, both new windows
will get the same value of point as the current window.  This is often
more convenient for editing.

Otherwise, we chose window starts so as to minimize the amount of
redisplay; this is convenient on slow terminals.  The new selected
window is the one that the current value of point appears in.  The
value of point can change if the text around point is hidden by the
new mode line.

Programs should probably use split-window instead of this."
  (interactive "P")
  (let ((old-w (selected-window))
	(old-point (point))
	(size (and arg (prefix-numeric-value arg)))
	(window-full-p nil)
	new-w bottom moved)
    (and size (< size 0) (setq size (+ (window-height) size)))
    (setq new-w (split-window nil size))
    (or split-window-keep-point
	(progn
	  (save-excursion
	    (set-buffer (window-buffer))
	    (goto-char (window-start))
	    (setq moved (vertical-motion (window-height)))
	    (set-window-start new-w (point))
	    (if (> (point) (window-point new-w))
		(set-window-point new-w (point)))
	    (and (= moved (window-height))
		 (progn
		   (setq window-full-p t)
		   (vertical-motion -1)))
	    (setq bottom (point)))
	  (and window-full-p
	       (<= bottom (point))
	       (set-window-point old-w (1- bottom)))
	  (and window-full-p
	       (<= (window-start new-w) old-point)
	       (progn
		 (set-window-point new-w old-point)
		 (select-window new-w)))))
    new-w))

(defun split-window-horizontally (&optional arg)
  "Split current window into two windows side by side.
This window becomes the leftmost of the two, and gets ARG columns.
Negative arg means select the size of the rightmost window instead.
No arg means split equally."
  (interactive "P")
  (let ((size (and arg (prefix-numeric-value arg))))
    (and size (< size 0)
	 (setq size (+ (window-width) size)))
    (split-window nil size t)))

(defun enlarge-window-horizontally (arg)
  "Make current window ARG columns wider."
  (interactive "p")
  (enlarge-window arg t))

(defun shrink-window-horizontally (arg)
  "Make current window ARG columns narrower."
  (interactive "p")
  (shrink-window arg t))

(defun shrink-window-if-larger-than-buffer (&optional window)
  "Shrink the WINDOW to be as small as possible to display its contents.
Do not shrink to less than `window-min-height' lines.
Do nothing if the buffer contains more lines than the present window height,
or if some of the window's contents are scrolled out of view,
or if the window is not the full width of the frame,
or if the window is the only window of its frame."
  (interactive)
  (or window (setq window (selected-window)))
  (save-excursion
    (set-buffer (window-buffer window))
    (let ((n 0)
	  (test-pos
	   (- (point-max)
	      ;; If buffer ends with a newline, ignore it when counting
	      ;; height unless point is after it.
	      (if (and (not (eobp))
		       (eq ?\n (char-after (1- (point-max)))))
		  1 0)))
	  (mini (frame-property (window-frame window) 'minibuffer))
	  (edges (window-pixel-edges (selected-window))))
      (if (and (< 1 (let ((frame (selected-frame)))
		      (select-frame (window-frame window))
		      (unwind-protect
			  (count-windows)
			(select-frame frame))))
	       ;; check to make sure that the window is the full width
	       ;; of the frame
	       (eq (nth 2 edges)
		   (frame-pixel-width))
	       (zerop (nth 0 edges))
	       ;; The whole buffer must be visible.
	       (pos-visible-in-window-p (point-min) window)
	       ;; The frame must not be minibuffer-only.
	       (not (eq mini 'only)))
	  (progn
	    (save-window-excursion
	      (goto-char (point-min))
	      (while (and (window-live-p window)
			  (pos-visible-in-window-p test-pos window))
		(shrink-window 1 nil window)
		(setq n (1+ n))))
	    (if (> n 0)
		(shrink-window (min (1- n)
				    (- (window-height window)
				       (1+ window-min-height)))
			       nil
			       window)))))))

(defun kill-buffer-and-window ()
  "Kill the current buffer and delete the selected window."
  (interactive)
  (if (yes-or-no-p (format "Kill buffer `%s'? " (buffer-name)))
      (let ((buffer (current-buffer)))
	(delete-window (selected-window))
	(kill-buffer buffer))
    (error "Aborted")))

;;; New with XEmacs 20.3
;;; Suggested by Noah Friedman, and tuned by Hrvoje Niksic.
(defun window-list (&optional minibuf all-frames device)
  "Return a list of existing windows.
If the optional argument MINIBUF is non-nil, then include minibuffer
windows in the result.

By default, only the windows in the selected frame are returned.
The optional argument ALL-FRAMES changes this behavior:
ALL-FRAMES = `visible' means include windows on all visible frames.
ALL-FRAMES = 0 means include windows on all visible and iconified frames.
ALL-FRAMES = t means include windows on all frames including invisible frames.
Anything else means restrict to the selected frame.
The optional fourth argument DEVICE further clarifies which frames to
search as specified by ALL-FRAMES.  This value is only meaningful if
ALL-FRAMES is non-nil.
If nil or omitted, search only the selected device.
If a device, search frames only on that device.
If a device type, search frames only on devices of that type.
Any other non-nil value means search frames on all devices."
  (let ((wins nil))
    (walk-windows (lambda (win)
                    (push win wins))
                  minibuf all-frames device)
    wins))


;;; window.el ends here
