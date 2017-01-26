#lang racket

; The empty list.
null

; Constructing a list.
(cons 5 null)
(cons 4 (cons 5 null))
(cons 3 (cons 4 (cons 5 null)))
(cons 2 (cons 3 (cons 4 (cons 5 null))))
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))

; Shorthand for constructing a list.
(list 1 2 3 4 5)
(define l (list 1 2 3 4 5))

; Popping the first element of a list.
(car l)
(cdr l)

; Check if a list is empty.
(null? l)

; True and False.
#t
#f


; Sum function using lambda - take a list of numbers and add them.
(define suml (lambda (l)
  (if (null? l)
      0
      (+ (car l) (suml (cdr l))))))

(suml (list 1 2 3 4 5))


; Sum function shorthand (no lambda) - take a list of numbers and add them.
(define (sum l)
  (if (null? l)
      0
      (+ (car l) (sum (cdr l)))))

(sum (list 1 2 3 4 5))

; Mult function - take a list of numbers and multiply them.
(define (mult l)
  (if (null? l)
      1
      (* (car l) (mult (cdr l)))))

(mult (list 1 2 3 4 5))

; Generic function.
(define (f oper id l)
  (if (null? l)
      id
      (oper (car l) (f oper id (cdr l)))))

(define (fsum l) (f + 0 l))
(fsum (list 1 2 3 4 5))

(define (fmult l) (f * 1 l))
(fmult (list 1 2 3 4 5))



















