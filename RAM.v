module RAM (
    input [4:0] Dir,
    input [31:0] Datos,
    input WE_Ram,
    output reg [31:0] Salida
);
    reg [31:0] Mem [0:255];

    always @* begin
        if (WE_Ram) begin
            Mem[Dir] = Datos;
        end
        Salida = Mem[Dir];
    end
endmodule
