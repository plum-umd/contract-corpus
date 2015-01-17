((module f racket
  (provide (contract-out [f ((and/c integer? (lambda (x) (not (= 100 x)))) . -> . any/c)]))
  (define (f n)
    (if (= n 99)
        1
        (/ 1 (- 100 n)))))

(require 'f)
(f 100))

#|Result:
#<void>
Contract violation: 'top-level' violates 'f'.
Value
 100
violates predicate
 (and/c integer? (λ (x) (false? (= 100 x))))
An example module that breaks it:
 (module user racket (require (submod ".." top-level)) (top-level))

  
Program is safe

|#
