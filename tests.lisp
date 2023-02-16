(ql:quickload :lisp-unit)

(lisp-unit:define-test dummy
    (lisp-unit:assert-equal 4 (+ 2 2)))

(setq lisp-unit:*print-failures* t)
(lisp-unit:run-tests :all)
(exit)


