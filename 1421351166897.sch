(module m racket
  (define (id-num x) x)
  (define (id-str x) (id-num x))
  (provide
   (contract-out
    [id-num (-> number? number?)]
    [id-str (-> string? string?)])))
