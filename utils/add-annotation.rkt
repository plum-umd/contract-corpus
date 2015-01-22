#lang racket
(require "shared.rkt")
(require racket/runtime-path)

;; Annotation

(define-runtime-path p
  '(lib "annotations.table" "contract-corpus"))

(define (list->set-table t)
  (for/hash ([(k v) (in-hash t)])
    (values k (list->set v))))

(define (set->list-table t)
  (for/hash ([(k v) (in-hash t)])
    (values k (set->list v))))

(define annotations 
  (list->set-table (read (open-input-file p))))

(define argv (current-command-line-arguments))

(define anns (set))
(define paths (set))

(command-line 
 #:multi 
 ("-a" a "Annotation" (set! anns (set-add anns a)))
 #:args fs
 (set! paths fs))
 
(when (zero? (set-count anns))
  (error "Please provide an annotation with -a."))

(define annotations.new
  (for/fold ([t annotations])
            ([p paths])
    (join-table t (path->string (last (explode-path p))) anns)))


(define tmp (make-temporary-file))
(with-output-to-file tmp
  (λ ()
    (pretty-write (set->list-table annotations.new)))
  #:exists 'replace)

(rename-file-or-directory tmp p #t)


  
