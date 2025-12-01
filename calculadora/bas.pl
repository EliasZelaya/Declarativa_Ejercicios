calculadora :- 

    write('1.Sumar'), nl, write('2. Restar'), nl,

    write('3. Dividir'), nl, write('4.Multiplicar')

    ,nl, write('Respuesta:'), read(Respuesta),

    write('Primer numero:'), read(X),
    write('Segundo numero:'), read(Y),

    (Respuesta == 1

    -> Resultado is X + Y, write(Resultado)

    ; Respuesta == 2

    -> Resultado is X-Y, write(Resultado)

    ; Respuesta == 3

    -> Resultado is X/Y, write(Resultado)

    ; Respuesta == 4

    -> Resultado is X*Y, write(Resultado)

    ;calculadora

    ).