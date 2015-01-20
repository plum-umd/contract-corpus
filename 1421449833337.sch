(
(module argmin racket
  (provide
    (contract-out
      [argmin ((-> any/c real?) (cons/c any/c (listof any/c)) . -> . any/c)]))

  (define (argmin f xs)
    (argmin/acc f (car xs) (f (car xs)) (cdr xs)))

  (define (argmin/acc f a b xs)
    (if (empty? xs)
        a
        (if (< b (f (car xs)))
            (argmin/a f a b (cdr xs))
            (argmin/a f (car xs) (f (car xs)) (cdr xs))))))
)