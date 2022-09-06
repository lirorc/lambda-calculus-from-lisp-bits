(let
  ((true (lambda (x) (lambda (y)
     (eval x (interaction-environment)))))
   (false (lambda (x) (lambda (y)
     (eval y (interaction-environment))))))
  (let  ((nott
          (lambda (x)
            ((x false) true)))
         (andd
           (lambda (x) (lambda (y)
             ((x y) false))))
         (orr
           (lambda (x) (lambda (y)
             ((x true) y)))))
    (let
      ((xor
         (lambda (x) (lambda (y)
           ((x (nott y)) y))))
       (iff
         (lambda (x) (lambda (y) (lambda (z)
         ((x y) z)))))
       (zero
         (lambda (f) (lambda (x) x)))
       (one
         (lambda (f) (lambda (x) (f x))))
       (two
         (lambda (f) (lambda (x) (f (f x)))))
       (three
         (lambda (f) (lambda (x) (f (f (f x))))))
       (four
         (lambda (f) (lambda (x) (f (f (f (f x)))))))
       (five
         (lambda (f) (lambda (x) (f (f (f (f (f x))))))))
       (++
         (lambda (y) (lambda (f)
           (lambda (x) (f ((y f) x))))))
       (**
         (lambda (x) (lambda (y)
           (lambda (f) (x (y f))))))
       (^
         (lambda (n) (lambda (m)
           (m n))))
       (iszero?
         (lambda (x) (((x false) nott) false)))
       (pair
         (lambda (x) (lambda (y)
           (lambda (z) ((z x) y)))))
       (head
         (lambda (p) (p true)))
       (tail
         (lambda (p) (p false)))
       (iseven?
         (lambda (x) ((x nott) true))))
    (iseven? (head ((pair two) five)))
      )))
