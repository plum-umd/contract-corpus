((module m racket
  (define (id-str x)
    (if (string? x)
        (id-str 5)
        "asdf"))
  (provide
   (contract-out
    [id-str (-> string? string?)]))))

#|Result:
#<void>

Program is safe
Program is safe

|#
