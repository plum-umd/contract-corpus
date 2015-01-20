((module m racket
  (provide (contract-out [f (->i ([x integer?]) [res (x) (>=/c x)])]))
  (define (f n)
    (* n n))))