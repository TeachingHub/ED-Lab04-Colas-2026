program colas_ej6;

uses
    sysutils, 
    uCliente,
    uColaClientes;

const
    cliente1: tCliente = (cod_cliente: '1'; activo: true);
    cliente2: tCliente = (cod_cliente: '2'; activo: false);
    cliente3: tCliente = (cod_cliente: '3'; activo: true);
    cliente4: tCliente = (cod_cliente: '4'; activo: false);
    cliente5: tCliente = (cod_cliente: '5'; activo: true);


function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;



procedure eliminar_clientes_inactivos(var c: tCola);
var
    cliente: tCliente;
    size, i: integer;
begin
    size := num_elems(c);
    for i := 1 to size do
    begin
        cliente := first(c);
        dequeue(c);
        if esActivo(cliente) then
            enqueue(c, cliente);
    end;
end;


procedure correct_queue_example_1(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, cliente1);
    enqueue(c, cliente3);
end;


procedure queue_example_1(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, cliente1);
    enqueue(c, cliente2);
    enqueue(c, cliente3);
end;

procedure correct_queue_example_2(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, cliente1);
    enqueue(c, cliente3);
    enqueue(c, cliente5);
end;

procedure queue_example_2(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, cliente1);
    enqueue(c, cliente2);
    enqueue(c, cliente3);
    enqueue(c, cliente4);
    enqueue(c, cliente5);
end;



procedure test_eliminar_clientes_inactivos;
var
    c, cCorrecta: tCola;
    resultado: string;
begin
    queue_example_1(c);
    correct_queue_example_1(cCorrecta);
    WriteLn(uColaClientes.toString(c));
    eliminar_clientes_inactivos(c);
    resultado := uColaClientes.toString(c);
    WriteLn(resultado);
    WriteLn('Test 1: ', resultado, ' = ', uColaClientes.toString(cCorrecta) , ' El ejercicio funciona ', bool_to_str(resultado = uColaClientes.toString(cCorrecta)));


    queue_example_2(c);
    correct_queue_example_2(cCorrecta);
    WriteLn(uColaClientes.toString(c));
    eliminar_clientes_inactivos(c);
    resultado := uColaClientes.toString(c);
    WriteLn(resultado);
    WriteLn('Test 2: ', resultado, ' = ', uColaClientes.toString(cCorrecta) , ' El ejercicio funciona ', bool_to_str(resultado = uColaClientes.toString(cCorrecta)));

end;

begin
    WriteLn('Pruebas de eliminar clientes inactivos');
    WriteLn('--------------------------------------');
    test_eliminar_clientes_inactivos;
    readln; 
end.