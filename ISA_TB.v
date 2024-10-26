`timescale 1ns/1ns
module ISA_tb;
    reg [19:0] instruccion;
    wire [31:0] salida;

    // Instanciar la ISA
    ISA uut (
        .instruccion(instruccion),
        .salida(salida)
    );

    initial begin
        // Inicializar datos
        // Escribir datos en el Banco de Registros
        #100  instruccion = 20'b00010001110010000111; // Ejemplo de instrucción 1
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 20'b00001001110110000001; // Ejemplo de instrucción 2
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 20'b00000001000000001111; // Ejemplo de instrucción 3
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 20'b00011000110001010001; // Ejemplo de instrucción 4
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100  instruccion = 20'b00111000110111010011; // Ejemplo de instrucción 5
        #100  $display("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);

        #100 $stop; // Detener la simulación
    end

    // Monitor para observar las instrucciones y salidas
    initial begin
        $monitor("Time: %0d | Instruction: %b | Output: %d", $time, instruccion, salida);
    end
endmodule
