((define sum 0)
(let loop ([num 1])
  (when (<= num 100)
        (set! sum (+ sum num))
        (loop (add1 num))))
(printf "~a" sum))

#|Result:
#<void>
Parser: Unknown symbol define in module top-level
  

|#