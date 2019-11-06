;;process-input: Anyof string/ list -> list
;; make sure the varible type count-vowels receives is list 
(define (process-input sentence)
  (cond
    [(string? sentence) (string->list sentence)]
    [else sentence]))

;;Example
(check-expect (process-input (cons #\u( cons #\w empty))) (cons #\u( cons #\w empty)))
(check-expect (process-input "ez") (cons #\e( cons #\z empty)))


;;count-vowels: Any of string/ list ->number
;;(count-vowels sentence)count the number of vowels in a string,
;;upper and lower cases make no difference
(define (count-vowels sentence)
  (cond
  [(empty? (process-input sentence)) 0]
  [(equal? #\a (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\e (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\i (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\o (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\u (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\A (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\E (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\I (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\O (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [(equal? #\U (first (process-input sentence)))
   (+ 1 (count-vowels (rest (process-input sentence))))]
  [else
   (+ 0 (count-vowels (rest (process-input sentence))))]
  ))

;;Example:
(check-expect (count-vowels "aaaeeeiiiooouuu") 15)

;;Tests:
(check-expect (count-vowels "aaaeeeiiiooouuu") 15)
(check-expect (count-vowels "") 0)
(check-expect (count-vowels
               "racket is the worst programming language") 12)
(check-expect (count-vowels
               "123124") 0)
(check-expect (count-vowels "AEIOUSHIT") 6)
