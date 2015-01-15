((module f racket
  (provide/contract
    [f (integer? . -> . integer?)])

  (define (f n)
    (if (= n 100)
        5
        (/ 1 (- 100 n)))))


(require 'f)
(f 100)
)

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 1.0
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (f 99))

  

|#
