#lang racket
(require "shared.rkt")

;; Lists unreadable files with .rkt or .sch extensions.

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

(for ([p (in-list (directory-list))]
      #:unless (directory-exists? p)
      #:when (racket-file? p)
      #:unless (readable? p))
  (display (path->complete-path p))
  (newline))
