(defpackage :confusion-solve
(:export :solve))

(defun solver (expression result power-of-ten)
  (if (= expression result) 
    (list expression)
    (if (or (< expression result)
            (= result 0) 
            (and 
              (< expression power-of-ten) 
              (< result power-of-ten) 
              (/= result expression))) nil
      (let* ((left (floor expression power-of-ten))
             (right (rem expression power-of-ten))
             (target (- result right))
             (candidate (append (solver left target 10) (list right))))
        (if (= result (reduce '+ candidate))
          candidate
          (solver expression result (* power-of-ten 10)))))))

(defun solve (expression result)
  (solver expression result 10))

