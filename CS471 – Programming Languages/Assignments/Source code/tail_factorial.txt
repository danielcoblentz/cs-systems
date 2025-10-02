#!/usr/bin/guile -s
!#

(define (tail-factorial n a)
    (if (= n 0)
        a
        (tail-factorial (- n 1) (* n a)))
  )

(display (tail-factorial 5 1))
(newline)