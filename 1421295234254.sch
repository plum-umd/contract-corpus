((module f racket
  (provide
   (contract-out
    [f ((or/c number? string?) cons? . -> . number?)]))
  (define (f input extra)
    (cond
      [(and (number? input) (number? (car extra)))
       (+ input (car extra))]
      [(number? (car extra))
       (+ (string-length input) (car extra))]
      [else "foo"]))))

#|Result:
#<void>
Contract violation: 'f' violates its own contract.
Value
 "foo"
violates predicate
 number?
An example module that breaks it:
 (module user racket
  (require (submod ".." f))
  (begin (struct s₀ ()) (f "qA0MKf7v" (cons (s₀) 0.432))))

  

|#
