((module m racket
  (provide
   (contract-out
    [f (s? . -> . boolean?)]))
  
  
  (struct s ())
  
  (define (f x) "hi"))
)

#|Result:
#<void>
Contract violation: 'm' violates its own contract.
Value
 "hi"
violates predicate
 boolean?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (f (s)))

  
Program is safe

|#
