;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname box-office) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;(box-office-profits) estimated box office profits using
;;moviename studioname famousactornum explonumb
;; box-office-profits: Str Str Nat Nat â†’ Int
;; Example:
(check-expect (box-office-profits "The Boob" "DC" 1 1) -239)


 (define shortnamereward 25)
 (define good-name-length 10)
 (define thepenalty -50)
 (define Marvelbonus 500)
 (define DCpenalty -250)
 (define Famousactorbouns 50)
 (define oneexplosionreward 6)

 (define (nameeffect moviename)
   (cond
     [(< (string-length moviename) good-name-length) shortnamereward]
     [else 0]))

(define (theeffect moviename)
   (cond
     [(string-contains? "The" moviename) thepenalty]
     [else 0]))

 (define (studioeffect studioname)
   (cond
     [(string=? "Marvel" studioname) Marvelbonus]
     [(string=? "DC" studioname) DCpenalty]
     [else 0]))

(define (famousactoreffect famousactornum)
  (* famousactornum Famousactorbouns))

(define (explosionnumber explonumb)
  (-(* explonumb oneexplosionreward) 20))

(define (box-office-profits moviename studioname famousactornum explonumb)
 (+ (nameeffect moviename) (theeffect moviename) (studioeffect studioname) (famousactoreffect famousactornum) (explosionnumber explonumb))
  )

;; Tests:
(check-expect (box-office-profits
"Avengers: more endgames" "Marvel" 4 50 ) 980)
(check-expect (box-office-profits
"The Slog" "New Line Cinema" 0 0 ) -45)
(check-expect (box-office-profits
"The12345" "Marvel" 5 5 ) 735)
(check-expect (box-office-profits
"The12345" "DC" 5 5 ) -15)
(check-expect (box-office-profits
"The1234567890123456" "DC" 5 5 ) -40)
(check-expect (box-office-profits
"1234567890123456" "DC" 5 5 ) 10)
