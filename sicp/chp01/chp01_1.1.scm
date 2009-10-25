(define (square x) (* x x))

; Ex1.3
(define (sum-larger-squares a b c)
  (cond ((and (< a b) (< a c)) (+ (square b) (square c)))
        ((and (< b a) (< b c)) (+ (square a) (square c)))
        (else (+ (square a) (square b)))))

(define (average a b) (/ (+ a b) 2))

(define (sqrt n)
  (define (good-enough? guess)
    (< (abs (- (square guess)
               n))
       0.00001))
  (define (improve guess)
    (average guess (/ n guess)))
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (iter 1.0))

;; ex. 1.7
(define (sqrt2 n)
  (define (good-enough? guess)
    (< (/ (abs (- guess (improve guess)))
          guess)
       0.00001))
  (define (improve guess)
    (average guess (/ n guess)))
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (iter 1.0))

;;; I don't get it good-enough? is all I changed, it works better 
;;; for small numbers, isnt' so good for large numbers but seems
;;; to be faster than the original sqrt

;; ex. 1.8  only improve needs to change
(define (cube-root n)
  (define (good-enough? guess)
    (< (/ (abs (- guess (improve guess)))
          guess)
       0.00001))
  (define (improve guess)
    (/ (+ (/ n (square guess))
          (* 2 guess))
       3))
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (iter 1.0))