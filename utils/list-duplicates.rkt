#lang typed/racket
(require typed/file/md5)
;; List all duplicate files in given directory
;; Unlikely but possible hash collision will give wrong answer.
;; Reports newer duplicates.

(: table (HashTable Bytes (Setof Path)))
(define table (make-hash))

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

(: mt (Setof Path))
(define mt (set))

(: update-table! (Bytes Path -> Void))
(define (update-table! h p)
  (hash-set! table
             h
             (set-union (set p)
                        (hash-ref table
                                  h
                                  (λ () mt)))))

(: mod< (Path Path -> Boolean))
(define (mod< p1 p2)
  (< (file-or-directory-modify-seconds p1)
     (file-or-directory-modify-seconds p2)))

(for ([p (directory-list)]
      #:unless (directory-exists? p))
  (update-table! (call-with-input-file p md5) p))

(for ([s (in-hash-values table)]
      #:unless (= 1 (set-count s)))
  (for ([p (rest (sort (set->list s) mod<))])
    (display (path->complete-path p))
    (newline)))
