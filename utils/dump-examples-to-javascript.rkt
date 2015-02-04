#lang racket/base
(require racket/contract racket/file racket/string racket/port racket/cmdline racket/match racket/function)

(define/contract (dump dir-name out-file)
  (path-string? path-string? . -> . void?)
  
  (define-values (labels contents)
    (for/lists (labels contents) ([file (in-directory dir-name)]
                                  #:when (regexp-match-exact? ".*sch" (path->string file)))
      (define label ; remove `in-dir` prefix, convert `-` -> `_`, remove `.sch`
        (regexp-replace
         ".sch"
         (regexp-replace
          "-"
          (regexp-replace (format "~a/" dir-name) (path->string file) "")
          "_")
         ""))
      (define content
        (with-output-to-string
            (λ () (write (format "~a~n" (file->string file))))))
      (values label content)))
 
  (with-output-to-file out-file
    (λ ()
      (printf
       (string-join (map (curry format "~a = ~a") labels contents)
                    "\n,\n"
                    #:before-first "var examples = {\n"
                    #:after-last "\n}")))
    #:exists 'replace))

(match-define (cons in-dir out-file)
  (command-line #:args (in-dir out-file) (cons in-dir out-file)))

(dump in-dir out-file)
