// Flip-Flop T (Ejercicio 6) basado en la ecuación característica Q(t+1) = Q ⊕ T[cite: 2]
module Ejercicio6 (
    output reg oQ,
    input      iT,
    input      iCLK,
    input      iRST
);

    always @(posedge iCLK or negedge iRST) begin
        if (~iRST) 
            oQ <= 1'b0;     // Restablecimiento asincrónico activo en bajo
        else 
            oQ <= oQ ^ iT;  // Toggle (conmuta si iT = 1, mantiene si iT = 0)
    end

endmodule