`include"define.sv"
`uvm_analysis_imp_decl(_act_cov)
`uvm_analysis_imp_decl(_pass_cov)

class alu_coverage extends uvm_component;

  `uvm_component_utils(alu_coverage)


  uvm_analysis_imp_act_cov #(alu_sequence_item, alu_coverage) port_act;
  uvm_analysis_imp_pass_cov #(alu_sequence_item, alu_coverage) port_pass;

alu_sequence_item act_pkt, pass_pkt;
real pass1_cov,act1_cov;

covergroup active_cg;
MODE: coverpoint act_pkt.MODE {
                                        bins mode_0 = {0};
                                        bins mode_1 = {1};
}

INP_VALID: coverpoint act_pkt.INP_VALID {
                                        bins invalid = {2'b00};
                                        bins opa_valid = {2'b01};
                                        bins opb_valid = {2'b10};
                                        bins both_valid = {2'b11};

                                                                         }
CE: coverpoint act_pkt.CE {
                       bins clock_enable_valid = {1};
                       bins clock_enable_invalid = {0};

                                        }
CIN: coverpoint act_pkt.CIN {
                         bins cin_high = {1};
                         bins cin_low = {0};
                                        }
  COMMAND : coverpoint act_pkt.CMD {        bins arithmetic[] = {[0:10]};
                                             bins logical[] = {[0:13]};
                                             bins arithmetic_invalid[] = {[11:15]};
                                             bins logical_invalid[] = {14,15};
                                          }
OPA: coverpoint act_pkt.OPA {
                        bins opa[]={[0:(2**`WIDTH)-1]};
}
OPB: coverpoint act_pkt.OPB {
                        bins opb[]={[0:(2**`WIDTH)-1]};
}
MODE_CMD_: cross MODE,COMMAND;
endgroup


covergroup passive_cg;
    RESULT_CP: coverpoint pass_pkt.RES {
      bins result[] = {[0 : (2**`WIDTH)-1]};
    }
    COUT_CP: coverpoint pass_pkt.COUT {
     bins cout_active = {1};
     bins cout_inactive = {0};
    }
    OFLOW_CP: coverpoint pass_pkt.OFLOW {
       bins oflow_active = {1};
       bins oflow_inactive = {0};
    }

    E_CP: coverpoint pass_pkt.E {
      bins equal_active = {1};
    }

    G_CP: coverpoint pass_pkt.G {
      bins greater_active = {1};
    }

    L_CP: coverpoint pass_pkt.L {
       bins lesser_active = {1};
    }

    ERR_CP: coverpoint pass_pkt.ERR {
      bins error_active = {1};
    }
  endgroup

function new(string name = "", uvm_component parent);
  super.new(name, parent);
  passive_cg = new();
  active_cg = new();
  port_act=new("port_act", this);

  port_pass = new("port_pass", this);

endfunction

  function void write_act_cov(alu_sequence_item item);
 act_pkt = item;
  active_cg.sample();
    `uvm_info(get_type_name(),$sformatf("[AT COVERAGE ACT_WRITE] OPA=%d OPB=%d CIN=%d CMD=%d INP_VALID=%d MODE=%d",act_pkt.OPA,act_pkt.OPB,act_pkt.CIN,act_pkt.CMD,act_pkt.INP_VALID,act_pkt.MODE),UVM_LOW);
endfunction


  function void write_pass_cov(alu_sequence_item item);
 pass_pkt = item;
  passive_cg.sample();
    `uvm_info(get_type_name(),$sformatf("[AT COVERAGE PASS_WRITE] : RES=%d | ERR=%d | OFLOW=%d | COUT=%d | G=%d | L=%d | E= %d",pass_pkt.RES,pass_pkt.ERR,pass_pkt.OFLOW,pass_pkt.COUT,pass_pkt.G,pass_pkt.L,pass_pkt.E),UVM_LOW);
endfunction


function void extract_phase(uvm_phase phase);
  super.extract_phase(phase);
  act1_cov = active_cg.get_coverage();
  pass1_cov = passive_cg.get_coverage();
endfunction

function void report_phase(uvm_phase phase);
  super.report_phase(phase);
  `uvm_info(get_type_name, $sformatf("[INPUT] Coverage ------> %0.2f%%,", act1_cov), UVM_MEDIUM);
  `uvm_info(get_type_name, $sformatf("[OUTPUT] Coverage ------> %0.2f%%", pass1_cov), UVM_MEDIUM);
  endfunction

endclass
