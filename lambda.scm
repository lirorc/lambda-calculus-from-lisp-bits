;true
(define doğru (lambda (x) (lambda (y)
  (eval x (interaction-environment)))))
;false
(define yanlış (lambda (x) (lambda (y)
  (eval y (interaction-environment)))))

;not: (zıt doğru) -> yanlış
(define zıt 
  (lambda (x)
    ((x yanlış) doğru)))

;and: ((ve doğru) yanlış) -> yanlış
(define ve
  (lambda (x) (lambda (y)
    ((x y) yanlış))))

;or: ((veya doğru) yanlış) -> doğru
(define veya
  (lambda (x) (lambda (y)
    ((x doğru) y))))

;xor: ((yada doğru) yanlış) -> doğru
(define yada
  (lambda (x) (lambda (y)
    ((x (zıt y)) y))))

;if: (((eğer doğru) bir) sıfır) -> bir
(define eğer
  (lambda (x) (lambda (y) (lambda (z)
    ((x y) z)))))

;zero
(define sıfır
  (lambda (f) (lambda (x) x)))
;one
(define bir
  (lambda (f) (lambda (x) (f x))))
;two
(define iki
  (lambda (f) (lambda (x) (f (f x)))))
;three
(define üç
  (lambda (f) (lambda (x) (f (f (f x))))))
;four
(define dört
  (lambda (f) (lambda (x) (f (f (f (f x)))))))
;five
(define beş
  (lambda (f) (lambda (x) (f (f (f (f (f x))))))))

;addition: ((iki ++) bir) -> 2+1 = 3
(define ++
  (lambda (y) (lambda (f)
    (lambda (x) (f ((y f) x))))))

;multiplication: ((** bir) iki) -> 1*2 = 2
(define **
  (lambda (x) (lambda (y)
    (lambda (f) (x (y f))))))

;exponentional: ((^^ iki) üç) -> 2^3 = 8
(define ^^
  (lambda (n) (lambda (m)
    (m n))))

;is-zero?
(define sıfır?
  (lambda (x) (((x yanlış) zıt) yanlış)))

;make a pair: ((liste iki) bir) -> [iki, bir]
(define liste
  (lambda (x) (lambda (y)
    (lambda (z) ((z x) y)))))

;car: (baş ((liste iki) bir)) -> iki
(define baş
  (lambda (listem) (listem doğru)))

;cdr: (kuyruk ((liste iki) bir)) -> bir
(define kuyruk
  (lambda (listem) (listem yanlış)))

;even?: (çift-sayı? iki) -> doğru
(define çift-sayı?
  (lambda (x) ((x zıt) doğru)))

;(n, n2 -> n+1, n)
(define fi
  (lambda (listem) 
    (lambda (z) ((z (++ (listem doğru))) (listem doğru)))))

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

;greater?: ((büyüktür? iki) bir) -> doğru, ((büyüktür? iki) iki) -> yanlış
(define büyüktür?
  (lambda (x) (lambda (y)
    (zıt ((büyük-eşittir? y) x)))))

;remainder: ((kalan dört) üç) -> bir
(define kalan
  (lambda (n) (lambda (m)
    (((eğer ((büyük-eşittir? n) m))
            `((kalan ((,m --) ,n)) ,m))
            n))))

;division: ((// dört) üç) -> 4/3 = 1
(define //
  (lambda (numo) (lambda (deno)
    (((eğer ((büyüktür? numo) deno))
            `((bir ++) ((// ((,deno --) ,numo)) ,deno)))
            sıfır))))

;add all integers to n: (topla n) -> 1 + 2 + .. + (n-1) + n
(define topla
  (lambda (n)
    (((eğer (sıfır? n))
            sıfır)
            `((,n ++) (topla (-- ,n))))))

;factorial: (faktoryal dört) -> 4*3*2*1 = 24
(define faktoryal
  (lambda (n)
    (((eğer (sıfır? n))
            bir)
            `((** ,n) (faktoryal (-- ,n))))))

;fizz-buzz: 1=fizz, 2=buzz, 3=fizz-buzz: (fizz-buzz beş) -> 2
(define fizz-buzz
  (lambda (n)
    (((((eğer (sıfır? ((kalan n) üç)))
        bir)
       sıfır)
      ++)
     (((eğer (sıfır? ((kalan n) beş)))
       iki)
      sıfır))))

;for debugging: (sayı-göster dört) -> ay ay ay ay (almost a jojo reference)
(define sayı-göster
  (lambda (x) ((x (lambda (x) (display "ay\n"))) sıfır)))

;for debugging: (lam-sayı 3) -> üç
(define lam-sayı
  (lambda (x)
    ((bir ++) (if (> x 1) (lam-sayı (- x 1)) sıfır))))
