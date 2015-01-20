((define (positive-stream? st)
  (and (stream? st)
       (or (stream-empty? st)
           (positive? (stream-first st)))))

(define/contract (sift n st)
  (-> positive? positive-stream? positive-stream?)
  ;; remove all multiples of n from st
  (cond [(stream-empty? st) empty-stream]
        [(zero? (modulo (stream-first st) n)) (sift n (stream-rest st))]
        [else (stream-cons (stream-first st) (sift n (stream-rest st)))]))

(define/contract (sieve st)
  (-> positive-stream? positive-stream?)
  (cond [(stream-empty? st) empty-stream]
        [else (stream-cons (stream-first st)
                           (sieve (sift (stream-first st)
                                 (stream-rest st))))]))

(define primes (sieve (in-range 2 10000)))

(define/contract (stream-filter-until f st)
  (-> (-> positive? boolean?) positive-stream? positive-stream?)
  (cond [(stream-empty? st) empty-stream]
        [(f (stream-first st)) empty-stream]
        [else (stream-cons (stream-first st)
                           (stream-filter-until f (stream-rest st)))]))

(define (run limit)
  (-> positive? (or/c positive?))
  (for/or ([n (in-range 9 limit 2)])
    (define prevs (stream-filter-until (lambda (p) (> p n)) primes))
    (if (and (not (stream-ormap (lambda (x) (= n x)) prevs)) ; not member
             (stream-andmap (lambda (p) (not (integer? (sqrt (/ (- n p) 2))))) prevs)) ; can't find prime+2(square)
        n
        #f)))

(define (main) (run 10000))
(time (begin (main) (void)))
)