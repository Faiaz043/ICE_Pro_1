module MUX_4TO1 (
    input  logic [3:0] IN0, IN1, IN2, IN3, // Inputs from ADD, SUB, AND, OR
    input  logic [1:0] SEL,                // Select
    output logic [3:0] OUT                 // Selected output
);
    always_comb begin
        case (SEL)
            2'b00: OUT = IN0;  // ADD
            2'b01: OUT = IN1;  // SUB
            2'b10: OUT = IN2;  // AND
            2'b11: OUT = IN3;  // OR
            default: OUT = 4'b0000;
        endcase
    end
endmodule

