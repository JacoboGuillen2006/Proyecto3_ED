// Diagrama de estados de Moore - Ejercicio 11

module Ejercicio11 (
    input        ix,
    input        iCLK,
    input        iRST,
    output [1:0] oAB
);

    reg [1:0] state;

    // Codificacion binaria de los estados
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    // Transiciones de estado con reset asincronico activo en bajo
    always @(posedge iCLK or negedge iRST) begin
        if (!iRST)
            state <= S0;
        else begin
            case (state)
                S0: begin
                    if (!ix)
                        state <= S1;
                    else
                        state <= S0;
                end

                S1: begin
                    if (ix)
                        state <= S2;
                    else
                        state <= S3;
                end

                S2: begin
                    if (!ix)
                        state <= S3;
                    else
                        state <= S2;
                end

                S3: begin
                    if (!ix)
                        state <= S0;
                    else
                        state <= S3;
                end

                default: state <= S0;
            endcase
        end
    end

    // Salida Moore: corresponde directamente al estado actual
    assign oAB = state;

endmodule