;;; process.el --- commands for subprocesses; split out of simple.el

;; Copyright (C) 1985-7, 1993,4, 1997 Free Software Foundation, Inc.
;; Copyright (C) 1995 Ben Wing.

;; Author: Ben Wing
;; Maintainer: XEmacs Development Team
;; Keywords: internal, processes, dumped

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

;;; Synched up with: FSF 19.30.

;;; Commentary:

;; This file is dumped with XEmacs.

;;; Code:


(defgroup processes nil
  "Process, subshell, compilation, and job control support."
  :group 'external
  :group 'development)

(defgroup processes-basics nil
  "Basic stuff dealing with processes."
  :group 'processes)

(defgroup execute nil
  "Executing external commands."
  :group 'processes)


(defvar shell-command-switch "-c"
  "Switch used to have the shell execute its command line argument.")

(defun start-process-shell-command (name buffer &rest args)
  "Start a program in a subprocess.  Return the process object for it.
Args are NAME BUFFER COMMAND &rest COMMAND-ARGS.
NAME is name for process.  It is modified if necessary to make it unique.
BUFFER is the buffer or (buffer-name) to associate with the process.
 Process output goes at end of that buffer, unless you specify
 an output stream or filter function to handle the output.
 BUFFER may be also nil, meaning that this process is not associated
 with any buffer
Third arg is command name, the name of a shell command.
Remaining arguments are the arguments for the command.
Wildcards and redirection are handled as usual in the shell."
  (cond
   ((eq system-type 'vax-vms)
    (apply 'start-process name buffer args))
   ;; We used to use `exec' to replace the shell with the command,
   ;; but that failed to handle (...) and semicolon, etc.
   (t
    (start-process name buffer shell-file-name shell-command-switch
		   (mapconcat 'identity args " ")))))

(defun call-process (program &optional infile buffer displayp &rest args)
  "Call PROGRAM synchronously in separate process.
The program's input comes from file INFILE (nil means `/dev/null').
Insert output in BUFFER before point; t means current buffer;
 nil for BUFFER means discard it; 0 means discard and don't wait.
BUFFER can also have the form (REAL-BUFFER STDERR-FILE); in that case,
REAL-BUFFER says what to do with standard output, as above,
while STDERR-FILE says what to do with standard error in the child.
STDERR-FILE may be nil (discard standard error output),
t (mix it with ordinary output), or a file name string.

Fourth arg DISPLAYP non-nil means redisplay buffer as output is inserted.
Remaining arguments are strings passed as command arguments to PROGRAM.

If BUFFER is 0, `call-process' returns immediately with value nil.
Otherwise it waits for PROGRAM to terminate and returns a numeric exit status
 or a signal description string.
If you quit, the process is killed with SIGINT, or SIGKILL if you
 quit again."
  (apply 'call-process-internal program infile buffer displayp args))

(defun call-process-region (start end program
                            &optional deletep buffer displayp
                            &rest args)
  "Send text from START to END to a synchronous process running PROGRAM.
Delete the text if fourth arg DELETEP is non-nil.

Insert output in BUFFER before point; t means current buffer;
 nil for BUFFER means discard it; 0 means discard and don't wait.
BUFFER can also have the form (REAL-BUFFER STDERR-FILE); in that case,
REAL-BUFFER says what to do with standard output, as above,
while STDERR-FILE says what to do with standard error in the child.
STDERR-FILE may be nil (discard standard error output),
t (mix it with ordinary output), or a file name string.

Sixth arg DISPLAYP non-nil means redisplay buffer as output is inserted.
Remaining args are passed to PROGRAM at startup as command args.

If BUFFER is 0, returns immediately with value nil.
Otherwise waits for PROGRAM to terminate
and returns a numeric exit status or a signal description string.
If you quit, the process is first killed with SIGINT, then with SIGKILL if
you quit again before the process exits."
  (let ((temp (cond ((eq system-type 'vax-vms)
                     (make-temp-name "tmp:emacs"))
		    ((or (eq system-type 'ms-dos)
			 (eq system-type 'windows-nt))
		     (make-temp-name
		      (concat (file-name-as-directory
			       (temp-directory))
			       "em")))
                    (t
		     (make-temp-name
		      (concat (file-name-as-directory
			       (temp-directory))
			      "emacs"))))))
    (unwind-protect
	(progn
	  (if (or (eq system-type 'ms-dos)
		  (eq system-type 'windows-nt))
	      (let ((buffer-file-type binary-process-output))
		(write-region start end temp nil 'silent))
	    (write-region start end temp nil 'silent))
	  (if deletep (delete-region start end))
	  (apply #'call-process program temp buffer displayp args))
      (condition-case ()
          (delete-file temp)
        (file-error nil)))))


(defun shell-command (command &optional output-buffer)
  "Execute string COMMAND in inferior shell; display output, if any.

If COMMAND ends in ampersand, execute it asynchronously.
The output appears in the buffer `*Async Shell Command*'.
That buffer is in shell mode.

Otherwise, COMMAND is executed synchronously.  The output appears in the
buffer `*Shell Command Output*'.
If the output is one line, it is displayed in the echo area *as well*,
but it is nonetheless available in buffer `*Shell Command Output*',
even though that buffer is not automatically displayed.
If there is no output, or if output is inserted in the current buffer,
then `*Shell Command Output*' is deleted.

The optional second argument OUTPUT-BUFFER, if non-nil,
says to put the output in some other buffer.
If OUTPUT-BUFFER is a buffer or buffer name, put the output there.
If OUTPUT-BUFFER is not a buffer and not nil,
insert output in current buffer.  (This cannot be done asynchronously.)
In either case, the output is inserted after point (leaving mark after it)."
  (interactive (list (read-shell-command "Shell command: ")
		     current-prefix-arg))
  (if (and output-buffer
	   (not (or (bufferp output-buffer)  (stringp output-buffer))))
      (progn (barf-if-buffer-read-only)
	     (push-mark)
	     ;; We do not use -f for csh; we will not support broken use of
	     ;; .cshrcs.  Even the BSD csh manual says to use
	     ;; "if ($?prompt) exit" before things which are not useful
	     ;; non-interactively.  Besides, if someone wants their other
	     ;; aliases for shell commands then they can still have them.
	     (call-process shell-file-name nil t nil
			   shell-command-switch command)
	     (exchange-point-and-mark t))
    ;; Preserve the match data in case called from a program.
    (save-match-data
      (if (string-match "[ \t]*&[ \t]*$" command)
	  ;; Command ending with ampersand means asynchronous.
	  (progn
	    (background (substring command 0 (match-beginning 0))))
	(shell-command-on-region (point) (point) command output-buffer)))))

;; We have a sentinel to prevent insertion of a termination message
;; in the buffer itself.
(defun shell-command-sentinel (process signal)
  (if (memq (process-status process) '(exit signal))
      (message "%s: %s." 
	       (car (cdr (cdr (process-command process))))
	       (substring signal 0 -1))))

(defun shell-command-on-region (start end command
				      &optional output-buffer replace)
  "Execute string COMMAND in inferior shell with region as input.
Normally display output (if any) in temp buffer `*Shell Command Output*';
Prefix arg means replace the region with it.

The noninteractive arguments are START, END, COMMAND, OUTPUT-BUFFER, REPLACE.
If REPLACE is non-nil, that means insert the output
in place of text from START to END, putting point and mark around it.

If the output is one line, it is displayed in the echo area,
but it is nonetheless available in buffer `*Shell Command Output*'
even though that buffer is not automatically displayed.
If there is no output, or if output is inserted in the current buffer,
then `*Shell Command Output*' is deleted.

If the optional fourth argument OUTPUT-BUFFER is non-nil,
that says to put the output in some other buffer.
If OUTPUT-BUFFER is a buffer or buffer name, put the output there.
If OUTPUT-BUFFER is not a buffer and not nil,
insert output in the current buffer.
In either case, the output is inserted after point (leaving mark after it)."
  (interactive (let ((string
		      ;; Do this before calling region-beginning
		      ;; and region-end, in case subprocess output
		      ;; relocates them while we are in the minibuffer.
		      (read-shell-command "Shell command on region: ")))
		 ;; call-interactively recognizes region-beginning and
		 ;; region-end specially, leaving them in the history.
		 (list (region-beginning) (region-end)
		       string
		       current-prefix-arg
		       current-prefix-arg)))
  (if (or replace
	  (and output-buffer
	       (not (or (bufferp output-buffer) (stringp output-buffer)))))
      ;; Replace specified region with output from command.
      (let ((swap (and replace (< start end))))
	;; Don't muck with mark unless REPLACE says we should.
	(goto-char start)
	(and replace (push-mark))
	(call-process-region start end shell-file-name t t nil
			     shell-command-switch command)
	(let ((shell-buffer (get-buffer "*Shell Command Output*")))
	  (and shell-buffer (not (eq shell-buffer (current-buffer)))
	       (kill-buffer shell-buffer)))
	;; Don't muck with mark unless REPLACE says we should.
	(and replace swap (exchange-point-and-mark t)))
      ;; No prefix argument: put the output in a temp buffer,
      ;; replacing its entire contents.
    (let ((buffer (get-buffer-create
		   (or output-buffer "*Shell Command Output*")))
	  (success nil)
	  (exit-status nil)
	  (directory default-directory))
      (unwind-protect
	  (if (eq buffer (current-buffer))
	      ;; If the input is the same buffer as the output,
	      ;; delete everything but the specified region,
	      ;; then replace that region with the output.
	      (progn (setq buffer-read-only nil)
		     (delete-region (max start end) (point-max))
		     (delete-region (point-min) (max start end))
		     (setq exit-status
			   (call-process-region (point-min) (point-max)
						shell-file-name t t nil
						shell-command-switch command))
		     (setq success t))
	    ;; Clear the output buffer, 
	    ;; then run the command with output there.
	    (save-excursion
	      (set-buffer buffer)
	      (setq buffer-read-only nil)
	      ;; XEmacs change
	      (setq default-directory directory)
	      (erase-buffer))
	    (setq exit-status
		  (call-process-region start end shell-file-name
				       nil buffer nil
				       shell-command-switch command))
	    (setq success t))
	;; Report the amount of output.
	(let ((lines (save-excursion
		       (set-buffer buffer)
		       (if (= (buffer-size) 0)
			   0
			 (count-lines (point-min) (point-max))))))
	  (cond ((= lines 0)
		 (if success
		     (display-message
		      'command
		      (if (eql exit-status 0)
			  "(Shell command succeeded with no output)"
			"(Shell command failed with no output)")))
		 (kill-buffer buffer))
		((and success (= lines 1))
		 (message "%s"
			  (save-excursion
			    (set-buffer buffer)
			    (goto-char (point-min))
			    (buffer-substring (point)
					      (progn (end-of-line)
						     (point))))))
		(t 
		 (set-window-start (display-buffer buffer) 1))))))))


(defun start-process (name buffer program &rest program-args)
  "Start a program in a subprocess.  Return the process object for it.
Args are NAME BUFFER PROGRAM &rest PROGRAM-ARGS
NAME is name for process.  It is modified if necessary to make it unique.
BUFFER is the buffer or (buffer-name) to associate with the process.
 Process output goes at end of that buffer, unless you specify
 an output stream or filter function to handle the output.
 BUFFER may be also nil, meaning that this process is not associated
 with any buffer
Third arg is program file name.  It is searched for as in the shell.
Remaining arguments are strings to give program as arguments."
  (apply 'start-process-internal name buffer program program-args))

(defun open-network-stream (name buffer host service)
  "Open a TCP connection for a service to a host.
Returns a subprocess-object to represent the connection.
Input and output work as for subprocesses; `delete-process' closes it.
Args are NAME BUFFER HOST SERVICE.
NAME is name for process.  It is modified if necessary to make it unique.
BUFFER is the buffer (or buffer-name) to associate with the process.
 Process output goes at end of that buffer, unless you specify
 an output stream or filter function to handle the output.
 BUFFER may be also nil, meaning that this process is not associated
 with any buffer
Third arg is name of the host to connect to, or its IP address.
Fourth arg SERVICE is name of the service desired, or an integer
 specifying a port number to connect to."
  (open-network-stream-internal name buffer host service))

(defun shell-quote-argument (argument)
  "Quote an argument for passing as argument to an inferior shell."
  (if (eq system-type 'ms-dos)
      ;; MS-DOS shells don't have quoting, so don't do any.
      argument
    (if (eq system-type 'windows-nt)
	(concat "\"" argument "\"")
      ;; Quote everything except POSIX filename characters.
      ;; This should be safe enough even for really weird shells.
      (let ((result "") (start 0) end)
	(while (string-match "[^-0-9a-zA-Z_./]" argument start)
	  (setq end (match-beginning 0)
		result (concat result (substring argument start end)
			       "\\" (substring argument end (1+ end)))
		start (1+ end)))
	(concat result (substring argument start))))))

(defun exec-to-string (command)
  "Execute COMMAND as an external process and return the output of that
process as a string"
  ;; by "William G. Dubuque" <wgd@zurich.ai.mit.edu>
  (with-output-to-string
    (call-process shell-file-name nil t nil "-c" command)))

(defalias 'shell-command-to-string 'exec-to-string)

;;; process.el ends here
