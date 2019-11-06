
(define (final-cs135-grade mt1 mt2 fe ass)
  (+(+(+(+(* mt1 0.1) (* mt2 0.15)) (* 0.5 fe) )(* ass 0.2))5))

(define (cs135-final-exam-grade-needed 1mt 2mt ovass)
  (round(* 2 (-(-(- 55 (* 1mt 0.1))(* 2mt 0.15))(* ovass 0.2)))))
