;;(count-change listofcoins): consume a list of canadian coins
;;and produce the sum of all the coins value if encounter
;;foreign coins then do not count

;;(count-change listofcoins):List of coins -> Num
(define (count-change listofcoins)
  (cond
    [(empty? listofcoins) 0]
    [(equal? 'nickel (first listofcoins))
     (+ 5 (count-change (rest listofcoins)))]
    [(equal? 'dime (first listofcoins))
     (+ 10 (count-change (rest listofcoins)))]
    [(equal? 'quarter (first listofcoins))
     (+ 25 (count-change (rest listofcoins)))]
    [(equal? 'loonie (first listofcoins))
     (+ 100 (count-change(rest listofcoins)))]
    [(equal? 'toonie (first listofcoins))
     (+ 200 (count-change (rest listofcoins)))]
    [else
     (+ 0 (count-change (rest listofcoins)))]
    ))

;;Example:
(check-expect (count-change (cons 'dime (cons 'dime empty))) 20)

;;Test:
(check-expect (count-change (cons 'yuan
                                  (cons 'jiao
                                        (cons 'jiba
                                              (cons 'toonie empty))))) 200)
(check-expect (count-change (cons 'nickel (cons 'nickel empty))) 10)
(check-expect (count-change (cons 'quarter (cons 'quarter empty))) 50)
(check-expect (count-change (cons 'loonie (cons 'loonie empty))) 200)
(check-expect (count-change (cons 'toonie (cons 'toonie empty))) 400)


;;(make-change moneyvalue): consume a value of CAD in cents and produce
;;a list of coins with the same value (in cents)
;;requires: the moneyvalue should be a natural number
;;(make-change moneyvalue): Num -> Lits of Sym
(define (make-change moneyvalue)
  (cond
    [(= 0 moneyvalue) empty]
    [(<= 200 moneyvalue) (cons 'toonie (make-change (- moneyvalue 200)))]
    [(<= 100 moneyvalue) (cons 'loonie (make-change (- moneyvalue 100)))]
    [(<= 25 moneyvalue) (cons 'quarter (make-change (- moneyvalue 25)))]
    [(<= 10 moneyvalue) (cons 'dime (make-change (- moneyvalue 10)))]
    [(<= 5 moneyvalue) (cons 'nickel (make-change (- moneyvalue 5)))]
    [(and (> 5 moneyvalue)(< 2 moneyvalue))
     (cons 'nickel (make-change (- moneyvalue 5)))]
    [(<= moneyvalue 2)
     empty]))
;;Examples:
(check-expect (count-change (make-change 137)) 135)
(check-expect (make-change 11) (cons 'dime empty))
;;Tests:
(check-expect (make-change 500) (cons 'toonie (cons 'toonie
              (cons 'loonie empty))))
(check-expect (make-change 505) (cons 'toonie (cons 'toonie
              (cons 'loonie (cons 'nickel empty)))))
(check-expect (make-change 504) (cons 'toonie (cons 'toonie
              (cons 'loonie (cons 'nickel empty)))))
(check-expect (make-change 503) (cons 'toonie (cons 'toonie
              (cons 'loonie (cons 'nickel empty)))))
(check-expect (make-change 502) (cons 'toonie (cons 'toonie
              (cons 'loonie empty))))
(check-expect (make-change 501) (cons 'toonie (cons 'toonie
              (cons 'loonie  empty))))

