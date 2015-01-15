((module f racket
  (provide (contract-out [f integer? . -> . integer?]))
  (define (f n)
    (+ 1 n))))

#|Result:
#<void>
Parser: expect contracted clause as one of:
 (id contract)
 (struct id ([id contract] …))
given:
(-> f integer? integer?)
  
Program is safe

|#
