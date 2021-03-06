(module lastpair racket
  (provide/contract
   [lastpair (cons? . -> . cons?)])
  (define (lastpair x)
    (if (cons? x) (lastpair (cdr x)) x)))

(module user racket 
  (require (submod ".." lastpair))
  (lastpair (cons 0.290 0.227)))
