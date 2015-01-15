((require racket/system)
(system "ls"))

#|Result:
#<void>
cadr: contract violation
  expected: (cons/c any/c pair?)
  given: 'racket/system
  

|#
