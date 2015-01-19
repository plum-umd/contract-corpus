((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (if (= n 0) 
        1
        (* 2.0 (f (sub1 n))))))

(module g racket
  (define (g x) (sub1 x))
  (provide 
   (contract-out [g (->i ([x integer?]) 
                         (res (x) (lambda (r) (> x r))))])))

)