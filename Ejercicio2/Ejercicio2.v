module Ejercicio2 (
    input clk_50M,      // Reloj físico de la tarjeta DE0-CV (Pin PIN_M9)
    output reg clock = 0 // Señal de salida con el nuevo divisor de frecuencia
);

    // Se requieren 13 bits para contar hasta 5.208 (calculado como log2(5.208 + 1) ≈ 13)
    reg [12:0] contador = 0;

    always @(posedge clk_50M) begin
        if (contador == 13'd5208) begin
            clock <= ~clock;   // Invierte el estado de la señal
            contador <= 0;     // Reinicia el contador
        end else begin
            contador <= contador + 1;
        end
    end

endmodule