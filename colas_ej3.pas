program colas_ej3;

uses
    sysutils, 
    uPilaInteger,
    uColaInteger;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;


{ 
    Ejercicio 3.2: Mostrar el contenido de una cola en orden inverso

    Desarrollar un subprograma que reciba una cola y muestre su contenido en orden inverso.

    Entradas: cola de enteros

    Salida: ninguna

    Condiciónes: 
        - La cola debe mantener su contenido y orden original
        - Complejidad de tiempo esperada: O(n)
        - Complejidad de espacio auxiliar esperada: 
            - O(1): ¡Increíble! No se necesita espacio adicional para resolver este problema.
            - O(n):  Muy bien, aunque se puede mejorar.
            - Superior a O(n): ¡Vaya! ¿No crees que se puede hacer mejor?

    Ejemplos: 
        - (cola: [1, 2, 3, 4, 5]) => 5 4 3 2 1
}

{ Opción 1: Usar una pila }
procedure mostrar_inverso_pila(c: tCola);
var
    aux: tPilaEnteros;
    x : integer;
    i, size: integer;
begin
    initialize(aux);
    size := num_elems(c);
    for i := 1 to size do
    begin
        x := first(c);
        enqueue(c, x);
        push(aux, x);
        dequeue(c);
    end;
    WriteLn(uPilaInteger.toString(aux));
end;



{ Opción 2: Usar recursión }
procedure mostrar_inverso_const(var c: tCola);
var
    x: integer;
    size: integer;
    i: integer;
    s : string;
begin
    size := num_elems(c);
    s := '';
    for i := 1 to size do
    begin
        x := first(c);
        s := IntToStr(x) + ' ' + s;
        dequeue(c);
        enqueue(c, x);
    end;
    WriteLn(s);
end;


{ Opción 3: Usar recursión }
procedure mostrar_inverso_rec(c: tCola; times: integer; var s: string);
var
    x: integer;
begin
    if times <> 0 then
    begin
        x := first(c);
        dequeue(c);
        enqueue(c, x);
        mostrar_inverso_rec(c, times - 1, s);
        s := s + IntToStr(x) + ' ';
    end;
end;


procedure mostrar_inverso(c: tCola);
var
    s: string;
    times: integer;
begin
    s := '';
    times := num_elems(c);
    mostrar_inverso_rec(c, times, s);
    WriteLn(s);
end;

var
    c: tCola;


begin
    initialize_queue(c);

    enqueue(c, 1);
    enqueue(c, 2);
    enqueue(c, 3);
    enqueue(c, 4);
    enqueue(c, 5);

    WriteLn('Cola original:');
    WriteLn(toString(c));

    WriteLn;
    WriteLn('Mostrar inverso con pila:');
    mostrar_inverso_pila(c);
    WriteLn;
    WriteLn('Cola original:');
    WriteLn(toString(c));

    readln;
end.