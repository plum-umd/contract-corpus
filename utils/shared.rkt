#lang racket
(provide (all-defined-out))

;; path? -> boolean?
(define (racket-file? p)
  (define ext (filename-extension p))
  (or (equal? #"rkt" ext)
      (equal? #"sch" ext)))

;; path? -> boolean?
;; Is the file completely readable with read?
(define (readable? path)
  (with-handlers ([exn:fail:read? (λ (x) #f)])
    (read-all path)
    #t))

;; path? -> [listof sexpr]
(define (read-all path)  
  (call-with-input-file* path
    (λ (p) (port->list read p))))

;(: mod< (Path Path -> Boolean))
(define (mod< p1 p2)
  (< (file-or-directory-modify-seconds p1)
     (file-or-directory-modify-seconds p2)))

(define mt (set))
(define (update-table! t h p)
  (hash-set! t
             h
             (set-union (set p)
                        (hash-ref t h (λ () mt)))))

(define (update-table t h p)
  (hash-set t
            h
            (set-union (set p)
                       (hash-ref t h (λ () mt)))))

(define (join-table t h p)
  (hash-set t
            h
            (set-union p
                       (hash-ref t h (λ () mt)))))



