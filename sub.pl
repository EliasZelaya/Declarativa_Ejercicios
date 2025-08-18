ave(loro).
ave(aguila).
ave(pinguino).

% que come cada ave
come(loro,semillas).
come(aguila, carne).
come(pinguino, pescado).

%regla
comida(X):-ave(X), X \= aguila.