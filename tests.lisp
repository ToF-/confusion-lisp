(ql:quickload :lisp-unit)
(in-package :lisp-unit)
(setq *print-failures* t)
(load "confusion-solve")

(define-test trivial-sum
    (assert-equal (list 2 3) (solve 23 5))
    (assert-equal (list 4 7) (solve 47 11)))

(define-test three-units-sum
    (assert-equal (list 2 3 4) (solve 234 9))
    (assert-equal (list 4 7 8) (solve 478 19)))

(define-test two-digit-term-sum
   (assert-equal (list 2 34) (solve 234 36))
   (assert-equal (list 23 4) (solve 234 27)))

(run-tests :all)
(sb-ext:quit)


