((module lastpair racket
  (provide/contract
   [lastpair (cons? . -> . cons?)])
  (define (lastpair x)
    (if (cons? x) (lastpair (cdr x)) x)))

(module user racket 
  (require (submod ".." lastpair))
  (lastpair (cons 0.290 0.227))))

#|Result:
#<void>
Parser: Expect one of:
 (require (submod ".." module-name) …)
 (provide/contract (x c) …)
 (define x v)
 (struct name (field …))
.Given:
(lastpair (cons 0.29 0.227))
  

|#
