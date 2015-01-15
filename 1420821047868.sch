((+ 1 "asdf"))

#|Result:
#<void>
Contract violation: 'top-level' violates '+'.
Value
 "asdf"
violates predicate
 number?
An example module that breaks it:
 (module user racket (require (submod ".." top-level)) (top-level))

  

|#
