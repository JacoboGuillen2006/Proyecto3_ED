// Descripcion estructural de un registro universal
// de desplazamiento de 4 bits

module Ejercicio14 (
    input  wire [3:0] iI,
    input  wire [1:0] iselect,
    input  wire       ilfin,
    input  wire       irtin,
    input  wire       iCLK,
    input  wire       iClr,
    output wire [3:0] oA
);

    // Etapa correspondiente al bit 0
    stage ST0 (
        .i0     (oA[0]),
        .i1     (oA[1]),
        .i2     (ilfin),
        .i3     (iI[0]),
        .Q      (oA[0]),
        .select (iselect),
        .CLK    (iCLK),
        .Clr    (iClr)
    );

    // Etapa correspondiente al bit 1
    stage ST1 (
        .i0     (oA[1]),
        .i1     (oA[2]),
        .i2     (oA[0]),
        .i3     (iI[1]),
        .Q      (oA[1]),
        .select (iselect),
        .CLK    (iCLK),
        .Clr    (iClr)
    );

    // Etapa correspondiente al bit 2
    stage ST2 (
        .i0     (oA[2]),
        .i1     (oA[3]),
        .i2     (oA[1]),
        .i3     (iI[2]),
        .Q      (oA[2]),
        .select (iselect),
        .CLK    (iCLK),
        .Clr    (iClr)
    );

    // Etapa correspondiente al bit 3
    stage ST3 (
        .i0     (oA[3]),
        .i1     (irtin),
        .i2     (oA[2]),
        .i3     (iI[3]),
        .Q      (oA[3]),
        .select (iselect),
        .CLK    (iCLK),
        .Clr    (iClr)
    );

endmodule


// Una etapa del registro universal
module stage (
    input  wire       i0,
    input  wire       i1,
    input  wire       i2,
    input  wire       i3,
    output reg        Q,
    input  wire [1:0] select,
    input  wire       CLK,
    input  wire       Clr
);

    reg D;

    // Multiplexor 4 a 1
    always @(*) begin
        case (select)
            2'b00: D = i0;  // Mantener
            2'b01: D = i1;  // Desplazar a la derecha
            2'b10: D = i2;  // Desplazar a la izquierda
            2'b11: D = i3;  // Carga paralela
            default: D = i0;
        endcase
    end

    // Flip-flop D con clear asincronico activo en bajo
    always @(posedge CLK or negedge Clr) begin
        if (!Clr)
            Q <= 1'b0;
        else
            Q <= D;
    end

endmodule