(defvar *bot1* 7)
(defvar *bot2* 3)
(defvar *bot3* 2)

(defun operatorFA ()   ;operator fill A
	(if (< *bot1* '7)
		(setf *bot1* '7)
		(format t "Bottle A cannot be filled, because it is already full!~%")
	)
)

(defun operatorFB ()   ;operator fill B
	(if (< *bot2* '4)
		(setf *bot2* '4)
		(format t "Bottle B cannot be filled, because it is already full!~%")
	)
)

(defun operatorFC ()   ;operator fill C
	(if (< *bot3* '2)
		(setf *bot3* '2)
		(format t "Bottle C cannot be filled, because it is already full!~%")
	)
)

(defun operatorEA ()   ;operator emptyA
	(if (not(equal *bot1* 0))	
		(setf *bot1* '0)
		(format t "Bottle A cannot be emptied, because it is already empty!~%")
	)
)

(defun operatorEB ()   ;operator emptyB
	(if (not(equal *bot2* 0))
		(setf *bot2* '0)
		(format t "Bottle B cannot be emptied, because it is already empty!~%")
	)
)

(defun operatorEC ()   ;operator emptyC
	(if (not(equal *bot3* 0))	
		(setf *bot3* '0)
		(format t "Bottle C cannot be emptied, because it is already empty!~%")
	)
)

(defun operatorTAB ()
	(if (and(> *bot1* '0)(< *bot2* '4));neccesary condition
		(if (<= *bot1* (- 4 *bot2*))
			(progn
				(setf *bot2* (+ *bot2* *bot1*))
				(setf *bot1* '0)
			)
			(progn
				(setf *bot1* (- *bot1* (- 4 *bot2*)))
				(setf *bot2* '4)
			)
		)
		(format t "Cannot transact bottle A to bottle B~%")
	)
)
(defun operatorTAC ()
	(if (and(> *bot1* '0)(< *bot3* '2));neccesary condition
		(if (<= *bot1* (- 2 *bot3*))
			(progn
				(setf *bot3* (+ *bot3* *bot1*))
				(setf *bot1* '0)
			)
			(progn
				(setf *bot1* (- *bot1* (- 2 *bot3*)))
				(setf *bot3* '2)
			)
		)
		(format t "Cannot transact bottle A to bottle C~%")
	)
)

(defun operatorTBA ()
	(if (and(> *bot2* '0)(< *bot1* '7));neccesary condition
		(if (<= *bot2* (- 7 *bot1*))
			(progn
				(setf *bot1* (+ *bot1* *bot2*))
				(setf *bot2* '0)
			)
			(progn
				(setf *bot2* (- *bot2* (- 7 *bot1*)))
				(setf *bot1* '7)
			)
		)
		(format t "Cannot transact bottle B to bottle A~%")
	)
)	
(defun operatorTBC ()
	(if (and(> *bot2* '0)(< *bot3* '2));neccesary condition
		(if (<= *bot2* (- 2 *bot3*))
			(progn
				(setf *bot3* (+ *bot3* *bot2*))
				(setf *bot2* '0)
			)
			(progn
				(setf *bot2* (- *bot2* (- 2 *bot3*)))
				(setf *bot3* '2)
			)
		)
		(format t "Cannot transact bottle B to bottle C~%")
	)
)

(defun operatorTCA ()
	(if (and(> *bot3* '0)(< *bot1* '7));neccesary condition
		(if (<= *bot3* (- 7 *bot1*))
			(progn
				(setf *bot1* (+ *bot1* *bot3*))
				(setf *bot3* '0)
			)
			(progn
				(setf *bot3* (- *bot3* (- 2 *bot1*)))
				(setf *bot1* '7)
			)
		)
		(format t "Cannot transact bottle C to bottle A~%")
	)
)
(defun operatorTCB ()
	(if (and(> *bot3* '0)(< *bot2* '4));neccesary condition
		(if (<= *bot3* (- 4 *bot2*))
			(progn
				(setf *bot2* (+ *bot2* *bot3*))
				(setf *bot3* '0)
			)
			(progn
				(setf *bot3* (- *bot3* (- 2 *bot1*)))
				(setf *bot2* '4)
			)
		)
		(format t "Cannot transact bottle C to bottle B~%")
	)
)

(defun printBottles()
	(ifFunction *bot1* *bot2* *bot3*)
)

(defvar *exitFlag* 'dontexit)
(defun functionMain()
	;(loop while (not(equal *exitFlag* 'exit)) do 
		(format t "Press  1 or  FA, to Fill Bottle A~%")
		(format t "Press  2 or  FB, to Fill Bottle B~%")
		(format t "Press  3 or  FC, to Fill Bottle C~%")
		(format t "Press  4 or  EA, to Empty Bottle A~%")
		(format t "Press  5 or  EB, to Empty Bottle B~%")
		(format t "Press  6 or  EC, to Empty Bottle C~%")
		(format t "Press  7 or TAB, to transact A to B~%")
		(format t "Press  8 or TAC, to transact A to C~%")
		(format t "Press  9 or TBA, to transact B to A~%")
		(format t "Press 10 or TBC, to transact B to C~%")
		(format t "Press 11 or TCA, to transact C to A~%")
		(format t "Press 12 or TCB, to transact C to B~%")
		(format t "or press E to exit.~%")
		(format t "==============================~%")
		(format t "Choose an option:")
		(setf buttonPressed (read))
		(if (equal buttonPressed 'E)
			(quit)
		)
		(if (or (equal buttonPressed '1)(equal buttonPressed 'FA))
			(progn
				(operatorFA)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '2)(equal buttonPressed 'FB))
			(progn
				(operatorFB)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '3)(equal buttonPressed 'FC))
			(progn
				(operatorFC)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '4)(equal buttonPressed 'EA))
			(progn
				(operatorEA)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '5)(equal buttonPressed 'EB))
			(progn
				(operatorEB)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '6)(equal buttonPressed 'EC))
			(progn
				(operatorEC)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '7)(equal buttonPressed 'TAB))
			(progn
				(operatorTAB)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '8)(equal buttonPressed 'TAC))
			(progn
				(operatorTAC)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '9)(equal buttonPressed 'TBA))
			(progn
				(operatorTBA)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '10)(equal buttonPressed 'TBC))
			(progn
				(operatorTBC)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '11)(equal buttonPressed 'TCA))
			(progn
				(operatorTCA)
				(printBottles)
			)
		)
		(if (or (equal buttonPressed '12)(equal buttonPressed 'TCB))
			(progn
				(operatorTCB)
				(printBottles)
			)
		)
	;)
)

