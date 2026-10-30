// Flip-Flop JK usando tabla característica y estructuras if - else if (Ejercicio 9)
// Flip-Flop JK usando sentencias if-else
// Ejercicio 9

module Ejercicio9 (
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
            oQ <= 1'b0;  // Reset asincronico activo en bajo
        else begin
            if ((iJ == 1'b0) && (iK == 1'b0))
                oQ <= oQ;      // Mantener estado
            else if ((iJ == 1'b1) && (iK == 1'b0))
                oQ <= 1'b1;    // Set
            else if ((iJ == 1'b0) && (iK == 1'b1))
                oQ <= 1'b0;    // Reset
            else
                oQ <= ~oQ;     // Conmutar: J=1, K=1
        end
    end

endmodule