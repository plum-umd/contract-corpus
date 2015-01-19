#lang typed/racket
(require typed/file/md5)
(require/typed "shared.rkt" 
               [mt (Setof Path)]
               [update-table! ((HashTable Bytes (Setof Path)) Bytes Path -> Void)]
               [mod< (Path Path -> Boolean)])

;; List all duplicate files in given directory
;; Unlikely but possible hash collision will give wrong answer.
;; Reports newer duplicates.

(: table (HashTable Bytes (Setof Path)))
(define table (make-hash))

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

(for ([p (directory-list)]
      #:unless (directory-exists? p))
  (update-table! table (call-with-input-file p md5) p))

(for ([s (in-hash-values table)]
      #:unless (= 1 (set-count s)))
  (for ([p (rest (sort (set->list s) mod<))])
    (display (path->complete-path p))
    (newline)))
