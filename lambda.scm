;true
(define doğru (lambda (x) (lambda (y) x)))
;false
(define yanlış (lambda (x) (lambda (y) y)))

;not: (zıt doğru) -> yanlış
(define zıt 
  (lambda (x) ((x yanlış) doğru)))
;and: ((ve doğru) yanlış) -> yanlış
(define ve
  (lambda (x) (lambda (y) ((x y) yanlış))))
;or: ((veya yanlış) doğru) -> doğru
(define veya
  (lambda (x) (lambda (y) ((x doğru) y))))

;if: (((eğer doğru) bir) sıfır) -> bir
(define eğer
  (lambda (x) (lambda (y) (lambda (z) ((x y) z)))))

;zero
(define sıfır
  (lambda (f) (lambda (x) x)))
;one
(define bir
  (lambda (f) (lambda (x) (f x))))
;two
(define iki
  (lambda (f) (lambda (x) (f (f x)))))

;addition: ((iki ++) bir) -> 2+1 = 3
(define ++
  (lambda (y) (lambda (f)
                (lambda (x) (f ((y f) x))))))

;is-zero?
(define sıfır?
  (lambda (x) (((x yanlış) zıt) yanlış)))

;make a pair: ((liste iki) bir) -> [iki, bir]
(define liste
  (lambda (x) (lambda (y)
                (lambda (z) ((z x) y)))))

;even?: (çift-sayı? iki) -> doğru
(define çift-sayı?
  (lambda (x) ((x zıt) doğru)))

;(n, n2 -> n+1, n)
(define fi
  (lambda (liste) 
    (lambda (z) ((z (++ (liste doğru))) (liste doğru)))))

;predecessor: ((bir --) iki) -> 2-1 = 1
(define --
  (lambda (n)
    (((n fi) ((liste sıfır) sıfır)) yanlış)))

;greater-than-or-equal?: ((büyük-eşittir iki) bir) -> doğru
(define büyük-eşittir?
  (lambda (x) (lambda (y)
                (sıfır? ((x --) y)))))

;equal?: ((eşittir? iki) iki) -> doğru
(define eşittir?
  (lambda (x) (lambda (y)
                ((ve ((büyük-eşittir? x) y))
                     ((büyük-eşittir? y) x)))))
