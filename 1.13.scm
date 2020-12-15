#lang sicp

;F(n) = 0 if n=0
;     = 1 if n=1
;     = F(n-1) + F(n-2) if n>=2
;
;φ^2 + φ = 1 => φ=(1 + sqrt(5))/2  , ψ=(1 - sqrt(5))/2
;
;Let F(n)=(φ^n - ψ^n)/sqrt(5)
;
;for n=0 equals 0
;for n=1 equals 1
;for n>2 equals
;F(n) = F(n-1) + F(n-2) =...(use the initial equation)...=(φ^n - ψ^n)/sqrt(5)
;
;For F(n) to be the closest integer to φ^n/sqrt(5)
;it must be that |F(n)-φ^n/sqrt(5)|<1/2 => |ψ^n|/sqrt(5)<1/2 for every n
;
;Its true that |ψ|<1/2<1 => |ψ^(n+1)|<|ψ^n| => |ψ^(n+1)|/sqrt(5)<|ψ^n|/sqrt(5)
;and because ψ^0/sqrt(5)=1/sqrt(5)<1/2, |ψ^n|/sqrt(5) is alwais less than 1/2



