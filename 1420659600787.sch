((module m racket

  (provide/contract [f (any/c . -> . integer?)])

  (define (f x)
    (+ x 5)))



)

#|Result:
#<void>
Contract violation: 'm' violates '+'.
Value
 (s₀)
violates predicate
 number?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (begin (struct s₀ ()) (f (s₀))))

  

|#
