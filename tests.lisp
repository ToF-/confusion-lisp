(ql:quickload :lisp-unit)
(in-package :lisp-unit)
(format t "---------------------~%~a~%---------------------~%" *package*)

(setq *print-failures* t)
(define-test dummy
    (assert-equal 4 (+ 2 2)))

(run-tests :all)
(sb-ext:quit)


