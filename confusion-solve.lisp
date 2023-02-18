(defpackage :confusion-solve
(:export :solve))

(defun solver (expression result power-of-ten)
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
          (solver expression result (* power-of-ten 10))))))

(defun solve (expression result)
  (solver expression result 10))


; (solve 234 36)
; (if (or nil nil)
;   (let *((tens 23)
;          (units 4)
;          (target 32))
;     (append (solve 23 32) (list 4))))
; (solve 23 32)
; (if (or t nil) nil)
; (append nil (list 4))
; (list 4)


