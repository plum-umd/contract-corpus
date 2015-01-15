((module f racket
  (provide
   (contract-out
    [f ((or/c number? string?) cons? . -> . number?)]))
  (define (f input extra)
    (cond
      [(and (number? (car extra)))
       (+ input (car extra))]
      [(number? (car extra))
       (+ (string-length input) (car extra))]
      [else 0]))))

#|Result:
#<void>
Contract violation: 'f' violates '+'.
Value
 "jB10lJ5hvE9"
violates predicate
 number?
An example module that breaks it:
 (module user racket
  (require (submod ".." f))
  (f "jB10lJ5hvE9" (cons 0.378 0.238)))

  

|#
