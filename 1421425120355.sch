((module fib racket
  (provide (contract-out [fib (integer? . -> . integer?)]))
	(define (fib n)
  	(if (<= n 2)
        1
      	(+ (fib (- n 1)) (fib (- n 2))))))

)

#|Result:
#<void>

Program is safe
Program is safe

|#
