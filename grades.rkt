;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grades) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (final-cs135-grade mt1 mt2 fe ass)
  (+(+(+(+(* mt1 0.1) (* mt2 0.15)) (* 0.5 fe) )(* ass 0.2))5))

(define (cs135-final-exam-grade-needed 1mt 2mt ovass)
  (round(* 2 (-(-(- 55 (* 1mt 0.1))(* 2mt 0.15))(* ovass 0.2)))))
