((module foo racket
  (provide (contract-out [foo (integer? . -> . (or/c string? integer?))]))
  (define (foo n)
    (if (< 10 n) "hello" (if (> 5 n) #t 5)))))

#|Result:
#<void>
Contract violation: 'foo' violates its own contract.
Value
 #t
violates predicate
 (or/c string? integer?)
An example module that breaks it:
 (module user racket (require (submod ".." foo)) (foo 4))

  

|#
