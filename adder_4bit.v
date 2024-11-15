module adder_4bit(a,b,cin,sum,cout);
    input [3:0] a;       // First input bit
    input [3:0] b;       // Second input bit
    input cin;     // Carry-in
    output reg [3:0] sum; // Sum output
    output reg cout; // Carry-out
  
    always @(a, b, cin) begin
        {cout, sum} = a + b + cin;  // Perform addition and capture both carry and sum
    end
endmodule

module adder_4bit_tb;

    reg [3:0] a, b;       // 4-bit test inputs
    reg cin;              // Carry-in for the adder
    wire [3:0] sum;       // 4-bit sum output
    wire cout;            // Carry-out output

    // Instantiate the 1-bit adder
    adder_4bit DUT (a,b,cin,sum,cout);

    initial begin
        // Display format for the test
        $monitor("a = %b, b = %b, cin = %b | sum = %b, cout = %b", a, b, cin, sum, cout);

         // Test various decimal input combinations
        a = 12; b = 3; cin = 0; #10;  // Expected sum=15, cout=0
        a = 10; b = 2; cin = 1; #10;  // Expected sum=13, cout=0
        a = 7;  b = 5; cin = 0; #10;  // Expected sum=12, cout=0
        a = 15; b = 15; cin = 1; #10; // Expected sum=15, cout=1

        $finish;  // End simulation
    end

endmodule