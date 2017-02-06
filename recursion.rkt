#lang racket

; Recursive sum function using lambda - take a list of numbers and add them.
(define sumlamb (lambda (l)
  (if (null? l)
      0
      (+ (car l) (sumlamb (cdr l))))))
; Call the function with a five element list.
(sumlamb (list 1 2 3 4 5))


; Recursive sum function shorthand (avoiding lambda) - take a list of numbers and add them.
(define (sum l)
  (if (null? l)
      0
      (+ (car l) (sum (cdr l)))))
; Call the function with a five element list.
(sum (list 1 2 3 4 5))

; Mult function - take a list of numbers and multiply them.
(define (mult l)
  (if (null? l)
      1
      (* (car l) (mult (cdr l)))))
; Call the function with a five element list.
(mult (list 1 2 3 4 5))

; Define a generic function with the above pattern (from sum and mult).
; oper is the operation to apply to the function elements.
; id is the identity for oper (when used with oper nothing changes).
(define (f oper id l)
  (if (null? l)
      id
      (oper (car l) (f oper id (cdr l)))))

; Now define fsum, which does the same thing as sum above, but define it using f.
; Note that f takes three arguments, and all fsum does is hard-code two of those.
(define (fsum l) (f + 0 l))
; Test it out.
(fsum (list 1 2 3 4 5))

; Then define mult with it too.
(define (fmult l) (f * 1 l))
; Test that out.
(fmult (list 1 2 3 4 5))

; Factorial function - recursion on a number rather than a list.
(define (fac n)
  (if (= n 0)
      1
      (* n (fac (- n 1)))))
; Test it out.
(fac 3)
(fac 10)