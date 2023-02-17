(ql:quickload :lisp-unit)
(in-package :lisp-unit)
(setq *print-failures* t)
(load "confusion-solve")

(define-test trivial-sum
    (assert-equal (list 2 3) (solve 23 5)))


(run-tests :all)
(sb-ext:quit)


