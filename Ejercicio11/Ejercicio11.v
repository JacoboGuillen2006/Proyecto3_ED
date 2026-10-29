// Diagrama de estados de Moore (Ejercicio 11)
module Ejercicio11 (
    input       ix,
    input       iCLK,
    input       iRST,
    output [1:0] oAB
);

    reg [1:0] state;
    
    // Asignación de parámetros binarios de 2 bits para los estados S0 a S3
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    // Transiciones de estado sincrónicas con el reloj y restablecimiento asincrónico
    always @ (posedge iCLK or negedge iRST) begin
        if (~iRST)
            state <= S0;   // Iniciar en el estado inicial S0 (reset)
        else begin
            case (state)
                S0: if (~ix) state <= S1; else state <= S0;
                S1: if (ix)  state <= S2; else state <= S3;
                S2: if (~ix) state <= S3; else state <= S2;
                S3: if (~ix) state <= S0; else state <= S3;
                default: state <= S0;
            endcase
        end
    end

    assign oAB = state;   // Salida directa de los flip-flops (Modelo Moore)

endmodule