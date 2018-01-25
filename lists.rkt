#lang racket

; The empty list.
null

; The Little Schemer, Commandment 2:
;   Use cons to build lists.
; The Little Schemer, The Law of Cons:
;   The primitive cons takes two arguments.
;   The second argument to cons muts be a list.
;   The result is a list.
; Constructing a list from the empty list.
(display "\ncons:\n")
(cons 5 null)
(cons 4 (cons 5 null))
(cons 3 (cons 4 (cons 5 null)))
(cons 2 (cons 3 (cons 4 (cons 5 null))))
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null)))))

; Shorthand for constructing a list.
(list 1 2 3 4 5)

; Giving a list a name.
(define l (list 1 2 3 4 5))

; The Little Schemer, The Law of Car:
;   The primitive car is defined only for non-empty lists.
; The first element of a list.
(car l)

; The Little Schemer, The Law of Cdr:
;   The primitive cdr is defined only for non-empty lists.
;   The cdr of any non-empty list is always another list.
; The rest of the list.
(cdr l)
; The second element of the list.
(car (cdr l))
(cadr l)

; The Little Schemer, The Law of Null?:
;   The primitive null? is defined only for lists.
; Check if a list is empty.
(null? l)

; True and False values in Racket.
#t
#f

; Check if something is list.
; Watch out for the null list.
(pair? 1)
(pair? (list 1))
(pair? (list 1 2))
(pair? (car l))
(pair? (cdr l))
(pair? null)

; Check if something is not a list.
(define (atom? x)
  (if (or (pair? x) (null? x))
      #f
      #t))

(atom? (list 1 2))
(atom? 1)
(atom? #t)
(atom? null)

; The Little Schemer, The Law of Eq?:
;   The primitive eq? takes two arguments.
;   Each must be a non-numeric atom.
(define a "hello")
(define b "hello")
(define m 1)
(define n 2)
(eq? a b)
(eq? m n)
(eq? m m)
(eq? 'x 'y)
(eq? 'x 'x)
(eq? 1 1)