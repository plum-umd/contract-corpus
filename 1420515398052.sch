((module m racket
  (provide/contract [x integer?])
  (define x
    (string-length "ASDF")))

#;(require 'm)
3)