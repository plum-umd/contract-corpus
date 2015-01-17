((module m racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . 
                             (integer? . -> . true?))]))
  (define (f g)
    (λ (n)
      (= (g n) (g n))))))

#|Result:
#<void>

Program is safe
Program is safe

|#
