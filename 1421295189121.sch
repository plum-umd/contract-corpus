((module f racket
  (provide (contract-out [f (integer? . -> . integer?)]))
  (define (f n)
    (/ 1 (- 100 n))))

(module user racket (require (submod ".." f)) (f 100)))

#|Result:
#<void>
Parser: expect one of:
 (require (submod ".." module-name) …)
 (provide provide-spec …)
 (define x v)
 (struct id (id …))
given:
(f 100)
  

|#
