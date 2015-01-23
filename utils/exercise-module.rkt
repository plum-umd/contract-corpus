#lang racket
(require try-scv-racket/eval
	 racket/sandbox
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
		    [exn? raise]) ; raise anything not covered
      (for-each try-module (read-all p)))))

(define show
  (λ (p) (λ (_) (printf "~a~n" p))))

(module* main #f
  (command-line
   #:multi
   [("--error")
    "Report contract"
    (handle-fail show)]
   [("--contract")
    "Report contract"
    (handle-contract-fail show)]
   [("--timeout")
    "Report out of time"
    (handle-terminated show)]
   [("--memory")
    "Report out of memory"
    (handle-resource show)])

  (list-unsafe-modules (current-directory)))
