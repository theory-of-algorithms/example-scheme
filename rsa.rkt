#lang racket

; This script will contain an example of the RSA algorithm, once it's finished.

; Define p and q to be two primes numbers.
(define p 11)
(define q 19)

; n is p times q.
(define n (* p q))

; phi_n is Euler's totient function called on n: phi(n).
(define phi_n (* (- p 1) (- q 1)))

; Set e to a random coprime to phi_n, 1 < e < phi_n.
(define e (car (shuffle (filter
  (lambda (i) (= (gcd phi_n i) 1)) (range 2 phi_n)))))

; Set d to an integer with the property de = 1 mod phi_n.
(define d (car (shuffle (filter
  (lambda (i) (= 1 (modulo (* i e) phi_n))) (append (range 2 e) (range (+ e 1) phi_n))))))


; Public key.
(list e n)

; Private key.
(list d n)

; The message.
(define m 100)

; The encrypted message.
(define m_enc (modulo (expt m e) n))

; The decrypted message.
(define m_dec (modulo (expt m_enc d) n))

(list m m_enc m_dec)