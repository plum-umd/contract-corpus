#lang racket
(require "shared.rkt"
	 try-scv-racket/eval)

;; Lists unreadable files with .rkt or .sch extensions.

(unless (zero? (vector-length (current-command-line-arguments)))
  (current-directory (vector-ref (current-command-line-arguments) 0)))


(define ev (make-ev-rkt))

(define (syntax-error? path)
  (with-handlers ([exn:fail:syntax? (lambda (x) #t)]
                  [exn:break? raise]
                  [exn? (lambda (x) #;(print x) #f)])
    (for-each ev (read-all path))
    #f))


(for ([p #;(list "1421630531813.sch") (directory-list)]
      
      #:unless (directory-exists? p)
      #:when (racket-file? p)
      #:when (syntax-error? p))
  
  (if (equal? (path->complete-path p)
              (path->complete-path "1421630531813.sch"))
      (display "HERE")      
      (display (path->complete-path p)))
  (newline))
#|
(print (directory-exists? "1421630531813.sch"))
(print (racket-file? "1421630531813.sch"))
(print (syntax-error? "1421630531813.sch"))
|#