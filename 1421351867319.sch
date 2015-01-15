((module m racket
  (define (loop x) 
    (loop x)
    "hi")
  
  (provide
   	(contract-out 
     [loop (-> number? number?)])))
           


)

#|Result:
#<void>
Parser: expect one of:
 (require (submod ".." module-name) …)
 (provide provide-spec …)
 (define x v)
 (struct id (id …))
given:
(define (loop x) (loop x) hi)
  
Program is safe

|#
