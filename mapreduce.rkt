#lang racket

; Map and Reduce are important concepts in parallelisation.
; Most programmers will use a for loop when they want to operate
; on each element of list, even when each element is operated on
; individually.

; Suppose we have a function that returns the square of an integer.
(define (square x) (* x x))
; So this return 11 times 11 = 121.
(square 11)

; Let's say we want to square every element on a list l.
; A lot of times programmers will write a for loop that goes
; from i=0 to i=len(l)-1, but totally ignore the value of i.
; Each element of the list will be dealt with atomically - without
; any interference from other elements of the list. So there's no 
; need for the squaring to be done sequentially on each item.
; Compilers have a hard time figuring out if a given for loop
; has to be done sequentially or not. That's where map comes in.
; Map says:
;   "apply this (one-argument) function to each of the elements
;    in the list, and return back a new list with those values.
;    So long as the new values are in the same order as the old
;    values in the original list, I don't care what order you
;    carry out the operations."
; That's good news for parallelisation - almost embarrassingly so.
(map square (list 1 2 3 4 5))

; A closely retated idea is reduce. reduce is used when you want
; to consolidate the elements of a list some how. Say we wanted to
; sum the values that have just been return from map. Well then
; we want to take the list, put pluses in between each of the elements,
; and then evaluate that:
;    (1 + 4 + 9 + 16 + 25)
; That's largely what reduce does. However, there's another trick
; that is again useful for parallelisation. How about we have reduce
; do this equivalent calculation instead:
;    0 + (1 + 4 + 9 + 16 + 25)
; Why would we do that? Well, 0 is the "identity" of addition. Adding
; 0 to something does nothing. Now suppose we have a big, big list of numbers.
; We can keep a running total of the elements of the list we've reduced so far,
; and replace the 0 with that value instead:
;    0 + ((1 + 4 + 9) + (16 + 25))
; We can do the (1 + 4 + 9) on one processor, and use the value eventually
; returned as the "0" for the second processor which can evaluate (16 + 25).

; reduce isn't a built-in in racket, but here's an implemenetation adapted from
;   http://stackoverflow.com/questions/21688283/reduce-function-in-racket
; f is the reduce function (e.g. +), z is the identity (e.g. 0) and l
; is the list to be reduced (e.g. output of map function above).
(define (reduce f z l)
  (if (null? l)
      z
      (f (car l) (reduce f z (cdr l)))))

; Here's the discussed example being called.
(reduce + 0 (map square '(1 2 3 4 5)))

; In racket, the builtin functions foldl and foldr do what reduce does.
; foldr is just like reduce above.
(foldr + 0 (map square '(1 2 3 4 5)))
(foldr + 0 (map square '(1 2 3 4 5)))

; However, foldl reduces from the end of the list.
; That means that we can use it to reverse a list.
(foldr cons '() '(1 2 3 4))
(foldl cons '() '(1 2 3 4))