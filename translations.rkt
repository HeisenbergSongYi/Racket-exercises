
(define (volume r)
  (*(*(*(*(/ 4 3)pi)r)r) r))

(define phi (/(+ 1(sqrt 5))2))

(define (fib n)
  ( /(-(expt phi n)(expt(- 0 phi)(- 0 n)))(-(* 2 phi)1) ))

(define G 6.674e-11)

(define (escape m r)
  (sqrt (/(*(* 2 G)m)r) ))

(define Pref 2e-5)

(define (pressure->loudness P)
  (* 20 (/ (log(/ P Pref))(log 10))))

