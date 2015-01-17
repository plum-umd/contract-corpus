((module min racket
  (provide (contract-out [min (number? number? . -> . number?)]))
  (define (min x y)
    (if (< x y) x y)))

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
Contract violation: 'min' violates '<'.
Value
 0+1i
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." min)) (min 0+1i 0))

  
Program is safe

|#
