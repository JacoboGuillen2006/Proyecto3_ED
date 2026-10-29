// Módulo Principal: Flip-flop JK hecho con Flip-flop D y compuertas
module Ejercicio7 (
    output oQ,
    input  iJ,
    input  iK,
    input  iCLK,
    input  iRST
);

    wire JK;

    // Ecuación característica para el Flip-Flop JK: JQ' + K'Q
    assign JK = (iJ & ~oQ) | (~iK & oQ);

    // Instancia (ejemplar) del módulo Flip-Flop D
    D_FF JK1 (
        .Q(oQ),
        .D(JK),
        .CLK(iCLK),
        .RST(iRST)
    );

endmodule

// Módulo Secundario: Flip-flop D con restablecimiento asincrónico
module D_FF (
    output reg Q,
    input      D,
    input      CLK,
    input      RST
);

    always @(posedge CLK or negedge RST) begin
        if (~RST) 
            Q <= 1'b0; // Restablecimiento asincrónico activo en bajo
        else 
            Q <= D;    // Asignación sincrónica
    end

endmodule