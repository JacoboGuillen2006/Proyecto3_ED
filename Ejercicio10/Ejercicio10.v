// Diagrama de estados Mealy (Ejercicio 10)
module Ejercicio10 (
    input  ix,
    output reg oy,
    input  iCLK,
    input  iRST
);

    reg [1:0] Prstate, Nxtstate;
    
    // Asignación de parámetros binarios de 2 bits para los estados S0 a S3
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    // 1. Restablecimiento asincrónico y operación sincrónica con el reloj
    always @(posedge iCLK or negedge iRST) begin
        if (~iRST) 
            Prstate <= S0;       // Iniciar en el estado inicial S0 (00)
        else 
            Prstate <= Nxtstate; // Actualizar estado en el flanco de subida
    end

    // 2. Determinar el siguiente estado basado en Prstate y la entrada ix
    always @(Prstate or ix) begin
        case (Prstate)
            S0: if (ix) Nxtstate = S1; else Nxtstate = S0;
            S1: if (ix) Nxtstate = S3; else Nxtstate = S0;
            S2: if (~ix) Nxtstate = S0; else Nxtstate = S2;
            S3: if (ix) Nxtstate = S2; else Nxtstate = S0;
            default: Nxtstate = S0;
        endcase
    end

    // 3. Evaluar la salida (Modelo Mealy: función del estado actual y de la entrada)
    always @(Prstate or ix) begin
        case (Prstate)
            S0: oy = 1'b0;
            S1: if (ix) oy = 1'b0; else oy = 1'b1;
            S2: if (ix) oy = 1'b0; else oy = 1'b1;
            S3: if (ix) oy = 1'b0; else oy = 1'b1;
            default: oy = 1'b0;
        endcase
    end

endmodule