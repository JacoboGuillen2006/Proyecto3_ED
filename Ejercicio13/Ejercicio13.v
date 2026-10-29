// Descripción del comportamiento de un registro de desplazamiento universal
// definido en la figura 7 y en la figura 8 (tabla)
module Ejercicio13 (is1, is0, iPin, ilfin, irtin, oA, iCLK, iClr);
    input       is1, is0;       // Seleccionar entradas[cite: 14]
    input       ilfin, irtin;   // Entradas en serie[cite: 14]
    input       iCLK, iClr;     // Reloj y Clear[cite: 14]
    input [3:0] iPin;           // Entrada paralela[cite: 14]
    output reg [3:0] oA;        // Salida del registro[cite: 14]

    always @ (posedge iCLK or negedge iClr) begin
        if (~iClr) 
            oA <= 4'b0000;
        else begin
            case ({is1, is0})
                2'b00: oA <= oA;                  // Sin cambio[cite: 14]
                2'b01: oA <= {irtin, oA[3:1]};    // Desplazamiento a la derecha[cite: 14]
                2'b10: oA <= {oA[2:0], ilfin};    // Desplazamiento a la izquierda[cite: 14]
                2'b11: oA <= iPin;                // Entrada de carga paralela[cite: 14]
            endcase
        end
    end

endmodule