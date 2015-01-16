(  (module fact racket
    (define (factorial x)
      (if (zero? x)
          1
          (* x (factorial (sub1 x)))))
    
    
    (provide 
     (contract-out 
      [factorial (-> (λ (x) (>= x 0)) (λ (x) (>= x 0)))])))
  )

#|Result:
#<void>
Contract violation: 'fact' violates '>='.
Value produced by
 (begin (struct s₃ ()) (s₃))
violates predicate
 real?
An example module that breaks it:
 (module user racket
  (require (submod ".." fact))
  (begin (struct s₃ ()) (factorial (s₃))))

  
Program is safe

|#
