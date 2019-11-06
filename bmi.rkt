;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bmi) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (body-mass-index m h)
  (/ m (* h h)))

(define (pdtokg pd)(* pd 0.45359237))

(define (ft&intom ft in)
  ( +(*(* 12 ft) 0.0254)(* in 0.0254)))

(define (body-mass-index-imperial ft in pd)
  (/(pdtokg pd)(sqr(ft&intom ft in))))

