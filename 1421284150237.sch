((module f racket
  (provide (contract-out [f (-> (listof integer?) integer?)]))
  (define (f n)
    (if (null? n) 1
    (/ 1 (- 100 (car (- 1 n))))))))

#|Result:
#<void>
Contract violation: 'f' violates '-'.
Value
 (cons (• integer?) empty)
violates predicate
 number?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f (cons (• integer?) empty)))

  

|#
