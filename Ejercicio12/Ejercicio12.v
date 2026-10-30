// Ejercicio 12
// Circuito secuencial estructural con flip-flops T

module Ejercicio12 (
    input  wire x,
    output wire y,
    output wire A,
    output wire B,
    input  wire CLK,
    input  wire RST
);

    wire TA;
    wire TB;

    // Ecuaciones de entrada y salida
    assign TB = x;
    assign TA = x & B;
    assign y  = A & B;

    // Flip-flop T para el bit B
    T_FF BF (
        .Q   (B),
        .T   (TB),
        .CLK (CLK),
        .RST (RST)
    );

    // Flip-flop T para el bit A
    T_FF AF (
        .Q   (A),
        .T   (TA),
        .CLK (CLK),
        .RST (RST)
    );

endmodule


// Modulo auxiliar: flip-flop T
module T_FF (
    output reg  Q,
    input  wire T,
    input  wire CLK,
    input  wire RST
);

    always @(posedge CLK or negedge RST) begin
        if (!RST)
            Q <= 1'b0;
        else
            Q <= Q ^ T;
    end

endmodule