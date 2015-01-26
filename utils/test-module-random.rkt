#lang racket/base
;using try-scv-racket/evil as a temporary fix for bug
(require racket/match
         racket/dict
         racket/cmdline
         try-scv-racket/ev
         racket/sandbox
         syntax/parse
         "shared.rkt")

;; Ev Sexpr -> Void
(define (try-module ev m)
  (define m1 (syntax->datum (hack-require-clause (datum->syntax #f m))))
  (match m1
    [(list-rest 'module m-name 'racket _)
     (ev m1)  
     (define-values (vals stxs) (ev `(module->exports '',m-name)))
     (ev `(require ',m-name))
     (for ([i (dict-ref (append vals stxs) 0)])
       (ev `(contract-exercise ,(car i))))]
    [_ (void)]))

(define handle-contract-fail (make-parameter (λ (p) void)))
(define handle-terminated    (make-parameter (λ (p) void)))
(define handle-resource      (make-parameter (λ (p) void)))
(define handle-fail          (make-parameter (λ (p) void)))

(define (list-unsafe-modules path)
  (for ([p (in-list (directory-list path #:build? #t))]
	#:unless (directory-exists? p)
	#:when (racket-file? p)
	#:when (readable? p))
    (with-handlers ([exn:fail:contract? ((handle-contract-fail) p)]
		    ;; DVH: I don't think this should happen unless running in DrRacket
		    #;[exn:fail:out-of-memory? (λ (x) (printf "~a~n" p))]
		    [exn:break? raise]
		    [exn:fail:sandbox-terminated? ((handle-terminated) p)]
		    [exn:fail:resource? ((handle-resource) p)]
		    [exn:fail? ((handle-fail) p)] ; covers `error`
		    [exn? (λ (x) (printf "~a~n" p))]) ; raise anything not covered
      (for ([x (in-list (read-all p))])
        (try-module (make-ev-rkt) x)))))

(define (((show prefix) p) _)
  (printf "~a: ~a~n" prefix p))

(module* main #f
  (command-line
   #:multi
   [("--error")
    "Report contract"
    (handle-fail (show 'fail))]
   [("--contract")
    "Report contract"
    (handle-contract-fail (show 'contract-violation))]
   [("--timeout")
    "Report out of time"
    (handle-terminated (show 'timeout))]
   [("--memory")
    "Report out of memory"
    (handle-resource (show 'out-of-memory))])

  (list-unsafe-modules "/home/clay/contract-corpus/progs"))
