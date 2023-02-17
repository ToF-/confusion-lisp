(defpackage :confusion-solve
(:export :solve))

(defun solve (expression result)
  (let ((tens (floor expression 10))
        (units (rem expression 10)))
  (list tens units)))
