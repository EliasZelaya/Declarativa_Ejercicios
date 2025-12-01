:-[bas].

% Hermanos
hermano(X, Y) :- 
    padre(P, X), padre(P, Y), 
    madre(M, X), madre(M, Y), 
    X \= Y.

% Abuelos
abuelo(X, Y) :- hombre(X), padre(X, Z), (padre(Z, Y); madre(Z, Y)).
abuela(X, Y) :- mujer(X), madre(X, Z), (padre(Z, Y); madre(Z, Y)).

% Tíos/Tías
tio(X, Y) :- hombre(X), hermano(X, Z), (padre(Z, Y); madre(Z, Y)).
tia(X, Y) :- mujer(X), hermano(X, Z), (padre(Z, Y); madre(Z, Y)).

% Primos
primo(X, Y) :- 
    (padre(P1, X); madre(P1, X)),
    (padre(P2, Y); madre(P2, Y)),
    hermano(P1, P2),
    X \= Y.

% Suegros
suegro(X, Y) :- hombre(X), padre(X, Z), casado_con(Y, Z).
suegra(X, Y) :- mujer(X), madre(X, Z), casado_con(Y, Z).

% Cuñados
cunado(X, Y) :- 
    hombre(X),
    casado_con(X, Z),
    hermano(Z, W),
    casado_con(Y, W),
    X \= Y.

% Trabajan en la misma aldea
companeros_aldea(X, Y) :- 
    vive_en(X, A), 
    vive_en(Y, A), 
    X \= Y.

% Aldeas aliadas
aldeas_aliadas(X, Y) :- alianza(X, Y).

% Persona tiene conflicto
en_conflicto(X) :- rival(X, _).

% Persona casada
casado(X) :- casado_con(X, _).