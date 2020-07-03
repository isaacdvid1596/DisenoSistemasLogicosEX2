module Exp(
    input clk,
    input rst,
    input [31:0] x,
    input [31:0] n,
    output [31:0] res
);

    reg [31:0] xreg;
    reg [31:0] nreg;
    reg [31:0] yreg;
    reg [31:0] result;
    reg [2:0] cs /*verilator public*/;
    reg [2:0] ns;

    assign res = result;


    //next case

    always @ (*) begin

        case(cs)

        3'd0 : ns = 3'd1;
        
        3'd1 : ns = (nreg==32'd0) ? 3'd2 : 3'd3;

        3'd2 : ns = 3'd2;

        3'd3 : ns = (nreg>32'd1) ? 3'd4 : 3'd7;

        3'd4 : ns = ((n & 32'd1)==0 ? 3'd5 : 3'd6);

        3'd5 : ns = 3'd3;

        3'd6 : ns = 3'd3;

        3'd7 : ns = 3'd7; 


        endcase


    end


    //registro n

    always @ (posedge clk) begin

        case (cs)

        3'd0 : nreg <= n;
        3'd1 : nreg <= nreg;
        3'd2 : nreg <= nreg;
        3'd3 : nreg <= nreg;
        3'd4 : nreg <= nreg;
        3'd5 : nreg <= (nreg/2);
        3'd6 : nreg <= (nreg-32'd1)/2;
        3'd7 : nreg <= nreg;

        endcase


    end

      //registro x

    always @ (posedge clk) begin

        case (cs)

        3'd0 : xreg <= x;
        3'd1 : xreg <= xreg;
        3'd2 : xreg <= xreg;
        3'd3 : xreg <= xreg;
        3'd4 : xreg <= xreg;
        3'd5 : xreg <= (xreg*xreg);
        3'd6 : xreg <= (xreg*xreg);
        3'd7 : xreg <= xreg;


        endcase


    end

      //registro y

    always @ (posedge clk) begin

        case (cs)

        3'd0 : yreg <= 32'dx;
        3'd1 : yreg <= 32'dx;
        3'd2 : yreg <= 32'dx;
        3'd3 : yreg <= 32'd1;
        3'd4 : yreg <= yreg;
        3'd5 : yreg <= yreg;
        3'd6 : yreg <= (xreg*yreg);
        3'd7 : yreg <= yreg;

        endcase


    end

        ///reg result

     always @ (posedge clk) begin

        case (cs)

        3'd0 : result <= result;
        3'd1 : result <= result;
        3'd2 : result <= 32'd1;
        3'd3 : result <= result;
        3'd4 : result <= result;
        3'd5 : result <= result;
        3'd6 : result <= result;
        3'd7 : result <= (xreg*yreg);

        endcase


    end


        

    //current case
    always @ (posedge clk) begin

    if(rst)
    cs <= 3'd0;
    else
    cs <= ns;


    end




endmodule