#lang racket

(define p 11)
(define q 19)

(define n (* p q))

(define phi_n (* (- p 1) (- q 1)))



;gcd = lambda m, n: m if not n else gcd(n, m % n)
;
;# Try p = 7.
;p = 11
;q = 19
;n = p * q
;print("%d x %d = %d" % (p, q, n))
;# 133
;
;phi_n = (p - 1) * (q - 1)
;print("phi(%d) = (%d - 1) x (%d - 1) = %d" % (n, p, q, phi_n))
;# 108
;
;es = [e for e in range(2, phi_n) if gcd(e, phi_n) == 1]
;print("Co-prime with %d: %s" % (phi_n, str(es)))
;e = es[int(len(es) / 3)]
;print("Picked public key: %d" % e)
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
