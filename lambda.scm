;true
(define doğru (lambda (x) (lambda (y) x)))
;false
(define yanlış (lambda (x) (lambda (y) y)))

;not
(define zıt 
  (lambda (x) ((x yanlış) doğru)))
;and
(define ve
  (lambda (x) (lambda (y) ((x y) yanlış))))
;or
(define veya
  (lambda (x) (lambda (y) ((x doğru) y))))

;if
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

;addition
(define ++
  (lambda (y)
    (lambda (f) (lambda (x) (f ((y f) x))))))

;is-zero?
(define sıfır?
  (lambda (x) (((x yanlış) zıt) yanlış)))

;make a pair
(define liste
  (lambda (x) (lambda (y)
                (lambda (z) ((z x) y)))))

;even?
(define çift-sayı?
  (lambda (x) ((x zıt) doğru)))

;(n, n2 -> n+1, n)
(define fi
  (lambda (liste) 
    (lambda (z) ((z (++ (liste doğru))) (liste doğru)))))
