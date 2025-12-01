arbol_mitologico(
    arbol(caos,
          arbol(gea,
            arbol(cronos,
                arbol(zeus,
                    arbol(atenea, nil, nil),
                    arbol(hermes, nil, nil)
                ),
                arbol(hades,
                    nil,
                    nil
                )
            ),
            arbol(rea, nil, nil)
        ),
        arbol(uranus, nil, nil)
    )
).

postorden(nil, []).
postorden(arbol(X, Izq, Der), L) :-
    postorden(Izq, L1),
    postorden(Der, L2),
    append(L1, L2, L3),
    append(L3, [X], L).


:- postorden(
       arbol(caos,
          arbol(gea,
            arbol(cronos,
                arbol(zeus,
                    arbol(atenea, nil, nil),
                    arbol(hermes, nil, nil)
                ),
                arbol(hades,
                    nil,
                    nil
                )
            ),
            arbol(rea, nil, nil)
        ),
        arbol(uranus, nil, nil)
    ), L
).