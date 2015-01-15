((module f racket
  (provide/contract [f (integer? . -> . integer?)])
  (define (f n)
    (/ 1 (- 100 n))))

(module user racket (require (submod ".." f)) (f 100)))

#|Result:
#<void>
Parser: Expect one of:
 (require (submod ".." module-name) …)
 (provide/contract (x c) …)
 (define x v)
 (struct name (field …))
.Given:
(f 100)
  
Program is safe

|#
