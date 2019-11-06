;;(in-order? S1 S2 S3) measure if three strings S1 S2 S3 are placed in the correct order
;; in-order?: Str1 Str2 Str3 â†’ bool
;; example:
(check-expect (in-order? "a" "b" "c") true)
(check-expect (in-order? "a" "a" "c") true)
(check-expect (in-order? "b" "a" "b") false)
(define (in-order? S1 S2 S3)
  (cond
    [(and (string<=? S1 S2) (string<=? S2 S3)) true]
    [else false]))
;Test: 
(check-expect (in-order? "x" "y" "z") true)
(check-expect (in-order? "n" "m" "b") false)
(check-expect (in-order? "d" "n" "m") false)
(check-expect (in-order? "c" "n" "m") false)


;;(sort3 v) rearrange a list v of three strings S1 S2 S3
;;in the correct lexicographic order

;; sort3: (listof Str) â†’ (listof Str)
;; requires: list is length 3

;;example
(check-expect
(sort3 (cons "a" (cons "b" (cons "c" empty))))
(cons "a" (cons "b" (cons "c" empty))))

  
(define (sort3 v)
  (cond
  [(in-order? (first v) (first(rest v)) (first(rest(rest v))) ) v];abc
 [else
   (cond
     [(and  (string<=? (first v) (second v)) (string<=? (first v) (third v)) (string>=? (second v) (third v)) )
      (cons (first v)( cons (third v)( cons  (second v) empty))) ];acb
     [(and  (string>=? (third v) (first v)) (string>=? (third v) (second v)) (string<=? (second v) (first v)) )
      (cons (second v)( cons (first v)( cons  (third v) empty))) ];bac
     [(and  (string<=? (third v) (second v)) (string<=? (third v) (first v)) (string<=? (first v) (second v)) )
      (cons (third v)( cons (first v)( cons  (second v) empty))) ];bca
     [(and  (string<=? (third v) (second v)) (string<=? (third v) (first v)) (string>=? (first v) (second v)) )
      (cons (third v)( cons (second v)( cons  (first v) empty))) ];cba
     [(and  (string<=? (second v) (first v)) (string<=? (second v) (third v)) (string>=? (first v) (third v)) )
      (cons (second v)( cons (third v)( cons  (first v) empty))) ];cab
   )
  ]))

;;test:
(check-expect
(sort3 (cons "a" (cons "c" (cons "b" empty))))
(cons "a" (cons "b" (cons "c" empty))))
(check-expect
(sort3 (cons "b" (cons "a" (cons "c" empty))))
(cons "a" (cons "b" (cons "c" empty))))
(check-expect
(sort3 (cons "b" (cons "c" (cons "a" empty))))
(cons "a" (cons "b" (cons "c" empty))))
(check-expect
(sort3 (cons "c" (cons "b" (cons "a" empty))))
(cons "a" (cons "b" (cons "c" empty))))
(check-expect
(sort3 (cons "c" (cons "a" (cons "b" empty))))
(cons "a" (cons "b" (cons "c" empty))))


;; find the second largest string in the list
;;example:
(check-expect (find-second (cons "x" (cons "x" (cons "x" empty))))
empty)
(check-expect (find-second (cons "c" (cons "a" (cons "b" empty))))
"b")
(check-expect (find-second (cons "c" (cons "c" (cons "a" empty))))
"a")
(check-expect (find-second (cons "a" (cons "a" (cons "a" empty))))
empty)
(check-expect (find-second (cons "c" (cons "a" (cons "a" empty))))
"a")
;;find-second:  (listof Str) â†’ (anyof empty Str)
(define (find-second v)
 (cond
    [(and (equal? (first v) (third v)) (equal? (first v) (second v)) (equal? (second v) (third v))) empty];;aaa
    [(or (equal?(first v)(second v)) (equal?(first v)(third v)) (equal?(third v)(second v))) (first (sort3 v)) ]
    [else (second (sort3 v))]))
 




