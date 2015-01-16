((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]
                         [divides (-> positive? positive? boolean?)]
                         ))

  (define (positive? x)
    (and (integer? x) (<= 0 x)))
  
  (define (divides a b)
    (cond [(= 0 b) #t]
          [(< b a) #f]
          [else (divides a (- b a))]))

  (define (any-divides xs x)
    (cond [(empty? xs) #f]
          [else (or (divides (car xs) x) (any-divides (cdr xs) x))]))
 
  (define (sum-from init limit step mods)
    (cond [(<= limit init) 0]
          [(any-divides mods init) (sum-from (+ init step) limit step mods)]
          [else (+ init (sum-from (+ init step) limit step mods))]))

  (define (f n)
    (+ (sum-from 3 n 3 '())
       (sum-from 5 n 5 '(3))))
  
   
))

#|Result:
#<void>
.b: contract violation
  expected: (or/c Number #f #t Symbol String)
  given: '()
  in: the 1st argument of
      (-> (or/c Number #f #t Symbol String) any)
  contract from: 
      /srv/www/soft-contract/lang.rkt
  blaming: /srv/www/soft-contract/read.rkt
   (assuming the contract is correct)
  at: /srv/www/soft-contract/lang.rkt:22.14
  
Program is safe

|#
