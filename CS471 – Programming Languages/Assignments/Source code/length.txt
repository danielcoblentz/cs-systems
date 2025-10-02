#!/usr/bin/guile -s
!#

(define (length-0 lst)
  (if (null? lst) 0
      (+ 1 (length-0 (cdr lst)))))

(display (length-0 '(c a n y o n)))
(newline)

(define (length-1 lst result)
  (if (null? lst) result
      (length-1 (cdr lst) (+ result 1))))

(display (length-1 '(c a n y o n) 0))
(newline)
