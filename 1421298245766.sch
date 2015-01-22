(module lastpair racket
  (provide
   (contract-out [lastpair (cons? . -> . cons?)]))
  (define (lastpair x)
    (if (cons? x) (lastpair (cdr x)) x)))
