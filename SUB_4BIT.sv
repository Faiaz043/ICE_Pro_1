module SUB_4BIT (
    input  logic [3:0] A, B,
    output logic [3:0] DIFF,
    output logic       BORROW
);
    assign {BORROW, DIFF} = A - B;
endmodule

