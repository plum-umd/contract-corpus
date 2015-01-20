#lang racket
(require "shared.rkt"
         try-scv-racket/eval)

;; Lists unreadable files with .rkt or .sch extensions.

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

(define (syntax-error? path)
  (define ev (make-ev-rkt))
  (define ss (call-with-input-file* path read))
  (ormap 
   (λ (s) 
     (with-handlers ([exn:fail:syntax? (λ (_) #t)]
                     [(λ (exn) #t) (λ (_) #f)])
       (ev s)
       #f))
   ss))

(for ([p (in-list (directory-list))]
      #:unless (directory-exists? p)
      #:when (racket-file? p)
      #:when (readable? p)
      #:when (syntax-error? p))
  (display (path->complete-path p))
  (newline))
