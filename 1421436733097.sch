((module factorial racket
  (define (fact x)
    (if (zero? x)
        1
        (* x (fact (sub1 x)))))
  
  (provide
   (contract-out
    [fact (-> (>=/c 0) (and/c integer? (>=/c 0)))])))

(require 'factorial)
(fact 1.5)
)

#|Result:
#<void>
Contract violation: 'factorial' violates its own contract.
Value
 1.5
violates predicate
 integer?
An example module that breaks it:
 (module user racket (require (submod ".." factorial)) (fact 1.5))

  
Program is safe

|#
