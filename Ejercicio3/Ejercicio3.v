module Ejercicio3 (
    input iD,        // Entrada de datos D (Switch)
    input icontrol,  // Entrada de control/reloj (Switch o Botón)
    output reg oQ    // Salida Q (LED)
);

    // Un Latch D es transparente mientras icontrol esté en nivel alto (1)
    always @(icontrol or iD) begin
        if (icontrol)
            oQ = iD;
    end

endmodule