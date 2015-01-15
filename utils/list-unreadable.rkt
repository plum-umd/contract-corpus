#lang racket
;; path? -> boolean?
;; Is the file completely readable with read?
(define (readable? p)
  (define (read! in)
    (define next (read in))
    (or (eof-object? next)
        (read! in)))
  (define (read? p)
    (with-handlers ([exn:fail:read? (λ (x) #f)])
      (read! p)))
  (call-with-input-file p read?))

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

(for ([p (in-directory)]
      #:unless (directory-exists? p)
      #:unless (readable? p))
  (display (path->complete-path p))
  (newline))
