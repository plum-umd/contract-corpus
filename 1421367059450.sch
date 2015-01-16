((module f racket

  (define/contract (get-answer limit)
    (-> positive? positive?)
    (define threes (in-range 3 limit 3))
    (define fives  (in-range 5 limit 5))
    (define merged (stream-merge-unique-ints threes fives))
    (stream-fold + 0 merged))

  
  
))

#|Result:
#<void>
Parser: expect one of:
 (require (submod ".." module-name) …)
 (provide provide-spec …)
 (define x v)
 (struct id (id …))
given:
(define/contract
 (get-answer limit)
 (-> positive? positive?)
 (define threes (in-range 3 limit 3))
 (define fives (in-range 5 limit 5))
 (define merged (stream-merge-unique-ints threes fives))
 (stream-fold + 0 merged))
  
Program is safe

|#
