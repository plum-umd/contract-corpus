((module m racket
  (define (f x) x)
  (provide 
   (contract-out 
    [f (-> (>/c 0) any/c)])))
)

#|Result:
#<void>
Contract violation: 'm' violates '>'.
Value produced by
 (begin (struct s₁ ()) (s₁))
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (begin (struct s₁ ()) (f (s₁))))

  
Program is safe

|#
