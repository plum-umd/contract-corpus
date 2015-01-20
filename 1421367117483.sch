((module f racket
  
  (provide/contract [get-answer (-> natural-number/c natural-number/c)])

  (define (get-answer limit)
    (define threes (in-range 3 limit 3))
    (define fives  (in-range 5 limit 5))
    (define merged (stream-merge-unique-ints threes fives))
    (stream-fold + 0 merged))

  (define (stream-merge-unique-ints a b)
    a)
  
))