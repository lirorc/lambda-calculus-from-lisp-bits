(let
  ((true (lambda (x) (lambda (y) (eval x (interaction-environment)))))
   (false (lambda (x) (lambda (y) (eval y (interaction-environment))))))
(let
  ((not (lambda (x) ((x false) true)))
   (and (lambda (x) (lambda (y) ((x y) false))))
   (or (lambda (x) (lambda (y) ((x true) y)))))
(let
  ((xor (lambda (x) (lambda (y) ((x (not y)) y))))
   (if (lambda (x) (lambda (y) (lambda (z) ((x y) z)))))
   (zero (lambda (f) (lambda (x) x)))
   (one (lambda (f) (lambda (x) (f x))))
   (two (lambda (f) (lambda (x) (f (f x)))))
   (three (lambda (f) (lambda (x) (f (f (f x))))))
   (four (lambda (f) (lambda (x) (f (f (f (f x)))))))
   (five (lambda (f) (lambda (x) (f (f (f (f (f x))))))))
   (+ (lambda (y) (lambda (f) (lambda (x) (f ((y f) x))))))
   (* (lambda (x) (lambda (y) (lambda (f) (x (y f))))))
   (^ (lambda (n) (lambda (m) (m n))))
   (zero? (lambda (x) (((x false) not) false)))
   (pair (lambda (x) (lambda (y) (lambda (z) ((z x) y)))))
   (head (lambda (p) (p true)))
   (tail (lambda (p) (p false)))
   (even? (lambda (x) ((x not) true))))
(let
  ((phi (lambda (p) (lambda (z) ((z (+ (p true))) (p true))))))
(let
  ((- (lambda (n) (((n phi) ((pair zero) zero)) false))))
(let
  ((ge? (lambda (x) (lambda (y) (zero? ((x -) y))))))
(let
  ((eq? (lambda (x) (lambda (y) ((and ((ge? x) y)) ((ge? y) x)))))
   (g? (lambda (x) (lambda (y) (not ((ge? y) x)))))
   (l? (lambda (x) (lambda (y) (not ((ge? x) y))))))
(let
  ((remainder (lambda (h n m)
                (((if ((l? n) m)) n) (list h h ((m -) n)  m)))))
  (remainder remainder five one)))))))))
