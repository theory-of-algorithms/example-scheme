#lang racket

; Recursive sum function - take a list of numbers and add them.
; Note that this function is pretty useless as + already provides this functionality.
(define (sum l)
  (if (null? l)
      0
      (+ (car l) (sum (cdr l)))))

; Call the function with a five element list.
(sum (list 1 2 3 4 5))


; Recursive multiply function - take a list of numbers and multiply them.
; Note that this function is pretty useless as * already provides this functionality.
(define (mult l)
  (if (null? l)
      1
      (* (car l) (mult (cdr l)))))

; Call the function with a five element list.
(mult (list 1 2 3 4 5))


; The two functions above look very similar.
; Define a generic function with the pattern (from sum and mult).
; oper is the operation to apply to the function elements.
; id is the identity for oper (when used with oper nothing changes).
(define (f oper id l)
  (if (null? l)
      id
      (oper (car l) (f oper id (cdr l)))))

; Now define fsum, which does the same thing as sum above, but define it using f.
; Note that f takes three arguments, and all fsum does is hard-code two of those.
(define (fsum l) (f + 0 l))

; Test fsum out - same result as sum.
(fsum (list 1 2 3 4 5))

; Then define fmult with it too.
(define (fmult l) (f * 1 l))

; Test fmult out - same as mult.
(fmult (list 1 2 3 4 5))


; We can recurse on lists, as above, or on numbers, as below.
; Factorial function - calculate n!
(define (fac n)
  (if (= n 0)
      1
      (* n (fac (- n 1)))))

; 3! = 6 and 10! = 3,628,800.
(fac 3)
(fac 10)


; Back to lists - let's try reversing a list.
; The rev function below uses the built-in append.
; append is similar to cons, except that it appends to the end of a list,
; and it appends a list of items as opposed to a single item.
; To append a single item, say 5, you have to stick it in a list: (list 5) 
(define (rev l)
  (if (null? l)
      null
      (append (rev (cdr l)) (list (car l)))))

; Test out rev with the list (1 2 3 4 5)
(define m (list 1 2 3 4 5))
(rev m)


; Can we just use cons to reverse a list.
; We can - but we need an acumulator, which is a list that accumulates the reversed list.
; revmwons-aux is a function that takes two arguments, the original list and an accumulator.
; The accumulator is initially the empty list, and at each recursive call it accumulates another element.
(define (revwcons-aux l a)
  (if (null? l)
    a
    (revwcons-aux (cdr l) (cons (car l) a))))

; revwcons-aux works, but note that we always have to pass it a second argument,
; and that second argument is always the empty list.
(revwcons-aux m null)

; Explaining the revwcons-aux function, line by line.
(null? m)
(car m)
(list (car m))
(cdr m)
(null? (cdr m))
(list (car (cdr m)) (car m))
(cdr (cdr m))
(null? (cdr (cdr m)))
(list (car (cdr (cdr m))) (car (cdr m)) (car m))
(cdr (cdr (cdr m)))
(null? (cdr (cdr (cdr m))))
(list (car (cdr (cdr (cdr m)))) (car (cdr (cdr m))) (car (cdr m)) (car m))
(cdr (cdr (cdr (cdr m))))
; etc.

; Let's define a new function that calls revwcons-aux, but fills in the
; second argument for us (i.e. just hard-codes the empty list as the second argument).
(define (revwcons l) (revwcons-aux l null))

; Now we can call revwcons with one argument, rather than calling revwcons-aux with two.
(revwcons m)

; It'll work with symbols too.
(revwcons (list 'a 'b 'c))

; Note that it only reverses the outer list, not any lists with the outer list.
(revwcons (list (list 1 2 3) 'b 'c m))