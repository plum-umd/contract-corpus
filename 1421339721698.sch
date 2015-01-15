((module f racket
  (provide (contract-out [f ((</c 0) . -> . real?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>
Contract violation: 'f' violates '<'.
Value
 0.360
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 0.360))

  

|#
