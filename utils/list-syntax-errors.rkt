#lang racket
(require "shared.rkt"
	 try-scv-racket/eval)

;; Lists unreadable files with .rkt or .sch extensions.

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

(define (syntax-error? path)
  (define ev (make-ev-rkt))
  (with-handlers ([exn:fail:syntax? (lambda (x) #t)]
                  [exn:break? raise]
                  [exn? (lambda (x) #f)])
    (for-each ev (read-all path))
    #f))

(for ([p (in-list (directory-list))]
      #:unless (directory-exists? p)
      #:when (racket-file? p)
      #:when (syntax-error? p))
  (display (path->complete-path p))
  (newline))
