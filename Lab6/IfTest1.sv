module IfTest1();
reg [3:0] X;
reg [3:0] Y;
initial begin
X=4'b101x;
Y=4'b101z;
if(X===4'b101z)begin
$display("Statement 1 has been selected!");
end
if(X===Y)begin
$display("Statement 2 has been selected!");
end
if(X!==Y)begin
$display("Statement 3 has been selected!");
end
if(X===X)begin
$display("Statement 4 has been selected!");
end
$display("No one has been selected!");
end
endmodule
