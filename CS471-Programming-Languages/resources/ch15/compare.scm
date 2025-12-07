#!/usr/bin/guile -s
!#

(define (compare x y)
  (cond
    ((> x y) (format #f "~a is bigger than ~a" x y))
    ((< x y) (format #f "~a is smaller than ~a" x y))
    (else    (format #f "~a and ~a are equal" x y))))

(display (compare 4 9.0))
(newline)

(display (compare 4 4))
(newline)
