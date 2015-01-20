((module f racket
  (provide (contract-out [x any/c]))
  (define x 42)))