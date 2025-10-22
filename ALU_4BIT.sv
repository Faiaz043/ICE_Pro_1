module ALU_4BIT (
    input  logic [3:0] A, B,
    input  logic [1:0] ALU_CONT,     // 00=ADD, 01=SUB, 10=AND, 11=OR
    input  logic       EN,           // Master enable
    output logic [3:0] ALU_OUT,
    output logic       CARRY_BORROW
);

    // Internal enables from demux
    logic EN_ADD, EN_SUB, EN_AND, EN_OR;

    // Intermediate signals from operation blocks
    logic [3:0] sum_out, sub_out, and_out, or_out;
    logic       carry_add, borrow_sub;

    // Instantiate DEMUX to control operation enables
    DEMUX_1TO4 u_demux (
        .EN(EN),
        .SEL(ALU_CONT),
        .Y0(EN_ADD),
        .Y1(EN_SUB),
        .Y2(EN_AND),
        .Y3(EN_OR)
    );

    // Instantiate operation modules
    ADD_4BIT u_add (.A(A), .B(B), .SUM(sum_out), .CARRY(carry_add));
    SUB_4BIT u_sub (.A(A), .B(B), .DIFF(sub_out), .BORROW(borrow_sub));
    AND_4BIT u_and (.A(A), .B(B), .OUT(and_out));
    OR_4BIT  u_or  (.A(A), .B(B), .OUT(or_out));

    // Select output using MUX
    MUX_4TO1 u_mux (
        .IN0(sum_out),
        .IN1(sub_out),
        .IN2(and_out),
        .IN3(or_out),
        .SEL(ALU_CONT),
        .OUT(ALU_OUT)
    );

    // Handle Carry/Borrow for ADD/SUB operations
    always_comb begin
        case (ALU_CONT)
            2'b00: CARRY_BORROW = carry_add;
            2'b01: CARRY_BORROW = borrow_sub;
            default: CARRY_BORROW = 0;
        endcase
    end
endmodule

