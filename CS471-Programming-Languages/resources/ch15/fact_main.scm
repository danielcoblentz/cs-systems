#!/usr/bin/guile \
-e main -s
!#
(define (fact n)
  (if (zero? n) 1
    (* n (fact (- n 1)))))

(define (main command-line)
  (display (fact (string->number (cadr command-line))))
  (newline))
