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

; There's a shorthand for using quote. Use a single quote.
'a
'1
'(a b c)
'(+ 1 3)

; Create a list containing a, b and c.
(define l (list 1 2 3))
(define m '(a b c))
l
m