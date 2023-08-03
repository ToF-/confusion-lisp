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

(define-test three-digit-term-sum
   (assert-equal (list 2 345) (solve 2345 347))
   (assert-equal (list 234 5) (solve 2345 239)))

(define-test deal-breaker
   (assert-equal nil (solve 7 2)))

(define-test mixed-term-sum
   (assert-equal (list 23 45 678 9) (solve 23456789 755))
   (assert-equal (list 2 5074 65 9 9 3 12 7 3 5 4 5 8 7 9 9 2 4 7 1 0) 
                 (solve 25074659931273545879924710 5245))
   (assert-equal (list 8 1 1 63 4 9 801 5058 0 8 2 2 9 6 8 6 7 3 3 9 4) 
                 (solve 811634980150580822968673394 6012)))

(define-test get-parameters
    (assert-equal (list 4807 19) (parameters "4807=19"))
    (assert-equal (list 4807 811) (parameters  "4807=811")))

(define-test equation
    (assert-equal (list 42 '= 42) (equation (list 42) 42))
    (assert-equal (list 42 '+ 17 '= 59) (equation (list 42 17) 59))
    (assert-equal (list 23 '+ 42 '+ 17 '= 82) (equation (list 23 42 17) 82)))

(define-test print-equation
    (assert-equal "23+42+17=82" (print-equation (list 23 42 17) 82)))

(define-test solve-line
    (assert-equal "8+1+1+63+4+9+801+5058+0+8+2+2+9+6+8+6+7+3+3+9+4=6012"
     (solve-line "811634980150580822968673394=6012")))



(run-tests :all)
(sb-ext:quit)

