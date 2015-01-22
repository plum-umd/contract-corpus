(module f racket
  (provide (contract-out 
            [f (->i ([x number?]
                     [y (x) (>=/c x)])
                    [res (x y) (and/c number? (>=/c (+ x y)))])]))

  (define (f x y)
    (+ x y)))
