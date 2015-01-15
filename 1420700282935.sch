((module m racket
  (provide (contract-out [x integer?]))
  (define x 5)))

#|Result:
#<void>
Parser: Expect one of:
 (require (submod ".." module-name) …)
 (provide/contract (x c) …)
 (define x v)
 (struct name (field …))
.Given:
(provide (contract-out (x integer?)))
  

|#
