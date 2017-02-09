#lang racket

; This script will contain an example of the RSA algorithm, once it's finished.

; Define p and q to be two primes numbers.
(define p 11)
(define q 19)

; n is p times q.
(define n (* p q))

; phi_n is Euler's totient function called on n: phi(n).
(define phi_n (* (- p 1) (- q 1)))

; This function tests if two numbers, a and b, are coprime.
(define (coprime? a b) (if (= 1 (gcd a b)) #t #f))


; TODO



(define (coprimesX k n)
  (if (= k 1)
    null
    (if (coprime? k n)
        (cons k (coprimesX (- k 1) n))
        (coprimesX (- k 1) n))))
(define (coprimes n) (reverse (coprimesX n n)))

(define cop_n (coprimes n))

(define e (list-ref cop_n (floor (/ (length cop_n) 2))))

(define (privatesX d e)
  (if (= d 1)
      null
      (if (= 1 (modulo (* d e) phi_n))
          (cons d (privatesX (- d 1) e))
          (privatesX (- d 1) e))))
(define (privates e) (reverse (privatesX (- e 1) e)))
(privates e)

;
;ds = [d for d in range(1, phi_n) if (d * e % phi_n) == 1]
;# [65]
;d = ds[0]
;print("Private key is: %d" % d)
;
;print("%d x %d = %d (mod %d)" % (e, d, e * d, phi_n))
;# 325
;
;print("Full public key: ", (e, n))
;# (5, 133)
;
;print("Full private key: ", (d, n))
;# (65, 133)
;
;m = 81
;print("Message is %d." % m)
;
;c = (m**e) % n
;print("Encrypted text is %d." % c)
;# 131
;
;m_d = c**d % n
;print("Decrypted message is %d." % m_d)
;# 80
;
