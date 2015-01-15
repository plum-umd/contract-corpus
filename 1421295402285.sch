((module fact racket
  (define (factorial x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x)))))
  (provide (contract-out [factorial (-> number? number?)]))
  (factorial 5)))

#|Result:
#<void>
Parser: expect one of:
 (require (submod ".." module-name) …)
 (provide provide-spec …)
 (define x v)
 (struct id (id …))
given:
(factorial 5)
  

|#
