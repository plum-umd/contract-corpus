(module nest racket
  ;;nest consumes a list and an object and creates a nested list with the
  ;;object as the most nested item
  (provide (contract-out [nest ((listof any/c) any/c . -> . (listof any/c))]))
  (define (nest l a)
    (cond
      [(empty? l) (list a)]
      [else (list (car l) (nest (cdr l) a))])))

