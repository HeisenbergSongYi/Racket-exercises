;;(make-point n1 n2) takes two number and produces a list of length 2
;; make-point: Num Num -> List
(define (make-point n1 n2)
  (cons n1 (cons n2 empty)))

;;(x-coord v) consumes a list of x and y coordinate and produces its x coordinate
;; x-coord: List->Num
(define (x-coord v)
  (first v))

;;(y-coord v) consumes a list of x and y coordinate and produces its y coordinate
;; y-coord: List->Num
(define (y-coord v)
  (first(rest v)))


;;example:
(define Q (make-point 3 2))
(check-expect (x-coord Q) 3)
(check-expect (y-coord Q) 2)

;;Test:
(define D (make-point 9 6))
(check-expect (x-coord D) 9)
(check-expect (y-coord D) 6)
;;--------------------------------------------------------
;;(make-step origin-point direction distance)
;;takes an origin point coordinate, direction, distance
;;and produce the coordinate after moving
;;requires: symbol in direction should either be 'N or 'E or 'W or 'S
;;Example
(check-expect (make-step (make-point 2 3) 'E 4) (make-point 6 3))
(check-expect (make-step (make-point 5 -3) 'S 2) (make-point 5 -5))
;;make-step: List Sym Num -> List

(define (make-step origin-point direction distance)
  (cond
  [(symbol=? direction 'N ) (make-point (x-coord  origin-point) (+  (y-coord  origin-point ) distance)) ]
  [(symbol=? direction 'S ) (make-point (x-coord  origin-point) (-  (y-coord  origin-point ) distance)) ]
  [(symbol=? direction 'E ) (make-point  (+  (x-coord  origin-point ) distance) (y-coord  origin-point)) ]
  [(symbol=? direction 'W ) (make-point  (-  (x-coord  origin-point ) distance) (y-coord  origin-point)) ]
  ))
;;Test:
(check-expect (make-step (make-point 1 1) 'N 2) (make-point 1 3))
(check-expect (make-step (make-point 1 1) 'E 2) (make-point 3 1))
(check-expect (make-step (make-point 1 1) 'W 2) (make-point -1 1))
(check-expect (make-step (make-point 1 1) 'S 2) (make-point 1 -1))
(check-expect (make-step (make-point 1 1) 'S 1.414) (make-point 1 -0.414))


;;--------------------------------------------------
;;(two-steps origin-point directions distances)
;;takes an origin point coordinate, a list of directions,
;;a list of distances
;;and produce the coordinate after moving
;;requires: symbol in directions should either be 'N or 'E or 'W or 'S
;;make-step: List List List -> List

;;Examples:
(check-expect
(two-steps (make-point 1 -1)
(cons 'N (cons 'E empty))
(cons 2 (cons 3 empty)))
(make-point 4 1))
(check-expect
(two-steps (make-point 3 3)
(cons 'E (cons 'S empty))
(cons 4 (cons 1 empty)))
(make-point 7 2))

(define (distance-vertical-and-horizontal direction distance)
  (cond
    [(symbol=? (x-coord direction) 'N) (+ (x-coord distance) 0)]
    [(symbol=? (x-coord direction) 'E) (+ (x-coord distance) 0)]
    [(symbol=? (x-coord direction) 'W) (- 0 (x-coord distance) )]
    [(symbol=? (x-coord direction) 'S) (- 0 (x-coord distance) )]
    [(symbol=? (y-coord direction) 'N) (+ (y-coord distance) 0)]
    [(symbol=? (y-coord direction) 'E) (+ (y-coord distance) 0)]
    [(symbol=? (y-coord direction) 'W) (- 0 (y-coord distance) )]
    [(symbol=? (y-coord direction) 'S) (- 0 (y-coord distance) )])
  )




(define (two-steps origin-point direction distance)
 
  (make-point (+ (x-coord  origin-point) (distance-vertical-and-horizontal direction distance))
              (+  (y-coord  origin-point ) (distance-vertical-and-horizontal direction distance))) )


