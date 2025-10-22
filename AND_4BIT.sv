module AND_4BIT (
    input  logic [3:0] A, B,
    output logic [3:0] OUT
);
    assign OUT = A & B;
endmodule

