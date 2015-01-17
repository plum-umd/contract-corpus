((module f racket
  (provide (contract-out 
            [f (->i ([x number?])
                    [res (x) (and/c number? (>=/c 0))])]))

  (define (f x)
    (+ x y))))

#|Result:
#<void>
Parser: Unknown symbol y in module f
  
Program is safe

|#
