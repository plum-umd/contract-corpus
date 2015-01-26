#lang racket
(require try-scv-racket/evil
         racket/sandbox
         syntax/parse
         soft-contract/check
         "shared.rkt")

;; try-module applies the evaluator to a module
;; Sexpr Ev -> Void
(define (try-module ev m)
  (ev m))

;;Define handlers for different raised exceptions
;;the first two are defined by phil in softcontract/check.rkt
(define handle-contract-counterexample (make-parameter (λ (p) void)))
(define handle-contract-maybe          (make-parameter (λ (p) void)))
(define handle-contract-fail           (make-parameter (λ (p) void)))
(define handle-terminated              (make-parameter (λ (p) void)))
(define handle-resource                (make-parameter (λ (p) void)))
(define handle-fail                    (make-parameter (λ (p) void)))

(define (list-unsafe-modules path)
  (for ([p (in-list (directory-list path #:build? #t))]
        #:unless (directory-exists? p)
        #:when (racket-file? p)
        #:when (readable? p))
    (with-handlers ([exn:fail:contract:counterexample? ((handle-contract-counterexample) p)]
                    [exn:fail:contract:maybe? ((handle-contract-maybe) p)]
                    [exn:fail:contract? ((handle-contract-fail) p)]
                    ;; DVH: I don't think this should happen unless running in DrRacket
                    #;[exn:fail:out-of-memory? (λ (x) (printf "~a~n" p))]
                    [exn:break? raise]
                    [exn:fail:resource? ((handle-resource) p)]
                    [exn:fail? ((handle-fail) p)] ;covers error
                    [exn? raise])
      ; raise anything not covered
      ;; for each module in a file, create an instance of an ev
      ;; and use it to evaluate the module
      (for-each (λ (x) (begin (define ev (make-ev))
                              (try-module ev (list x))))
                (read-all p)))))

(define show
  (λ (p) (λ (_) (printf "~a~n" p))))

(module* main #f
  (command-line
   #:multi
   [("--counterexample")
    "Report counterexample found"
    (handle-contract-counterexample show)]
   [("--maybe")
    "Report maybe counterexample found"
    (handle-contract-maybe show)]
   [("--error")
    "Report errors"
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
  
  (list-unsafe-modules "/home/clay/contract-corpus/progs"))

