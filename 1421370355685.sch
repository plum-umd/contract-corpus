((module m racket
  (provide (contract-out [f (c? . -> . c?)]))
  (define (c? x) (> x 10))
  (define (f x) (f (+ x x)))))

#|Result:
#<void>
Contract violation: 'm' violates '>'.
Value produced by
 (begin (struct s₂ ()) (s₂))
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." m)) (begin (struct s₂ ()) (f (s₂))))

  
Program is safe

|#
