// Flip-Flop JK usando tabla característica y estructuras if - else if (Ejercicio 9)
module Ejercicio9 (
    output reg oQ,
    output     oQnot,
    input      iJ,
    input      iK,
    input      iCLK,
    input      iRST
);

    assign oQnot = ~oQ; // Salida negada complementaria

    always @(posedge iCLK or negedge iRST) begin
        if (~iRST) 
            oQ <= 1'b0; // Restablecimiento asincrónico
        else begin
            if ((iJ == 1'b0) && (iK == 1'b0))
                oQ <= oQ;     // Mantener estado
            else if ((iJ == 1'b1) && (iK == 1'b0))
                oQ <= 1'b1;   // Set (1)
            else if ((iJ == 1'b0) && (iK == 1'b1))
                oQ <= 1'b0;   // Reset (0)
            else if ((iJ == 1'b1) && (iK == 1'b1))
                oQ <= ~oQ;    // Conmutación (Toggle)
        end
    end

endmodule