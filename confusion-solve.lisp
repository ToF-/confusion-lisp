(defpackage :confusion-solve
(:export :solve))

(defun solver (expression result power-of-ten)
  (cond ((= expression result) (list expression))
        ((= 0 expression) nil)
        ((and (< expression power-of-ten) (< result power-of-ten)) nil)
        (t (let* ((left (floor expression power-of-ten))
                  (right (rem expression power-of-ten))
                  (target (- result right))
                  (solved-left (solver left target 10)))
             (if solved-left (append solved-left (list right))
               (solver expression result (* power-of-ten 10)))))))

(defun solve (expression result)
  (solver expression result 10))

