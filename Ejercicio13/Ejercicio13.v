// Registro de desplazamiento universal de 4 bits
// Ejercicio 13

module Ejercicio13 (
    input        is1,
    input        is0,
    input        ilfin,
    input        irtin,
    input  [3:0] iPin,
    input        iCLK,
    input        iClr,
    output reg [3:0] oA
);

    always @(posedge iCLK or negedge iClr) begin
        if (!iClr)
            oA <= 4'b0000;
        else begin
            case ({is1, is0})
                2'b00: oA <= oA;                 // Mantener
                2'b01: oA <= {irtin, oA[3:1]};  // Desplazar derecha
                2'b10: oA <= {oA[2:0], ilfin};  // Desplazar izquierda
                2'b11: oA <= iPin;               // Carga paralela
                default: oA <= oA;
            endcase
        end
    end

endmodule