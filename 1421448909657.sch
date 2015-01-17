((module min racket
  (provide (contract-out [min (real? number? . -> . real?)])))

(module argmin racket
  (provide
    (contract-out
      [argmin ((-> any/c number?) (cons/c any/c (listof any/c)) . -> . any/c)]))
  (require (submod ".." min))
  (define (argmin f xs)
    (cond [(empty? (cdr xs)) (f (car xs))]
          [else (min (f (car xs))
                     (argmin f (cdr xs)))]))))

#|Result:
#<void>
Contract violation: 'argmin' violates 'min'.
Value
 0+1i
violates predicate
 real?
An example module that breaks it:
 (module user racket
  (require (submod ".." argmin))
  (argmin (λ (x) 0+1i) (cons 0 (cons 0 empty))))

  
Program is safe

|#
