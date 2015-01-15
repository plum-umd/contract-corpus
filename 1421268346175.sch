((module lib racket
  (provide
   (contract-out
    [path/c any/c]
    [dom/c any/c]))
  (define path/c
    (->i ([msg (one-of/c "hd" "tl")])
	 (res (msg) (cond [(equal? msg "hd") string?]
			  [else (or/c false? path/c)]))))
  (define dom/c
    (->i ([msg (one-of/c "get-child")])
	 (res (msg) (string? . -> . dom/c)))))

(module get-path racket
  (provide (contract-out [get-path (dom/c path/c . -> . dom/c)]))
  (require (submod ".." lib))
  (define (get-path root p)
    (while root p))
  (define (while cur path)
    (if (and (not (false? path)) (not (false? cur)))
        (while ((cur "get-child") (path "hd"))
          (path "hd" #;"tl"))
        cur))))

#|Result:
#<void>
Contract violation: 'get-path' violates a contract in an application.
Value
 "CoVwO"
violates predicate
 procedure?
An example module that breaks it:
 (module user racket
  (require (submod ".." get-path))
  (get-path (λ (x) (λ (x) (λ (x) any/c))) (λ (x) "CoVwO")))

  
Program is safe

|#
