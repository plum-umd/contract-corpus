#lang racket
(require "shared.rkt")

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

;; Sexpr -> (Setof Path)
(define table (make-hash))

(for ([p (directory-list)]
      #:unless (directory-exists? p)
      #:when (racket-file? p))
  (update-table! table (read-all p) p))

(for ([s (in-hash-values table)]
      #:unless (= 1 (set-count s)))
  (for ([p (rest (sort (set->list s) mod<))])
    (display (path->complete-path p))
    (newline)))
