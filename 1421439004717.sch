(module m racket
  (provide (contract-out [f ((integer? . -> . integer?) . -> . 
                             (integer? . -> . true?))]))
  (define (f g)
    (lambda (n)
      (= (g n) (g n)))))

