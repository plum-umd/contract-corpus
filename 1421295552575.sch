((module fact racket
  (provide (contract-out [factorial (-> (>=/c 0) (>=/c 0))])
  (define (factorial x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x)))))
  )))

#|Result:
#<void>
Parser: expect provide spec as one of:
 id
 (contract-out p/c-item …)
given:(define (factorial x) (if (zero? x) 1 (* x (factorial (sub1 x)))))
  

|#
