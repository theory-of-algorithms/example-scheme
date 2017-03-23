#lang racket

; Ian McLoughlin
; ianmcloughlin.github.io

; This file contains an implementation of a brute force algorithm to
; solve the subset sum decision problem.

; This procedure returns trun if some (non-empty) sublist of l sums to 0.
(define (subsetsum l)
  ; If there is more than one sublist then return true.
  ; Note the null list always sums to zero but isn't considered a solution.
  (> (length
   ; Filter out all the sublists that don't sum to zero.
   (filter
    zero?
    ; Map all of the combinations of l to a function that sums the elements of a list.
    (map
     (lambda (i) (apply + i))
     (combinations l)))) 1))

; Define a list to test the function.
(define L (list -10 -2 -4 9 5 8 6 1 10 20 3 -5 5 6 10 15 20))

; Call the function.
(subsetsum L)