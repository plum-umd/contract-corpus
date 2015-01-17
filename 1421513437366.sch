((module f racket
  (provide (contract-out [f ((and/c integer? (not (=/c 100))) . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'f' violates a contract in an application.
Value
 #f
violates predicate
 procedure?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 0))

  
Program is safe

|#
