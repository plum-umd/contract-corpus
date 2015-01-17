((module square racket
  (provide (contract-out 
            [sqr (->i ([x integer?])
                      [res (x) (>=/c x)])]))
  (define (sqr n)
    (* n n))))

#|Result:
#<void>

Program is safe
Program is safe

|#
