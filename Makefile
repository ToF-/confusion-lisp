test: tests.lisp confusion-solve.lisp
	sbcl --load tests.lisp

sample: tests.lisp confusion-solve.lisp solve.lisp sample.txt
	sbcl --load solve.lisp

