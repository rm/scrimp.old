(define (fib-bad n)
  (if (< n 2)
      n
      (+ (fib-bad (- n 1))
         (fib-bad (- n 2)))))

(define (fib n)
  (define (iter a b c)
    (if (> c n)
        a
        (iter b (+ a b) (+ c 1))))
  (iter 0 1 1))

(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 50)
        ((= kinds-of-coins 5) 25)))

(define (my-change amount coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (null? coins)) 0)
        (else (+ (my-change amount (cdr coins))
                 (my-change (- amount (car coins)) coins)))))

;; ex. 1.11
(define (f1 n)
  (cond ((< n 3) n)
        (else (+ (f1 (- n 1))
                 (* 2 (f1 (- n 2)))
                 (* 3 (f1 (- n 3)))))))
(define (f2 n)
  (define (iter a b c d)
    (if (> d n)
        a
        (iter b c (+ (* 3 a) (* 2 b) c) (+ d 1))))
  (if (< n 3)
      n
      (iter 0 1 2 1)))

;;; ex. 1.12
(define (pascal n)
  (cond ((< n 1) '())
        ((= n 1) '(1))
        (else ??)))
;; no clue

(define (square n) (* n n))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        ((odd? n) (* b (fast-expt b (- n 1))))))

(define (faster-expt b n)
  (define (iter b n a)
    (cond ((= n 0) 1)
          ((= n 1) (* a b))
          ((even? n) (iter (square b) (/ n 2) a))
          ((odd? n) (iter b (- n 1) (* a b)))))
  (iter b n 1))

;; example 1.17
(define (*2 a b)
  (if (= b 0)
      0
      (+ a (*2 a (- b 1)))))

(define (*3 a b)
  (define (double n) (* n 2))
  (define (halve n) (/ n 2))
  (cond ((= b 0) 0)
        ((even? b) (*3 (double a) (halve b)))
        (else (+ a (*3 a (- b 1))))))

