;; (intentional-grounding) determine whether an act
;;is Intentional Grounding or not 
;;using three Bool value
;;underimminentpressure? insidethepocket?  towardsateammember?
;; intentional-grounding: Bool Bool Bool â†’ Bool
;; Example:
(check-expect (
intentional-grounding? true false false) false)

(define (intentional-grounding? underimminentpressure? insidethepocket? towardsateammember?)
  (and underimminentpressure? insidethepocket? towardsateammember?))

;;Tests:
(check-expect (
intentional-grounding? false false false) false)
(check-expect (
intentional-grounding? true false false) false)
(check-expect (
intentional-grounding? true true false) false)
(check-expect (
intentional-grounding? true true true) true)
(check-expect (
intentional-grounding? true false true) false)
(check-expect (
intentional-grounding? false false true) false)

;; (intentional-grounding-correct?) determine whether an act
;;is Intentional Grounding or not 
;;using four Bool value
;;underimminentpressure? insidethepocket?  towardsateammember? teammembereligible?
;; intentional-grounding: Bool Bool Bool Bool â†’ Bool
;; Example:
(check-expect (intentional-grounding-correct? true true true true) false)
(check-expect (intentional-grounding-correct? true true true false) true)

(define (intentional-grounding-correct? underimminentpressure? insidethepocket? towardsateammember? teammembereligible?)
  (and (and underimminentpressure? insidethepocket? towardsateammember?)(not teammembereligible?)))
;;Tests:
(check-expect (intentional-grounding-correct? true true true true) false)
(check-expect (intentional-grounding-correct? true true true false) true)
(check-expect (intentional-grounding-correct? true true false false) false)
(check-expect (intentional-grounding-correct? true false false false) false)
(check-expect (intentional-grounding-correct? false false false false) false)
(check-expect (intentional-grounding-correct? false false false true) false)
(check-expect (intentional-grounding-correct? false false true true) false)
(check-expect (intentional-grounding-correct? false true true true) false)

;; (intentional-grounding-penalty) decide the type of penalty for
;; Intentional Grounding using five Bool value
;;underimminentpressure? insidethepocket?  towardsateammember? teammembereligible? in-or-outside-endzone?
;; intentional-grounding: Bool Bool Bool Bool Boolâ†’ Sym
;; Example:
(check-expect (intentional-grounding-penalty true true true true true) 'None)

(define (intentional-grounding-penalty  underimminentpressure? insidethepocket? towardsateammember? teammembereligible? inside-endzone?)
                                       (cond
                                         [(and (intentional-grounding-correct? underimminentpressure? insidethepocket? towardsateammember? teammembereligible?) inside-endzone?) 'safety]
                                         [(and (intentional-grounding-correct? underimminentpressure? insidethepocket? towardsateammember? teammembereligible?) (not inside-endzone? )) '10yds]
                                         [else 'None]))

;;Test:
(check-expect (intentional-grounding-penalty true true true true true) 'None)
(check-expect (intentional-grounding-penalty true true true true false) 'None)
(check-expect (intentional-grounding-penalty true true true false false) '10yds)
(check-expect (intentional-grounding-penalty true true true false true) 'safety)
