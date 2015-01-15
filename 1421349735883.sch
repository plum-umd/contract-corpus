(                                                                                                                                                                                                                                             
  (module fact racket                                                                                                                                                                                                                        
    (define (factorial x)                                                                                                                                                                                                                    
      (if (zero? x)                                                                                                                                                                                                                          
          1                                                                                                                                                                                                                                  
          (* x (factorial (sub1 x)))))                                                                                                                                                                                                       
    (provide (contract-out [factorial (-> (>=/c 1) (>=/c 1))])))    )

#|Result:
#<void>
Contract violation: 'fact' violates '>='.
Value
 0.976
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." fact)) (factorial 0.976))

  
Program is safe

|#
