#lang racket
(require file/md5)

(define table
  (make-hash))

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))

(define (update-table! h p)
  (hash-set! table h
             (set-union
              (set p)
              (hash-ref table h (set)))))

(for ([p (directory-list)]
      #:unless (directory-exists? p))
  (update-table! (call-with-input-file p md5) p))

(for ([s (in-hash-values table)]
      #:unless (= 1 (set-count s)))

  (for ([p (rest (sort (set->list s) <
                       #:key file-or-directory-modify-seconds))])
    (display (path->complete-path p))
    (newline)))