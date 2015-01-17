((module fib racket
  (provide (contract-out [f (integer? . -> . integer?)]))
	(define (fib n)
  	(if (<= n 2)
        1
      	(+ (fib (- n 1)) (fib (- n 2))))))

(require fib)
(fib 2))

#|Result:
#<void>
cadr: contract violation
  expected: (cons/c any/c pair?)
  given: 'fib
  
Program is safe

|#
