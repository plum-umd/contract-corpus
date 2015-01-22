(module f racket
  (provide (contract-out [split-snd (-> string? string?)]))

  (define (split-snd x)
    (if (equal? "asdf" x) "asdf" "lkjk"))
  
)
