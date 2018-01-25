#lang racket

; The empty list.
null

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

; The first element of a list.
(car l)
; The rest of the list.
(cdr l)
; The second element of the list.
(car (cdr l))
(cadr l)

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