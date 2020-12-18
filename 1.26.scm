#lang sicp

; initial expmod has complexity
; T(n) = T(n/2) + c => O(logn) by master theorem
; Louis's modified expmod has complexity
; T(n) = 2*T(n/2) + c => O(n)
; so the modified version will take more time to execute