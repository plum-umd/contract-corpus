((module f racket
  (provide (contract-out [f (integer? . -> . any/c)]))
  (define (f n)
    (if (= n 100)
        1
        (/ 1 (- 100 n)))))

(require 'f)
(f 100))

#|Result:
#<void>

Program is safe
Program is safe

|#
