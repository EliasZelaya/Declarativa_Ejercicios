#lang racket

(define (contar-pares lista)
  (length (filter even? lista)))

(displayln (contar-pares '(1 2 3 4 5 6))) 

(define (sumar-cuadrados lista)
  (foldl + 0 (map (lambda (x) (* x x)) lista)))

(displayln (sumar-cuadrados '(1 2 3 4))) 

(define (procesar-lista lista f)
  (define transformada (map f lista))
  (define suma (foldl + 0 transformada))
  (list lista transformada suma))

(displayln (procesar-lista '(1 2 3) (lambda (x) (* x 2))))

(define (promedio-positivos lista)
  (define positivos (filter (lambda (x) (> x 0)) lista))
  (define suma (foldl + 0 positivos))
  (define cantidad (length positivos))
  (exact->inexact (/ suma cantidad)))

(displayln (promedio-positivos '(-3 2 5 -1 7)))

(define (maximo-funcional lista)
  (foldl (lambda (elem acc)
           (if (> elem acc) elem acc))
         (first lista)
         (rest lista)))

(displayln (maximo-funcional '(3 8 2 10 5)))

(define (cuadrado x)
  (* x x))