module DEMUX_1TO4 (
    input  logic       EN,            // Enable input
    input  logic [1:0] SEL,           // Select signal (2-bit)
    output logic       Y0, Y1, Y2, Y3 // 4 outputs
);
    always_comb begin
        // Default all outputs to 0
        {Y0, Y1, Y2, Y3} = 4'b0000;

        if (EN) begin
            case (SEL)
                2'b00: Y0 = 1'b1;  // ADD enable
                2'b01: Y1 = 1'b1;  // SUB enable
                2'b10: Y2 = 1'b1;  // AND enable
                2'b11: Y3 = 1'b1;  // OR enable
            endcase
        end
    end
endmodule

