((module makelist racket
  ;;makelist consumes a list and an object and creates a makelisted list with the object
  ;;as the most makelisted item
  (provide (contract-out [makelist (any/c any/c any/c . -> . (listof any/c))]))
  (define (makelist a b c)
    (cons a (cons b (cons c empty)))))

(require 'makelist)
(makelist 1 2 3)
(makelist '(1 2 3) 2 3)
)

#|Result:
#<void>
.b: contract violation
  expected: (or/c Number #f #t Symbol String)
  given: '(1 2 3)
  in: the 1st argument of
      (-> (or/c Number #f #t Symbol String) any)
  contract from: 
      /srv/www/soft-contract/lang.rkt
  blaming: /srv/www/soft-contract/read.rkt
   (assuming the contract is correct)
  at: /srv/www/soft-contract/lang.rkt:22.14
  
Program is safe

|#
