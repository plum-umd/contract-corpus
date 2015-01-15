((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n))))

(require 'f)
(/ 1 0))

#|Result:
#<void>
Contract violation: 'top-level' violates '/'.
Value
 0
violates predicate
 (≠/c 0)
An example module that breaks it:
 (module user racket (require (submod ".." top-level)) (top-level))

  

|#
