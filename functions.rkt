#lang racket

; The Little Schemer, The Ninth Commandment:
;   Abstract common patterns with a new func­tion.
(define (square x) (* x x))
(square 2)
(define (quadruple x) (* x x x x))
(define (twice f) (lambda (x) (f (f x))))
((twice square) 2)


; The Little Schemer, The Eighth Commandment:
;    Use help functions to abstract from represen­tations.

; A representaion of four.
(define four '(() () () ()))

; Arithmetic from The Little Schemer.
(define sero? (lambda (n) (null? n)))
(define edd1 (lambda (n) (cons (quote ()) n)))
(define zub1 (lambda (n) (cdr n)))
(define pluz (lambda (n m) (cond ((sero? m ) n) (else (edd1 (pluz n (zub1 m)))))))

(sero? four)
(sero? null)
(define zero null)
(sero? zero)
(edd1 four)
(zub1 four)
(pluz four four)

(define (toint x)
  (if (null? x) 0 (+ 1 (toint (cdr x)))))
(toint four)
(toint (pluz four four))


; The Little Schemer, The Sixth Commandment:
;   Simplify only after the function is correct.