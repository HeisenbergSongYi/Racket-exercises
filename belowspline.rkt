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

;;---------------------------------------------------------------------------------------






;;(on-top-triangle P1 P2 P3) takes three point and determine if
;;it is inside the bottom line
(define (on-the-bottom-line? P1 P2 P3);;determine if point is on bottom-line
  (cond
    [(and (= (y-coord P3)  0) (<= (x-coord P3) 10)) true]
    [else false]
     ))
  
;;(on-top-triangle P1 P2 P3) takes three point and determine if
;;it is inside the left triangle
(define (on-left-triangle? P1 P2 P3);;determine if point is on left-triangle
  (cond
    [(and (<= (y-coord P3)  (*  (/(y-coord P1) (x-coord P1)) (x-coord P3) )  )
          (and ( >= (x-coord P3) 0) (<= (x-coord P3)  (x-coord P1))) ) true]
    [else false]
    ))

;;(on-top-triangle P1 P2 P3) takes three point and determine if
;;it is inside the rectangle
(define (on-rectangle? P1 P2 P3 );;determine if point is on rectangle
  (cond
       [(and (and (<= (x-coord P3) (x-coord P2)) (>= (x-coord P3) (x-coord P1)))
          (and (<= (y-coord P3) (y-coord P1) ) (>= (y-coord P3)0)) )true]
       [else false]))

;;(on-top-triangle P1 P2 P3) takes three point and determine if
;;it is inside the right triangle
(define (on-right-triangle? P1 P2 P3 );;determine if point is on right-triangle
  (cond
       [(and (and (<= (x-coord P3) 10) (>= (x-coord P3) (x-coord P2)))
          (<= ( * (/ (- 0 (y-coord P2)) (- 10 (x-coord P2))) (x-coord P3) ) (y-coord P3) ) )true]
       [else false]
       ))

;;(on-top-triangle P1 P2 P3) takes three point and determine if
;;it is inside the top triangle
(define (on-top-triangle? P1 P2 P3 );;determine if point is on top-triangle
  (cond
       [(and (and (<= (x-coord P2) (x-coord P1)) (>= (x-coord P3) (x-coord P1)))
          (>= (+ ( * (/ (- (y-coord P2) (y-coord P1)) (- (x-coord P2) (x-coord P1))) (x-coord P3) )  (y-coord P1)) (y-coord P3) ) )true]
       [else false]
       ))




;;------------------------------------------------------------------------------------
;; (below-spine? x1 y1 x2 y2 a b) takes three points and determine if
;; point (a,b) is between the curve* (formed by the origin, point1, point2, (10.0))
;; and the x-axis.
;; requires :0<x1<x2<10 and y1>0 and y2>0
;; examples:

(define P1 (make-point 3 2))
(define P2 (make-point 7 3))
(check-expect (below-spline? P1 P2 (make-point 3 1)) true)
(check-expect (below-spline? P1 P2 (make-point 10 0)) true)
(check-expect (below-spline? P1 P2 (make-point 5 1)) true)
(check-expect (below-spline? P1 P2 (make-point -1 2)) false)
(check-expect (below-spline? P1 P2 (make-point 1 1)) false)
(check-expect (below-spline? P1 P2 (make-point 1 1/2)) true)
(check-expect (below-spline? P1 P2 (make-point 3 2)) true)
(check-expect (below-spline? P1 P2 (make-point 5 (+ 5/2 1/100)))
false)

;; below-spine?: List List List -> Bool
(define (below-spline? P1 P2 P3)
  (cond
    [(on-the-bottom-line? P1 P2 P3) true]
    [(on-left-triangle? P1 P2 P3) true]
    [(on-rectangle? P1 P2 P3 ) true]
    [(on-right-triangle? P1 P2 P3 ) true]
    [(on-top-triangle? P1 P2 P3 ) true]
    [else false]
    ))

;;Tests:
(define P3 (make-point 3 9))
(define P4 (make-point 9 9))
(check-expect (below-spline? P3 P4 (make-point 10 0)) true);;on the line
(check-expect (below-spline? P3 P4 (make-point 3 8)) true);;on the left-triangle
(check-expect (below-spline? P3 P4 (make-point 9.5 0.1)) true);;on the right-triangle
(check-expect (below-spline? P3 P4 (make-point 9 8)) true);;on the top-triangle
(check-expect (below-spline? P3 P4 (make-point 5 4)) true);;on the rectangle
(check-expect (below-spline? P3 P4 (make-point 999 999)) false);;outside the entire thing



