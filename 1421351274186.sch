((module m racket
  (define (id-str x)
    (if (string? x)
        x
        (id-str 5)))
  (provide
   (contract-out
    [id-str (-> string? string?)]))))

#|Result:
#<void>

Program is safe
Program is safe

|#
