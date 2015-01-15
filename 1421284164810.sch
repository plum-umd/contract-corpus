((module f racket
  (provide (contract-out [f (-> (listof integer?) integer?)]))
  (define (f n)
    (if (null? n) 1
    (/ 1 (- 100 (- 1 (car n))))))))

#|Result:
#<void>
Contract violation: 'f' violates '/'.
Value
 0
violates predicate
 (≠/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f (cons -99 empty)))

  

|#
