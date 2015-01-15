((module f racket
  (provide (contract-out [f ((and/c real? (</c 0)) . -> . real?)]))
  (define (f n)
    (/ 1 (- 100 n)))))

#|Result:
#<void>

Program is safe

|#
