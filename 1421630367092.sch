((module f racket
  (provide (contract-out [split-snd (-> string? string?)]))

  (define (split-snd x)
    (if (= 0 (string-length x)) "asdf" "lkjk"))
  
))