#!/usr/bin/guile -s
!#

(define (compare x y)
  (cond 
  ((> x y) (list x 'is 'bigger 'than y))
  ((< x y) (list x 'is 'smaller 'than y))
  (#t (list x y "are equal"))
  ))

(display (compare 4 9.0))
(newline)

(display (compare 4 4))
(newline)

