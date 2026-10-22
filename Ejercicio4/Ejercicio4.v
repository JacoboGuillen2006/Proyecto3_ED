module Ejercicio4 (
    input iD,     // Entrada de datos D (Switch SW[0] -> PIN_U13)
    input iCLK,   // Entrada de reloj / flanco (Switch SW[1] -> PIN_V13)
    output reg oQ // Salida Q (LED 0 -> PIN_V16)
);

    // Se activa únicamente en el flanco de subida (posedge) del reloj
    always @(posedge iCLK) begin
        oQ = iD;
    end

endmodule