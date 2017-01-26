#lang racket

; Adding two numbers.
(+ 3 5)

; Adding more numbers.
(+ 2 3 5 7)

; Subtraction.
(- 8 5)

; More numbers.
(- 8 5 1)

; Multiplication.
(* 9 5)

; Division
(/ 81 3)

; Defining names.
(define pi 3.14)

; Retrieving names.
pi

; Anonymous functions.
(lambda (x) (+ x 1))

; Using anonymous functions.
((lambda (x) (+ x 1)) 3)

; Giving a function a name.
(define plusone (lambda (x) (+ x 1)))

; Use the function.
(plusone 9)

; Another function.
(define cube (lambda (x) (* x x x)))
(cube 2)

; Four arguments.
(define quadratic (lambda (a b c x) (+ (* a x x) (* b x) c)))
; 3x^2 + 2x + 1 with x = 4
(quadratic 3 2 1 4)


; Function definition shorthand.
(define cube2 (lambda (x) (* x x x)))
(define (cube3 x) (* x x x))

(cube 3)
(cube2 3)
(cube3 3)