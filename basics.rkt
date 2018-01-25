#lang racket

; Adding two numbers.
(+ 3 5)

; Adding more numbers.
(+ 2 3 5 7)

; Subtraction.
(- 8 5)

; Subtraction with more numbers.
(- 8 5 1)

; Multiplication.
(* 9 5)

; Division
(/ 81 3)

; The Little Schemer, The Fifth Commandment:
;   When building a value with +, always use 0 for the value of the
;   terminating line, for adding 0 does not change the value of an addition.
;   When building a value with x, always use 1 for the value of the
;   terminating line, for multiplying by 1 does not change the value of a multiplication.
(+)
(*)

; Defining names.
(define pi 3.14)

; Retrieving names.
pi

; Anonymous functions.
(lambda (x) (+ x 1))

; Defining and calling anonymous functions in one go.
((lambda (x) (+ x 1)) 3)

; Giving a function a name.
(define plusone (lambda (x) (+ x 1)))

; Using a function.
(plusone 9)

; Shorthand for defining a function - avoiding lambda.
(define (cube x) (* x x x))
(cube 2)

; Four arguments.
(define (quadratic a b c x) (+ (* a x x) (* b x) c))
; 3x^2 + 2x + 1 with x = 4
(quadratic 3 2 1 4)