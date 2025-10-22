module ADD_4BIT (
    input  logic [3:0] A, B,
    output logic [3:0] SUM,
    output logic       CARRY
);
    assign {CARRY, SUM} = A + B;
endmodule

