(
(module argmin racket
  (provide
    (contract-out
      [argmin ((-> any/c number?) (cons/c any/c (listof any/c)) . -> . any/c)]))

  (define (argmin f xs)
  (argmin/a f (car xs) (f (car xs)) (cdr xs)))

(define (argmin/a f a b xs)
  (if (empty? xs)
      a
      (if (< b (f (car xs)))
          (argmin/a f a b (cdr xs))
          (argmin/a f (car xs) (f (car xs)) (cdr xs)))))
)
)

#|Result:
#<void>
Contract violation: 'argmin' violates '<'.
Value
 0+1i
violates predicate
 real?
An example module that breaks it:
 (module user racket
  (require (submod ".." argmin))
  (argmin (λ (x) 0+1i) (cons 0 (cons 0 empty))))

  
Program is safe

|#
