((module f racket
  (provide (contract-out [f (-> (listof integer?) integer?)]))
  (define (f n)
    (/ 1 (- 100 (car n))))))

#|Result:
#<void>
Contract violation: 'f' violates 'car'.
Value
 empty
violates predicate
 cons?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f empty))

  

|#
