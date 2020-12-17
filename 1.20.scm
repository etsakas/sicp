;#lang sicp
;
; substitution model for applicative-order evaluation
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd 40 6)
;(gcd 6 (remainder 40 6))
;(gcd 6 4)
;(gcd 4 (remainder 6 4))
;(gcd 4 2)
;(gcd 2 (remainder 4 2))
;(gcd 2 0)
;0
; 4 remainder operations
;
;
; substitution model for normal-order evaluation
;(gcd 206 40)
;(if (= 40 0)
;    206
;    (gcd 40 (remainder 206 40)))
;
;(gcd 40 (remainder 206 40))
;(if (= (remainder 206 40) 0) ;6
;    40
;    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;(if (= (remainder 40 (remainder 206 40)) 0) ; 4
;    (remainder 206 40)
;    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
;(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;    (remainder 40 (remainder 206 40))
;    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;
;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))

; FINAL VALUE
; number of remainder operations = number inside ifs and final value evaluation = 18
