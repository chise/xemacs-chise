;; Copyright (C) 1999 Free Software Foundation, Inc.

;; Author: Yoshiki Hayashi  <t90553@mail.ecc.u-tokyo.ac.jp>
;; Maintainer: Yoshiki Hayashi  <t90553@mail.ecc.u-tokyo.ac.jp>
;; Created: 1999
;; Keywords: tests

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
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Synched up with: Not in FSF.

;;; Commentary:

;; Test syntax related functions.
;; Right now it tests scan_words using forward-word and backward-word.
;; See test-harness.el for instructions on how to run these tests.

;;; Notation
;; W:   word constituent character.
;; NW:  non word constituent character.
;; -!-: current point.
;; EOB: end of buffer
;; BOB: beginning of buffer.

;; Algorithm of scan_words is simple.  It just searches SW and then
;; moves to NW.  When with MULE, it also stops at word boundary.  Word
;; boundary is tricky and listing all possible cases will be huge.
;; Those test are omitted here as it doesn't affect core
;; functionality.

(defun test-forward-word (string stop)
  (goto-char (point-max))
  (let ((point (point)))
    (insert string)
    (goto-char point)
    (forward-word 1)
    (Assert (eq (point) (+ point stop)))))

(with-temp-buffer
  ;; -!- W NW
  (test-forward-word "W " 1)
  (test-forward-word "WO " 2)
  ;; -!- W EOB
  (test-forward-word "W" 1)
  (test-forward-word "WO" 2)
  ;; -!- NW EOB
  (test-forward-word " " 1)
  (test-forward-word " !" 2)
  ;; -!- NW W NW
  (test-forward-word " W " 2)
  (test-forward-word " WO " 3)
  (test-forward-word " !W " 3)
  (test-forward-word " !WO " 4)
  ;; -!- NW W EOB
  (test-forward-word " W" 2)
  (test-forward-word " WO" 3)
  (test-forward-word " !W" 3)
  (test-forward-word " !WO" 4))

(defun test-backward-word (string stop)
  (goto-char (point-min))
  (insert string)
  (let ((point (point)))
    (backward-word 1)
    (Assert (eq (point) (- point stop)))))

(with-temp-buffer
  ;; NW W -!-
  (test-backward-word " W" 1)
  (test-backward-word " WO" 2)
  ;; BOB W -!-
  (test-backward-word "W" 1)
  (test-backward-word "WO" 2)
  ;; BOB NW -!-
  ;; -!-NW EOB
  (test-backward-word " " 1)
  (test-backward-word " !" 2)
  ;; NW W NW -!-
  (test-backward-word " W " 2)
  (test-backward-word " WO " 3)
  (test-backward-word " W !" 3)
  (test-backward-word " WO !" 4)
  ;; BOB W NW -!-
  (test-backward-word "W " 2)
  (test-backward-word "WO " 3)
  (test-backward-word "W !" 3)
  (test-backward-word "WO !" 4))
