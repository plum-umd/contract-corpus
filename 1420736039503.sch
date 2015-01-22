(module makelist racket
  ;;makelist consumes a list and an object and creates a makelisted list with the object
  ;;as the most makelisted item
  (provide (contract-out [makelist (any/c any/c any/c . -> . (listof any/c))]))
  (define (makelist a b c)
    (cons a (cons b (cons c empty)))))

(require 'makelist)
(makelist 1 2 3)
(makelist '(1 2 3) 2 3)

