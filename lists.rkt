#lang racket

; The empty list.
null

; Constructing a list from the empty list.
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

; Check if a list is empty.
(null? l)

; True and False values in Racket.
#t
#f
