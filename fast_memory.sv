///////////////////////////////
//          Fast Memory      //
//    Author: Deepan Kumar   //
///////////////////////////////
module Memory(input logic clk,rstn,
    input logic [31:0] address,
    input logic [63:0] data_in,
    input logic write_enable,
    input logic read_enable,
    output logic [63:0] data_out
);

    // Define memory array with appropriate depth
    logic [63:0] mem [0:(1<<14)-1]; // 14-bit address for cache memory

    // Read and write operations
    always_ff @(negedge clk or !rstn) begin
    if (!rstn) data_out=0;
        else if (read_enable) begin
            data_out = mem[address];
        end
    else data_out = 0;
    end

    always_ff @(negedge clk or !rstn) begin
    if(!rstn) mem[address] = 0;
        if (write_enable) begin
            mem[address] = data_in;
        end
    end

endmodule
