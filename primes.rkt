#lang racket

(define (divs n) 
  (filter (lambda (i) (= 0 (modulo n i))) (range 2 (floor (sqrt n)))))

(divs 141)