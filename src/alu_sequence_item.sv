`include"define.sv"
`include "uvm_macros.svh"
  import uvm_pkg::*;
class alu_sequence_item extends uvm_sequence_item;
  rand logic [`WIDTH-1:0]OPA;
  rand logic [`WIDTH-1:0]OPB;
  rand logic [`C_W-1:0]CMD;
  rand logic [1:0]INP_VALID;
  rand logic CE,CIN,MODE;

  logic ERR = 'bz,OFLOW = 'bz,COUT = 'bz,G = 'bz,L = 'bz,E = 'bz;
  logic [`WIDTH:0]RES = 'bz;

  `uvm_object_utils_begin(alu_sequence_item)
  `uvm_field_int(OPA,UVM_ALL_ON)
  `uvm_field_int(OPB,UVM_ALL_ON)
  `uvm_field_int(CMD,UVM_ALL_ON)
  `uvm_field_int(INP_VALID,UVM_ALL_ON)
  `uvm_field_int(CE,UVM_ALL_ON)
  `uvm_field_int(CIN,UVM_ALL_ON)
  `uvm_field_int(MODE,UVM_ALL_ON)
  `uvm_component_utils_end

  function new(string name="alu_sequence_item");
    super.new(name);
  endfunction

endclass
