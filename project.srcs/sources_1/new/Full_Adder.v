module Full_Adder
(
	input A, B, cin,
	output reg sum , cout
);
	
	always @(*)
	begin
		sum = A ^ B ^ cin;
		cout = A & B|(A ^ B) & cin;
	
	end
	
endmodule 