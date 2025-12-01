% Suma
suma(X, Y, Resultado) :-
    Resultado is X + Y.

% Resta
resta(X, Y, Resultado) :-
    Resultado is X - Y.

% Multiplicación
multiplicacion(X, Y, Resultado) :-
    Resultado is X * Y.

% División
division(X, Y, Resultado) :-
    Y =\= 0,
    Resultado is X / Y.

calculadora :-
    write('Ingrese la operacion (suma, resta, multiplicacion, division): '), nl,
    read(Op),
    write('Ingrese el primer numero: '), nl,
    read(X),
    write('Ingrese el segundo numero: '), nl,
    read(Y),
    ejecutar(Op, X, Y).

ejecutar(suma, X, Y) :-
    suma(X, Y, R),
    write('El resultado es: '), write(R), nl.

ejecutar(resta, X, Y) :-
    resta(X, Y, R),
    write('El resultado es: '), write(R), nl.

ejecutar(multiplicacion, X, Y) :-
    multiplicacion(X, Y, R),
    write('El resultado es: '), write(R), nl.

ejecutar(division, X, Y) :-
    division(X, Y, R),
    write('El resultado es: '), write(R), nl.