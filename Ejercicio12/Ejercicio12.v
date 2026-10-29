// Descripción estructural de circuito secuencial (Ejercicio 12)
module Ejercicio12 (
    input  x,
    output y,
    output A,
    output B,
    input  CLK,
    input  RST
);

    wire TA, TB;

    // Ecuaciones de entrada de flip-flop y ecuación de salida
    assign TB = x;          // Ecuación de entrada para el flip-flop B[cite: 13]
    assign TA = x & B;      // Ecuación de entrada para el flip-flop A[cite: 13]
    assign y  = A & B;      // Ecuación de salida (y = 1 cuando la cuenta llega a 11 binario)[cite: 12, 13]

    // Se crean ejemplares de los flip-flops T (BF y AF)[cite: 12, 13]
    T_FF BF (B, TB, CLK, RST);
    T_FF AF (A, TA, CLK, RST);

endmodule


// Módulo auxiliar: Flip-flop T[cite: 12, 15]
module T_FF (
    output reg Q,
    input      T,
    input      CLK,
    input      RST
);

    always @ (posedge CLK or negedge RST) begin
        if (~RST) 
            Q <= 1'b0;      // Restablecimiento asincrónico a 0[cite: 15]
        else 
            Q <= Q ^ T;     // Ecuación característica Q(t+1) = Q (+) T[cite: 15]
    end

endmodule


// Módulo de estímulo para probar el circuito secuencial[cite: 12, 15]
module testTcircuit;
    reg  x, CLK, RST;
    wire y, A, B;

    // Se crea un ejemplar del circuito principal[cite: 14]
    Tcircuit TC (x, y, A, B, CLK, RST);

    // Generación de señales de control (CLK y RST)[cite: 15]
    initial begin
        RST = 0;
        CLK = 0;
        #5 RST = 1;
        repeat (16)
            #5 CLK = ~CLK;
    end

    // Generación de estímulos para la entrada x[cite: 15]
    initial begin
        x = 0;
        #15 x = 1;
        repeat (8)
            #10 x = ~x;
    end

endmodule