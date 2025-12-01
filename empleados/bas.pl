:- dynamic empleado/3.

empleado('Ana', contabilidad, 900).
empleado('Luis', sistemas, 1200).
empleado('Sofía', marketing, 1100).

listar_empleados :-
  writeln('--- Empleaduchos ---'),
  ( empleado(N,D,S),
      format('Nombre: ~w | Depto: ~w | Salario: $~w~n',[N,D,S]),
      fail
  ; true ),
  writeln('----------------------------').

agregar_empleado(Nombre, Depto, Salario) :-
  assertz(empleado(Nombre, Depto, Salario)),
  format('✅ Se agregó a ~w en el departamento ~w con salario $~w.~n',[Nombre,Depto,Salario]).

eliminar_empleado(Nombre) :-
  retract(empleado(Nombre, Depto, Salario)),
  format('🗑  Se eliminó a ~w del departamento ~w (salario $~w).~n',[Nombre,Depto,Salario]),
  !.

eliminar_todos :-
  retractall(empleado(,,_)),
  writeln('Todos los empleados han sido eliminados.').

actualizar_empleado(Nombre, NuevoDepto, NuevoSalario) :-
  retract(empleado(Nombre, _, _)),
  assertz(empleado(Nombre, NuevoDepto, NuevoSalario)),
  format('🔁 Datos actualizados: ~w → Depto: ~w | Salario: $~w~n',[Nombre,NuevoDepto,NuevoSalario]),
  !.

agregar_unico(Nombre, Depto, Salario) :-
  ( empleado(Nombre, Depto, Salario) ->
      format('El empleado ~w ya está en ~w con salario $~w.~n',[Nombre,Depto,Salario])
  ; assertz(empleado(Nombre, Depto, Salario)),
    format('Se agregó a ~w en el departamento ~w con salario $~w.~n',[Nombre,Depto,Salario])
  ).

menu :-
  writeln('========= MENÚ ========='),
  writeln('1. Listar empleados'),
  writeln('2. Agregar empleado'),
  writeln('3. Eliminar empleado'),
  writeln('4. Actualizar empleado'),
  writeln('5. Agregar con validación'),
  writeln('6. Eliminar todos'),
  writeln('0. Salir'),
  writeln('========================').

main :-
  writeln('% SISTEMA DE EMPLEADOS INICIADO'),
  menu, loop.

loop :-
  write('Seleccione una opcion: '), read(Opc),
  ( Opc = 1 ->
      nl, listar_empleados, nl, menu, loop
  ; Opc = 2 ->
      write('Nombre (entre comillas si tiene tilde/espacio): '), read(N),
      write('Departamento (atomo, ej. ventas): '), read(D),
      write('Salario (número): '), read(S),
      agregar_empleado(N, D, S),
      nl, menu, loop
  ; Opc = 3 ->
      write('Nombre a eliminar: '), read(NE),
      ( eliminar_empleado(NE) -> true ; writeln('No se encontro ese empleado.') ),
      nl, menu, loop
  ; Opc = 4 ->
      write('Nombre: '), read(NA),
      write('Nuevo departamento: '), read(ND),
      write('Nuevo salario: '), read(NS),
      ( actualizar_empleado(NA, ND, NS) -> true ; writeln('No se encontró ese empleado.') ),
      nl, menu, loop
  ; Opc = 5 ->
      write('Nombre: '), read(N2),
      write('Departamento: '), read(D2),
      write('Salario: '), read(S2),
      agregar_unico(N2, D2, S2),
      nl, menu, loop
  ; Opc = 6 ->
      eliminar_todos,
      nl, menu, loop
  ; Opc = 0 ->
      writeln('Fin de la simulación de sesión del sistema de empleados'),
      writeln('==========================================')
  ; writeln('Opcion invalida.'), nl, menu, loop
  ).