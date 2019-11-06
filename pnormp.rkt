;; (pnormp p v) calculate the pth power
;;of p-norm of a list of up to 3 numbers  
;; Example:
(check-expect (pnormp 3 (cons 3 (cons -4 (cons 5 empty)))) 216)
;; pnormp: Num listof Num ->Num 
(define (pnormp p v)
  (cond
  [(empty? v) 0]
  [(empty? (rest v)) (expt (abs(first v)) p)]
  [(empty? (rest(rest v))) (+ (expt (abs(first v)) p) (expt (abs(first (rest v))) p))]
  [ (empty? (rest(rest(rest v))))
   (+ (expt (abs(first v)) p) (expt (abs(first (rest v))) p)
  (expt (abs (first (rest (rest v)) )) p))]))

(check-expect (pnormp 1 (cons 3 (cons -4 (cons 5 empty)))) 12)
(check-expect (pnormp 4 (cons 2 (cons -3 empty))) 97)
(check-expect (pnormp 2 (cons -3 empty)) 9)
(check-expect (pnormp 2  empty) 0)
