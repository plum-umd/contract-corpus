((module min racket
  (provide (contract-out [min (number? number? . -> . real?)])))

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

Program is safe
Program is safe

|#
