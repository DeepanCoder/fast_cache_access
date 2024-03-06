module tb; 
  reg clk,rstn;
  reg [31:0] addr;
  reg [63:0] data_in;
  reg write_enable;
  reg read_enable;
  wire [63:0] data_out;
  
  Memory fam(clk,rstn,addr,data_in,write_enable,read_enable,data_out);
  
  initial begin
    clk=0;
    rstn =1;
    #1 rstn =0;
    #5 rstn =1;
    #5 data_in = 100;
    write_enable = 1;
    addr = 100;
    #5 write_enable = 1;
    read_enable = 1;
    #5 read_enable = 0;
    #5 addr =110;
    read_enable = 1;
    #5 read_enable = 0;
    #100 $finish;
  end
  
  always #1 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule
