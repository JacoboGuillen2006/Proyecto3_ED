// Flip-Flop D con restablecimiento asincrónico (Ejercicio 5)[cite: 1]
module Ejercicio5 (
    output reg oQ,
    input      iD,
    input      iCLK,
    input      iRST
);

    always @(posedge iCLK or negedge iRST) begin
        if (~iRST) 
            oQ <= 1'b0; // Restablecimiento asincrónico activo en bajo (~iRST)[cite: 1]
        else 
            oQ <= iD;   // Asignación sincrónica con la señal de reloj[cite: 1, 2]
    end

endmodule