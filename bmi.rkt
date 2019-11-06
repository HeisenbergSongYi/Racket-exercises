
(define (body-mass-index m h)
  (/ m (* h h)))

(define (pdtokg pd)(* pd 0.45359237))

(define (ft&intom ft in)
  ( +(*(* 12 ft) 0.0254)(* in 0.0254)))

(define (body-mass-index-imperial ft in pd)
  (/(pdtokg pd)(sqr(ft&intom ft in))))

