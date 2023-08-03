(defpackage :confusion-solve
(:export :solve :split-parameters :print-solution :equation :format-equation :process))

(ql:quickload :cl-ppcre)

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

(defun split-parameters (line)
  (mapcar #'parse-integer (cl-ppcre:split "=" line)))

(defun equation (terms result)
  (cond ((null (cdr terms)) (cons (car terms) (cons '= (list result))))
        (t (cons (car terms) (cons '+ (equation (cdr terms) result))))))

(defun format-equation (terms result)
  (format nil "~{~a~}" (equation terms result)))

(defun solve-line (line)
  (let* ((params (split-parameters line))
         (expression (car params))
         (result (cadr params))
         (solution (solve expression result)))
    (format-equation solution result)))

(defun process ()
  (let ((in (open "sample.txt")))
    (when in
      (loop for line = (read-line in nil)
            while line do (format t "~a~%" (solve-line line)))
      (close in)
      (sb-ext:quit))))

