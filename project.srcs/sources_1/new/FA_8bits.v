module FA_8bits
#(parameter n = 8)
(
	input [n-1:0] A, B,
	input	cin,
	output [n-1 : 0] result ,
	output cout
);

	wire [n:0] c;
	assign c[0] = cin;
	assign cout = c[n];
	
	generate
	
		genvar k;
		
		for(k = 0 ; k < n ; k= k+1)
		begin 
			Full_Adder FA_8 (
				.A(A[k]),
				.B(B[k] ^ cin),
				.cin(c[k]),
				.sum(result[k]),
				.cout(c[k+1])
			);
		end
	
	endgenerate
	
endmodule 