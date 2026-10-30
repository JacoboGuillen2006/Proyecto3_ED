// Modulo principal: Flip-flop JK construido
// a partir de un flip-flop D y compuertas

module Ejercicio7 (
    output wire oQ,
    input  wire iJ,
    input  wire iK,
    input  wire iCLK,
    input  wire iRST
);

    wire JK;

    // Ecuacion caracteristica del flip-flop JK:
    // Q(t+1) = JQ' + K'Q
    assign JK = (iJ & ~oQ) | (~iK & oQ);

    // Instancia del flip-flop D
    D_FF JK1 (
        .Q   (oQ),
        .D   (JK),
        .CLK (iCLK),
        .RST (iRST)
    );

endmodule


// Modulo secundario: Flip-flop D
// con restablecimiento asincronico activo en bajo

module D_FF (
    output reg  Q,
    input  wire D,
    input  wire CLK,
    input  wire RST
);

    always @(posedge CLK or negedge RST) begin
        if (!RST)
            Q <= 1'b0;
        else
            Q <= D;
    end

endmodule
