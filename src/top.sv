`include"uvm_pkg.sv"
`include"uvm_macros.svh"
`include"ALU.sv"
`include"alu_interface.sv"
`include"alu_pkg.sv"

module top;
  bit CLK;
  bit RST;
  import alu_pkg::*;
  import uvm_pkg::*;

  initial begin
    CLK=0;
    forever #5 CLK=~CLK;
  end

  initial begin
    @(posedge CLK);
    RST=1;
    repeat(3)@(posedge CLK);
    RST=0;
  end

  alu_inf intf(CLK,RST);

  ALU_DESIGN DUV(.OPA(intf.OPA),
          .OPB(intf.OPB),
          .CLK(CLK),
          .RST(RST),
          .CE(intf.CE),
          .MODE(intf.MODE),
          .INP_VALID(intf.INP_VALID),
          .CMD(intf.CMD),
          .RES(intf.RES),
          .COUT(intf.COUT),
          .OFLOW(intf.OFLOW),
          .G(intf.G),
          .E(intf.E),
          .L(intf.L),
          .ERR(intf.ERR),
          .CIN(intf.CIN)
                );
  initial begin
    uvm_config_db#(virtual alu_inf)::set(uvm_root::get(),"*","vif",intf);
  end

  initial begin
    run_test("alu_regression_test");
  end

endmodule
