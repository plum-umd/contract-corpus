(module f racket
  (provide (contract-out [f (-> integer? integer?)]))
  (define (even? n) (if (zero? n) #t (if (= n 1) #f (even? (- n 2)))))
  (define (f n)
    (if (zero? n)
        1
        (if (even? n)
            (f (/ n 2))
            (f (+ 1 (* n 3)))))))
