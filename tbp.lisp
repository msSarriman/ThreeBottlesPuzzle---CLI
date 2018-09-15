(defvar *bot1*) ; Variable to store Bottle A state
(defvar *bot2*) ; Variable to store Bottle B state
(defvar *bot3*) ; Variable to store Bottle C state
(defvar *originalStateLocation* "origState.txt")
(defvar *finalStateLocation* "finalState.txt")
(defvar *terminalInputState* "terminalInputState.txt")
(defvar *wayOfInput* NIL)
(defvar *originalStateVar* (list NIL))

(load "bottleRepresentation.lisp")	; header file call
(load "bottleOperators.lisp")		; header file call

(defun welcomeFunction (&optional arg1)	; Welcome to the programm function
	(format t "~%Welcome to the three bottles problem!!!!!!!~2%") (sleep 2)
	(format t "       Designed by~%") (sleep 1)
	(format t "         Emmanuel Sarris ID:5191~%") (sleep 1)
	(format t "           for Upatras-CEID~%") (sleep 1)    
	(format t "   and Intelligent Technologies,Systems and Robotics~%")
	(format t "                         undergraduate Course.~%") (sleep 3)
	(format t "   7lt                            ~%")
	(format t "|^^^^^^^^|    			         ~%")
	(format t "|        |                        ~%")
	(format t "|        |     4lt	             ~%")
	(format t "|        |  |^^^^^^^^|            ~%")
	(format t "|        |  |        |     2lt    ~%")
	(format t "|        |  |        |  |^^^^^^^^|~%")
	(format t "|________|  |________|  |________|~%")
	(format t " Bottle A    Bottle B    Bottle C ~2%") (sleep 2)
	(format t "What is the beggining state of the problem?~2%") (sleep 3)
	(initFunction)
)

(defun initFunction (&optional arg1)
	(format t "=============================================~%")
	(format t "Choose a method to define the starting state.~%")
	(format t "Press T to input from terminal or F to input from file.~%")
	(format t "~%If you choose F, a.k.a. file,~%please note that the represantation must follow the following example:~%")
	(format t "(5 3 1)~%")
	(format t "Where 5 is the litres for bottle A,~%3 is the litres for bottle B ~%and 1 is the litres for bottle C.~%")
	(format t "~%Choose Input (T/F):")		
	(setq inputMethod (read))
	(if (equal inputMethod 'T) ;if input from user is equal to T then <expr> or else <expr>
		(progn
			(setf *wayOfInput* 'terminal) 
			(terminalInput)
		)
		(progn
			(setf *wayOfInput* 'file)
			(fileInput)
		)
	)
)

(defun terminalInput ()
	(format t "~%Please provide the water in litres for:")
	(format t "~%First bottle (7lt or Bottle A):")
	(setq *bot1* (read)) ; Bottle A init
	(loop while (not (and (<= *bot1* 7) (>= *bot1* 0))) ;error checking
		do
		(format t "Please provide a valid litre representation for Bottle A!!~%(Between 0 and 7)~%Water in lt for Bottle A:")
		(setq *bot1* (read))
	)
	(format t "Second bottle (4lt or Bottle B):")
	(setq *bot2* (read)) ; Bottle B init
	(loop while (not (and (<= *bot2* 4) (>= *bot2* 0))) ;error checking
		do
		(format t "Please provide a valid litre representation for Bottle B!!~%(Between 0 and 4)~%Water in lt for Bottle B:")
		(setq *bot2* (read))
	)
	(format t "Third bottle (2lt or Bottle C):")
	(setq *bot3* (read)) ; Bottle C init
	(loop while (not (and (<= *bot3* 2) (>= *bot3* 0))) ;error checking
		do
		(format t "Please provide a valid litre representation for Bottle C!!~%(Between 0 and 2S)~%Water in lt for Bottle C:")
		(setq *bot3* (read))
	)
	(printState *bot1* *bot2* *bot3*)
)
 


(defun fileInput ()
	(let ((i 1)(in (open *originalStateLocation* :if-does-not-exist nil)))
		(when in
			(loop for line = (read in nil)
				while line do
					(setf *originalStateVar* line) ;storing original state of bottles in variable
			)
			(close in)
		)
		(format t "Bottle A has <~a> litres~%" (car *originalStateVar*))
		(format t "Bottle B has <~a> litres~%" (cadr *originalStateVar*))
		(format t "Bottle C has <~a> litres~%" (caddr *originalStateVar*))
		(printState (car *originalStateVar*) (cadr *originalStateVar*) (caddr *originalStateVar*))
	)
)

(defun printState (arg1 arg2 arg3)
	(let ((i 1))
		(format t "~%So. You just told me that:~%") (sleep 1)
		(ifFunction arg1 arg2 arg3)
		(format t "The first bottle has ~a litres of water!~%" arg1)
		(format t "The second bottle has ~a litres of water!~%" arg2)
		(format t "The third bottle has ~a litres of water!~%" arg3)
	)
	(isThatCorrect) ; original state values validation
)

(defun isThatCorrect () ;  original state values validation
	;(format t "wayofinput is <~a>" *wayOfInput*)
	(format t "~%Are the above correct?~%Press Y for yes and N for no: ")
	(setq flag (read))
	(if (equal flag 'Y)
		(startPlaying)
		(initFunction)
	)
	(if (equal *wayOfInput* 'terminal)
		(saveTerminalInputInFile)
	)
)

(defvar *steps* 0)
(defun startPlaying ()
	(format t "Your goal is to have only 1 litre of water in bottle B.~2%")
	(ifFunction 0 1 0)
	(terpri)
	(loop while (or (not(equal *bot1* 0)) (not(equal *bot2* 1)) (not(equal *bot3* 0)))do
		(functionMain)
		(saveTerminalInputInFile)
		(setf *steps* (+ *steps* 1))
	) 
	(format t "Congratulations you solved the problem in ~a steps!" *steps*)
)

(defun saveTerminalInputInFile ()
	;;(print "dragon") debug line
	(with-open-file 
		(stream *terminalInputState* :direction :output :if-does-not-exist :create :if-exists :append)
		(format stream "~%Bottle A has:<~a>~%Bottle B has:<~a>~%Bottle C has:<~a>~%" *bot1* *bot2* *bot3*)
	)
)
;; ===============================
;; ===============================
;; ===============================

(welcomeFunction)
