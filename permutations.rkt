#lang racket

; Adapted from: https://docs.racket-lang.org/reference/pairs.html

; A permutation of a list is a rearrangement of its elements.
; So, '(2 3 1) is a permutation of '(1 2 3), and so is '(3 2 1).
; The permutations function in racket returns a list containing
; all of the permutations of the list you pass to it.
; The result is thus a list of lists.
; The number of elements in the returned list is n! where n is the
; size of the original list.
(permutations (list 1 2 3))

; The set of combinations of size t of a list (or set) is the set containing all
; selections of size t that can be created from the items of the original list,
; where order is not important.
; There are (n choose t) elements in the returned list, where n is the size
; of the original list.
(combinations (list 1 2 3 4 5 6) 2)

; We can also omit the second argument to combinations, and we will get all
; the possible selections from the original list.
; This is the union of the combinations of size 0, 1, 2, ..., n.
; This is like the power set of the original list, but the elements are lists.
(combinations (list 1 2 3 4 5 6))

; shuffle returns a randomly selected permutation of a list.
(shuffle '(1 2 3 4))

; cartesian-product takes two or more lists and returns a list containing all
; possible ways of selecting one element from each of the lists and putting them
; in a list. This is like the cartesian product for sets, but for lists.
(cartesian-product '(1 2 3) '(4 5 6))