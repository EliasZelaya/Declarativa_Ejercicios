% 1. SIMPLIFICACION SIMBOLICA BASICA
simplifica(+(0, X), X).
simplifica(+(X, 0), X).
simplifica(*(1, X), X).
simplifica(*(X, 1), X).
simplifica(*(0, _), 0).
simplifica(*(_, 0), 0).
simplifica(X, X).

% Ejemplo:
% ?- simplifica(*(1, +(0, X)), R).
% R = X.

% 2. DERIVACION SIMBOLICA
derivada(X, X, 1).
derivada(C, _, 0) :- number(C).
derivada(A + B, X, DA + DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
derivada(A * B, X, A*DB + B*DA) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
derivada(A - B, X, DA - DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).

% Ejemplo:
% ?- derivada(x*x + 3*x + 2, x, D).
% D = x*1 + x*1 + 3*1 + 0.


% 3. EVALUACION SIMBOLICA
evalua(X, X, V, V).
evalua(C, _, _, C) :- number(C).
evalua(A + B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA + RB.
evalua(A * B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA * RB.

% Ejemplo:
% ?- evalua(x*x + 3*x + 2, x, 2, R).
% R = 12.


% 4. SUMA DE FRACCIONES (REPRESENTACION SIMBOLICA)
suma(frac(A, B), frac(C, D), frac(N, M)) :-
    N is A*D + C*B,
    M is B*D.

% Ejemplo:
% ?- suma(frac(1,2), frac(1,3), R).
% R = frac(5,6).


% 5. RESOLUCION SIMBOLICA SENCILLA
resuelve(X + N = M, X, V) :-
    number(N), number(M),
    V is M - N.
resuelve(N + X = M, X, V) :-
    number(N), number(M),
    V is M - N.

% Ejemplo:
% ?- resuelve(x + 3 = 7, x, V).
% V = 4.
