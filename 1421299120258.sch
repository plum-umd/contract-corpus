(
(module f racket
  (provide (contract-out [f (-> (and/c (not/c (=/c 100)) integer?) integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'f' violates '='.
Value produced by
 (begin (struct s₀ ()) (s₀))
violates predicate
 number?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (begin (struct s₀ ()) (f (s₀))))

  

|#
