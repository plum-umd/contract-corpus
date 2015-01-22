#lang racket
(require try-scv-racket/eval
         racket/sandbox
         syntax/parse
         "shared.rkt")

;; Sexpr -> Void
(define (try-module m)
  (define m1 (syntax->datum (hack-require-clause (datum->syntax #f m))))
  (match m1
    [(list-rest 'module m-name 'racket _)
     (define ev (make-ev-rkt))
     (ev m1)  
     (define-values (vals stxs) (ev `(module->exports '',m-name)))
     (ev `(require ',m-name))
     (for ([i (dict-ref (append vals stxs) 0)])
       (ev `(contract-exercise ,(car i))))]
    [_ (void)]))

;(define in (read-all "../1421287483111.sch"))
;(define in (read-all "../1421366579407.sch"))
;(define in (read-all "../1421287561184.sch"))
;(define in (read-all "../test.sch"))
;(define in (read-all "../1421295204017.sch"))

;(try-module (first in))

(define unsafe-modules '())

(define (list-unsafe-modules path)
  (for ([p (in-list (directory-list path #:build? #t))]
        #:unless (directory-exists? p)
        #:when (racket-file? p)
        #:when (readable? p))
    (with-handlers ([exn:fail:contract? (λ (x) (printf "~a~n" p))]
                    [exn:fail:out-of-memory? void]
                    [exn:break? raise]
                    [exn:fail:sandbox-terminated? void]
                    [exn:fail:resource? void]
                    [exn? print])
      (for-each try-module (read-all p)))))

;(list-unsafe-modules "/home/clay/contract-corpus")

(list-unsafe-modules (current-directory))



