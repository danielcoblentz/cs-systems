#!/usr/bin/guile \
-e main -s
!#

(define foo 
(lambda (L) 
 (car (cdr L))
))

(define (main command-line)
  (display (foo (cdr command-line)))
  (newline))