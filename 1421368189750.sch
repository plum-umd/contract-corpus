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

;  (define (any-divides xs x)
;    (cond [(empty? xs) #f]
;          [else (or (divides (car xs) x) (any-divides (cdr xs) x))]))
 
;  (define (sum-from init limit step mods)
;    (cond [(<= limit init) 0]
;          [(any-divides mods init) (sum-from (+ init step) limit step mods)]
;          [else (+ init (sum-from (+ init step) limit step mods))]))

  (define (f n)
    (if (divides 2 3) 1 2))
;    (+ (sum-from 3 n 3 '())
;       (sum-from 5 n 5 '(3))))
  
   
))