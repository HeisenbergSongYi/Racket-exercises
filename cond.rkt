(define (q1a-alt n a?)
  (cond[(and a?(>= n 0))(add1 n)]
       [(and a?(< n 0))(sub1 n)]
       [else 0]))

(define (q1b-alt a? b? c?)
  (cond[(and a? b?) 'elm]
      [(and a? (not b?) (not c?)) 'birch]
      [(and a? (not b?) c?) 'cedar]
      [(and (not a?) b?) 'pine]
      [(and (not a?) (not b?) (not c?)) 'birch]
      [else 'cherry]))
(check-expect(q1b-alt false false true) 'cherry)


(define (q1c-alt a? b? c?)
  (cond [(and a? (not b?) c?)'oak]
        [(and a? b? c?)'oak]
        [(and (not a?) b? c?) 'maple]
        [(and (not a?) (not b?)c?) 'willow]
        [(and a? b? (not c?)) 'walnut]
        [(and a? (not b?) (not c?)) 'dogwood]
        [(and (not a?) (not b?) (not c?)) 'sumac]
        [else 'buckthorn]))
(check-expect (q1c-alt false true false) 'buckthorn)



(define (q1d-alt a? b? c?)
  (cond
    [(and c? b?) 'spruce]
    [(and (not a?) b?) 'spruce]
    [(and (not a?) c?) 'fir]
    [(and  c? (not b?)) 'fir]
    [(and (not a?) (not b?) (not c?)) 'larch]
    [(and (not c?) (not b?) a?) 'hazel]
    [else 'hickory]))
