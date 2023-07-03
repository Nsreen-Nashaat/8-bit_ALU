module ALU(
    input [7:0] A , B,
    input [2:0] opcode,
    input  cin,
    output reg [7:0] out,
    output cout ,
    output reg c_flag
    );
   
    assign cin = opcode[0];
    FA_8bits adder(
              .A(A),
              .B(B),
              .cin(cin),
              .result(sum),
              .cout(cout)
              );
   
    FA_8bits subtractor (
        .A(A),
        .B(B),
        .cin(cin),
        .result(sub),
        .cout(cout)
        );
        
    always @(*)
    begin
          
        case(opcode)
            3'b000 : out = sum;
            3'b001 : out = sub;
            3'b010 : out = A&B;
            3'b011 : out = A|B;
            3'b100 : out = A^B;
            3'b101 : out = A>B;
            3'b110 : out = A<<1;
            3'b111 : out = B<<1;
            default : out = 'bx;
            
        endcase
        
        if(A > B)
            c_flag = 1'b1 ;
        else
            c_flag = 1'b0 ;
        end
    
endmodule
