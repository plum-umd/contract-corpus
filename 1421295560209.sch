((module fact racket
  (provide (contract-out [factorial (-> (>=/c 0) (>=/c 0))]))
  (define (factorial x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x)))))
  ))