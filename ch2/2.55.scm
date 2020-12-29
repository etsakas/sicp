#lang sicp

(car ''abracadabra)
(car (cdr ''abracadabra))
(cdr ''abracadabra)

; see footnote 33 page 194
; (car ''abracadabra) = (car (quote (quote abracadabra))) = quote

;quote
;abracadabra
;(abracadabra)