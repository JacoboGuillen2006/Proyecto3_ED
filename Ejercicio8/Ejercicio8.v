// Flip-Flop JK usando tabla caracteristica
// y sentencia case - Ejercicio 8

module Ejercicio8 (
    output reg oQ,
    output     oQnot,
    input      iJ,
    input      iK,
    input      iCLK,
    input      iRST
);

    // Salida complementaria
    assign oQnot = ~oQ;

    always @(posedge iCLK or negedge iRST) begin
        if (!iRST)
            oQ <= 1'b0;
        else begin
            case ({iJ, iK})
                2'b00: oQ <= oQ;    // Mantener
                2'b01: oQ <= 1'b0;  // Reset
                2'b10: oQ <= 1'b1;  // Set
                2'b11: oQ <= ~oQ;   // Conmutar
                default: oQ <= oQ;
            endcase
        end
    end

endmodule