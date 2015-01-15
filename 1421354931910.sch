((module m racket
  (define (f x) x)
  (provide 
   (contract-out 
    [f (-> (lambda (x) (>= x 0)) any/c)])))
)

#|Result:
#<void>
Contract violation: 'm' violates '>='.
Value produced by
 (begin (struct s₀ ()) (s₀))
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (begin (struct s₀ ()) (f (s₀))))

  
Program is safe

|#
