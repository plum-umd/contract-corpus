((module f racket
  (provide (contract-out [split-snd (-> string? string?)]))

  (define (split-snd x)
    (if (string=? "asdf" x) "asdf" "lkjk"))
  
))