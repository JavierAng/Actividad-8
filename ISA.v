`timescale 1ns/1ns

module ISA(
	input [19:0]instruccion,
	output [31:0]salida
);

wire [31:0] d1BR_Op1Alu;
wire [31:0] d2BR_Op2Alu;
wire [31:0] ram_out;


Banco instBanco(
	.DL1(instruccion [19:15]),
	.DL2(instruccion [14:10]),
	.DE(0),
	.Dato(0),
	.WE(instruccion[9]),
	.op1(d1BR_Op1Alu),
	.op2(d2BR_Op2Alu)
	);
	
ALU instAlu(
	.Ope1(d1BR_Op1Alu),
	.Ope2(d2BR_Op2Alu),
	.AluOp(instruccion[8:6]),
	.Resultado(ram_out)
);

RAM instRam(
	.Dir(instruccion[5:1]),
	.Datos(ram_out),
	.WE_Ram(instruccion[1]),
	.Salida(salida)
);

assign salida = ram_out;

endmodule