module Ejercicio1 (
    input clk_50M,        // Reloj físico de la tarjeta DE0-CV (Pin P11)
    output reg clock = 0  // Señal de salida que puedes conectar a un LED (ej. PIN_AA2)
);

    // Como el reloj de la placa es de 50,000,000 Hz (muy rápido),
    // usamos un contador para cambiar el estado de la salida cada cierto tiempo.
    reg [25:0] contador = 0;

    always @(posedge clk_50M) begin
        contador <= contador + 1;
        if (contador == 25_000_000) begin // Cambia de estado cada medio segundo aprox.
            clock <= ~clock;
            contador <= 0;
        end
    end

endmodule