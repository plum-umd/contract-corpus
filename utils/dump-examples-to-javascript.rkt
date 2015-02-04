#lang racket/base
(require racket/contract racket/file racket/string racket/port racket/cmdline racket/match)

(define/contract (dump dir-name out-file)
  (path-string? path-string? . -> . void?)
  
  (define-values (labels contents)
    (for/lists (labels contents) ([file (in-directory dir-name)]
                                  [i #|FIXME|# (in-naturals)]
                                  #:when (regexp-match-exact? ".*sch" (path->string file)))
      (define label #|FIXME|# (format "ex-~a" i))
      (define content
        (with-output-to-string
            (λ () (write (format "~a~n" (file->string file))))))
      (values label content)))
 
  (with-output-to-file out-file
    (λ ()
      (printf
       (string-join (for/list ([label labels]
                               [content contents])
                      (format "~a = ~a" label content))
                    "\n,\n"
                    #:before-first "var examples = {\n"
                    #:after-last "\n}")))
    #:exists 'replace))

(match-define (cons in-dir out-file)
  (command-line #:args (in-dir out-file) (cons in-dir out-file)))

(dump in-dir out-file)
