// Diagrama de estados Mealy - Ejercicio 10

module Ejercicio10 (
    input      ix,
    output reg oy,
    input      iCLK,
    input      iRST
);

    reg [1:0] Prstate;
    reg [1:0] Nxtstate;

    // Codificacion binaria de los estados
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    // 1. Registro de estado con reset asincronico activo en bajo
    always @(posedge iCLK or negedge iRST) begin
        if (!iRST)
            Prstate <= S0;
        else
            Prstate <= Nxtstate;
    end

    // 2. Logica combinacional del siguiente estado
    always @(*) begin
        case (Prstate)
            S0: begin
                if (ix)
                    Nxtstate = S1;
                else
                    Nxtstate = S0;
            end

            S1: begin
                if (ix)
                    Nxtstate = S3;
                else
                    Nxtstate = S0;
            end

            S2: begin
                if (!ix)
                    Nxtstate = S0;
                else
                    Nxtstate = S2;
            end

            S3: begin
                if (ix)
                    Nxtstate = S2;
                else
                    Nxtstate = S0;
            end

            default: Nxtstate = S0;
        endcase
    end

    // 3. Logica de salida Mealy
    always @(*) begin
        case (Prstate)
            S0: oy = 1'b0;

            S1: begin
                if (ix)
                    oy = 1'b0;
                else
                    oy = 1'b1;
            end

            S2: begin
                if (ix)
                    oy = 1'b0;
                else
                    oy = 1'b1;
            end

            S3: begin
                if (ix)
                    oy = 1'b0;
                else
                    oy = 1'b1;
            end

            default: oy = 1'b0;
        endcase
    end

endmodule