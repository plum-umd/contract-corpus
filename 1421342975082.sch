((module f racket
  (provide (contract-out [f (</c 0) . -> . (</c 0)]))
  (define (f n)
    (+ 1 n))))

#|Result:
#<void>
Parser: expect contracted clause as one of:
 (id contract)
 (struct id ([id contract] …))
given:
(-> f (</c 0) (</c 0))
  
Program is safe

|#
