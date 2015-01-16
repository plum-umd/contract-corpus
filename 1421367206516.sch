((module f racket
  (provide (contract-out [f (positive? . -> . positive?)]))
  (define (f n)
    (+ 1 n))
  
  
))

#|Result:
#<void>
Contract violation: 'f' violates '>'.
Value produced by
 (begin (struct s₉ ()) (s₉))
violates predicate
 real?
An example module that breaks it:
 (module user racket (require (submod ".." f)) (begin (struct s₉ ()) (f (s₉))))

  
Program is safe

|#
