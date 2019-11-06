;;(primehelper1 naturalnumber i) determine if a natural number is prime
;;or not by finding its remainder with its value decrease 1 each time
;;(primehelper1 naturalnumber i): Num->Bool

;;Requires: naturalnumber should be a natural number XD

(define (primehelper1 naturalnumber i)
  (cond
    [(= naturalnumber 1) true]
    [(and (not(= i 1))
          (= (remainder naturalnumber i) 0))false]
    [else
     (cond
       [(= i 1) true]
       [else (primehelper1 naturalnumber (sub1 i))]
       )]))
;;Example:
(check-expect (primehelper1 3 2) true)
;;-------------------------------------------------------------------

;;(primehelper2 naturalnumber) take a natural number and give the value itself
;;and the value of itself deducted by 1 to the helperfunction primehelper1 in
;;each loop (recursion)
;;(primehelper2 naturalnumber): Num->Bool
;;Requires: naturalnumber should be a natural number

(define (primehelper2 naturalnumber)
  (primehelper1 naturalnumber (sub1 naturalnumber)))
;;Example:
(check-expect (primehelper2 9) false)
;;------------------------------------------------------------------
;;(prime? naturalnumber) take a natural number determine if it
;;is prime with the help of helper functions
;;(prime? naturalnumber): Num->Bool
;;Requires: naturalnumber should be a natural number

(define (prime? naturalnumber)
  (primehelper2 naturalnumber))
;;Examples:
(check-expect (prime? 17) true)
(check-expect (prime? 100) false)

;;Tests:
(check-expect (prime? 3) true)
(check-expect (prime? 9 ) false)
(check-expect (prime? 10456456) false)
(check-expect (prime? 7) true)
(check-expect (prime? 1) true)
;;-----------------------------------------------------------------
;;(define (next-prime somenumber) consumes a natural number
;;and output the next prime number bigger than it
;;(prime? naturalnumber): Num->Num
;;Requires: somenumber should be a natural number

(define (next-prime somenumber)
  (cond
    [(prime? (countup somenumber)) (countup somenumber)]
    [else (next-prime (countup somenumber))]))

(define (countup somenumber)
  (add1 somenumber))
;;Examples:
(check-expect (next-prime 7) 11)
(check-expect (next-prime 15) 17)

;;Tests:
(check-expect (next-prime 1)
              2)
(check-expect (next-prime 2)
              3)
(check-expect (next-prime 3)
              5)
(check-expect (next-prime 5)
              7)
(check-expect (next-prime 11)
              13)
;;---------------------------------------------------------------
;;(prime-range head tail):consumes two natural numbers and produces the
;;list of all prime numbers in the interval that starts with the first
;;number and ends with the second number
;;(prime-range head tail): Num Num->List
;;Requires: head and tail should be natural number

(define (prime-range head tail)
  (cond
    [(> head tail) empty]
    [(> (next-prime head) tail) empty]
    [(= (next-prime head) tail) (cons tail empty)]
    [(< (next-prime head) tail)
     (cons (next-prime head) (prime-range (next-prime head) tail) )]
  ))

;;Examples:
(check-expect (prime-range 1 10)
(cons 2 (cons 3 (cons 5 (cons 7 empty)))))
(check-expect (prime-range 10 1) empty)

;;Tests:
(check-expect (prime-range 1 100) (cons
 2
 (cons
  3
  (cons
   5
   (cons
    7
    (cons
     11
     (cons
      13
      (cons
       17
       (cons
        19
        (cons
         23
         (cons
          29
          (cons
           31
           (cons
            37
            (cons
             41
             (cons
              43
              (cons
               47
               (cons
                53
                (cons
                 59
                 (cons
                  61
                  (cons
                   67
                   (cons
                    71
                    (cons
                     73
                     (cons
                      79
                      (cons
                       83
                       (cons
                        89
                        (cons
                         97
                         empty))))))))))))))))))))))))))
