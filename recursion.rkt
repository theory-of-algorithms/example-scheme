#lang racket

; Factorial function.
(define (fac n)
  (if (= n 1)
      1
      (* n (fac (- n 1)))))

(fac 3)