((module f racket
  (provide (contract-out [f (-> (listof integer?) integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'f' violates '-'.
Value
 empty
violates predicate
 number?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f empty))

  

|#
