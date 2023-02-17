(defpackage :confusion-solve
(:export :solve))

(defun solve (expression result)
  (if (= result 0) nil
      (let* ((tens (floor expression 10))
             (units (rem expression 10))
             (target (- result units)))
        (append (solve tens target)))))

