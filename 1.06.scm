#lang sicp
;The new-if is a function
;Unlike a function, if won't execute the else statement if the 'then' statement is true
;The applicative order evalution if applied in function
;Since sqrt-iter function is passed as an argument in the new-if, which itself
;is inside a sqrt-iter, the intepreter will try to evaluate that argument
;The result is an infinity loop