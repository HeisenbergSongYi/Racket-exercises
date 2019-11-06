;;(remove-duplicates listofnum) take a list of numbers
;;and if a number appers twice only take the last one
;;then output the list without duplicates
;;(remove-duplicates listofnum): list of num -> list of num

(define (remove-duplicates listofnum)
  (cond
    [(empty? listofnum) empty]
    [(member? (first listofnum)(rest listofnum))
    (remove-duplicates (rest listofnum))]
    [(not (member? (first listofnum)(rest listofnum)))
     (cons (first listofnum) (remove-duplicates (rest listofnum)))]
    ))

;;Example:
(check-expect (remove-duplicates (cons 1 (cons 3 (cons 1 (cons 2
(cons 4 (cons 2 (cons 7 (cons 2
(cons 5 empty))))))))))
(cons 3 (cons 1 (cons 4 (cons 7 (cons 2 (cons 5 empty)))))))

;;Tests:
(check-expect (remove-duplicates empty) empty)
(check-expect (remove-duplicates (cons 3 (cons 5 (cons 7 empty))))
              (cons 3 (cons 5 (cons 7 empty))))
(check-expect (remove-duplicates (cons 3 (cons 7 (cons 7 empty))))
              (cons 3 (cons 7 empty)))
(check-expect (remove-duplicates (cons 1 (cons 1 (cons 4 (cons 5 (cons 1 (cons 4 empty)))))))
              (cons 5(cons 1(cons 4 empty))))
