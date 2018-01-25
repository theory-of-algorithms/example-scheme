#lang racket

; The Little Schemer, The Ninth Commandment:
;   Abstract common patterns with a new func­tion.
(define (square x) (* x x))
(square 2)
(define (quadruple x) (* x x x x))
(quadruple 2)
(define (twice f) (lambda (x) (f (f x))))
((twice square) 2)


; The Little Schemer, The Eighth Commandment:
;    Use help functions to abstract from represen­tations.

; A representaion of four.
(define four '(() () () ()))

; Arithmetic from The Little Schemer.
; Returns true if n represents zero.
(define (sero? n) (null? n))
; Adds one to a representation of n.
(define (edd1 n) (cons null n))
; Subtracts one from a representation of n.
(define (zub1 n) (cdr n))
; Adds two numbers together.
(define (pluz n m) (if (sero? m) n (edd1 (pluz n (zub1 m)))))

; Is null zero?
(sero? null)
; Is four zero?
(sero? four)
; Name zero.
(define zero null)
(sero? zero)
(edd1 four)
(zub1 four)
(pluz four four)

; Convert the representations to numbers.
(define (toint x) (if (null? x) 0 (+ 1 (toint (cdr x)))))
(toint four)
(toint (pluz four four))


; variadics - writing functions with a variable number of arugments.
(define (squares-helper l)
  (if (null? l)
    null
    (cons (* (car l) (car l)) (squares-helper (cdr l)))))
(define (squares . l) (squares-helper l))

(squares-helper (list 1 2 3))
(squares 1 2 3)

; The Little Schemer, The Sixth Commandment:
;   Simplify only after the function is correct.