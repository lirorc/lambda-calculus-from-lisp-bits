;true
(define true (lambda (x) (lambda (y)
  (eval x (interaction-environment)))))
;false
(define false (lambda (x) (lambda (y)
  (eval y (interaction-environment)))))

;not: (nott true) -> false
(define nott
  (lambda (x)
    ((x false) true)))

;and: ((andd true) false) -> false
(define andd
  (lambda (x) (lambda (y)
    ((x y) false))))

;or: ((orr true) false) -> true
(define orr
  (lambda (x) (lambda (y)
    ((x true) y))))

;xor: ((xor true) false) -> true
(define xor
  (lambda (x) (lambda (y)
    ((x (nott y)) y))))

;if: (((if true) one) zero) -> one
(define iff
  (lambda (x) (lambda (y) (lambda (z)
    ((x y) z)))))

;zero
(define zero
  (lambda (f) (lambda (x) x)))
;one
(define one
  (lambda (f) (lambda (x) (f x))))
;two
(define two
  (lambda (f) (lambda (x) (f (f x)))))
;three
(define three
  (lambda (f) (lambda (x) (f (f (f x))))))
;four
(define four
  (lambda (f) (lambda (x) (f (f (f (f x)))))))
;five
(define five
  (lambda (f) (lambda (x) (f (f (f (f (f x))))))))

;addition: ((two ++) one) -> 2+1 = 3
(define ++
  (lambda (y) (lambda (f)
    (lambda (x) (f ((y f) x))))))

;multiplication: ((** one) two) -> 1*2 = 2
(define **
  (lambda (x) (lambda (y)
    (lambda (f) (x (y f))))))

;exponentional: ((^ two) three -> 2^3 = 8
(define ^
  (lambda (n) (lambda (m)
    (m n))))

;zero?
(define iszero?
  (lambda (x) (((x false) nott) false)))

;make a pair: ((pair two) one) -> [two, one]
(define pair
  (lambda (x) (lambda (y)
    (lambda (z) ((z x) y)))))

;car: (head ((pair two) one)) -> two
(define head
  (lambda (p) (p true)))

;cdr: (tail ((pair two) one)) -> one
(define tail
  (lambda (p) (p false)))

;even?: (iseven? two) -> true
(define iseven?
  (lambda (x) ((x nott) true)))

;(n, n2 -> n+1, n)
(define phi
  (lambda (p)
    (lambda (z) ((z (++ (p true))) (p true)))))

;predecessor: ((one --) two) -> 2-1 = 1
(define --
  (lambda (n)
    (((n phi) ((pair zero) zero)) false)))

;greater-than-or-equal?: ((ge? two) one) -> true
(define ge?
  (lambda (x) (lambda (y)
    (iszero? ((x --) y)))))

;equal?: ((e? two) two) -> true
(define e?
  (lambda (x) (lambda (y)
    ((andd ((ge? x) y))
         ((ge? y) x)))))

;greater?: ((g two) one) -> true, ((g? two) two) -> false
(define g?
  (lambda (x) (lambda (y)
    (nott ((ge? y) x)))))

;remainder: ((rem four) three) -> one
(define rem
  (lambda (n) (lambda (m)
    (((iff ((ge? n) m))
            `((rem ((,m --) ,n)) ,m))
            n))))

;division: ((// four) three) -> 4/3 = 1
(define //
  (lambda (numo) (lambda (deno)
    (((iff ((g? numo) deno))
            `((one ++) ((// ((,deno --) ,numo)) ,deno)))
            zero))))

;add all integers to n: (sum n) -> 1 + 2 + .. + (n-1) + n
(define sum
  (lambda (n)
    (((iff (iszero? n))
            zero)
            `((,n ++) (sum (-- ,n))))))

;factorial: (factorial four) -> 4*3*2*1 = 24
(define factorial
  (lambda (n)
    (((iff (iszero? n))
            one)
            `((** ,n) (factorial (-- ,n))))))

;fizz-buzz: 1=fizz, 2=buzz, 3=fizz-buzz: (fizz-buzz five) -> 2
(define fizz-buzz
  (lambda (n)
    (((((iff (iszero? ((rem n) three)))
        one)
       zero)
      ++)
     (((iff (iszero? ((rem n) five)))
       two)
      zero))))

;for debugging: (show-number four) -> ay ay ay ay (almost a jojo reference)
(define show-number
  (lambda (x) ((x (lambda (x) (display "ay\n"))) zero)))

;for debugging: (lam-num 3) -> üç
(define lam-num
  (lambda (x)
    ((one ++) (if (> x 1) (lam-num (- x 1)) zero))))
