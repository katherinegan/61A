; Lab 14: Final Review

(define (compose-all funcs)
  ; (define (inner funcs x))
  ;   (cond (null? (cdr funcs) (car funcs x))
  ;   (else (inner (cdr funcs) (car funcs x)))
  ;   )

  ; (inner funcs)
  (lambda (x)
    (if (null? funcs) x
    ((compose-all (cdr funcs)) ((car funcs) x)))
  
  )
)