((module f racket
  (provide (contract-out 
            [f (->i ([x number?]
                     [y number?])
                    [res (x) (and/c number? (>=/c 0))])]))

  (define (f x y)
    (+ x 9)))


)

#|Result:
#<void>
->i: Please specify full dependency (x y) instead of (x) for now
  
Program is safe

|#
