#lang racket

; From https://docs.racket-lang.org/guide/quote.html:
; The quote form produces a constant.
(quote a)
(quote 1)
(quote (a b c))
(quote (+ 1 3))

; You can evaulate quoted expressions using eval.
; When using eval in a script (like this one) you run into namespacing issues.
; This will work in the REPL environment: (eval (quote (+ 1 2)))
; But it won't work here. We can get around it with the following instead:
(define ns (make-base-namespace))
(eval (quote (+ 1 2)) ns)
; Don't worry about this technicality regarding namespaces.
; It won't be examined in this module.


; There's a shorthand for using quote. Use a dingle quote.
'a
'1
'(a b c)
'(+ 1 3)

; Create a list containing a, b and c.
;(define m '(a b c))
(define m (list 1 2 3))
m


; Reverse it - note the use of append (similar to cons).
(define (rev l)
  (if (null? l)
      null
      (append (rev (cdr l)) (list (car l)))))

(rev m)

; Explaining the rev function, line by line.
(null? m)
(car m)
(list (car m))
(cdr m)
(null? (cdr m))
(list (car (cdr m)))
(cdr (cdr m))
(null? (cdr (cdr m)))
(list (car (cdr (cdr m))))
(cdr (cdr (cdr m)))
(null? (cdr (cdr (cdr m))))
(append (cdr (cdr m)) (list (car (cdr m))))
; One line missing.


; Reverse - with cons only.
(cons 1 (list 2 3))

(define (revwcons l)
  (if (null? l)
    null
    (cons (car l) (cdr l))))

(revwcons (list 1 2 3))

(list (list (list 3) 2) 1)









