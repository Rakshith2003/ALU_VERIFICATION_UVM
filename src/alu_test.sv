`include"define.sv"
class alu_base extends uvm_test;
  alu_environment env;
  `uvm_component_utils(alu_base)

  function new(string name="alu_base",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=alu_environment::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"env.passive_agent" , "is_active" ,UVM_PASSIVE);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"env.active_agent","is_active",UVM_ACTIVE);
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_top.print_topology();
  endfunction

endclass

class alu_test1 extends alu_base; //1

  `uvm_component_utils(alu_test1)
  function new(string name="alu_test1",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence1 seq;
    phase.raise_objection(this);
    seq = alu_sequence1::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass

class alu_test2 extends alu_base; //1

  `uvm_component_utils(alu_test2)
  function new(string name="alu_test2",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence2 seq;
    phase.raise_objection(this);
    seq = alu_sequence2::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass

class alu_test3 extends alu_base; //1

  `uvm_component_utils(alu_test3)
  function new(string name="alu_test3",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence3 seq;
    phase.raise_objection(this);
    seq = alu_sequence3::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_test4 extends alu_base; //1

  `uvm_component_utils(alu_test4)
  function new(string name="alu_test4",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence4 seq;
    phase.raise_objection(this);
    seq = alu_sequence4::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass



class alu_test5 extends alu_base; //1

  `uvm_component_utils(alu_test5)
  function new(string name="alu_test5",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence5 seq;
    phase.raise_objection(this);
    seq = alu_sequence5::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_test6 extends alu_base; //1

  `uvm_component_utils(alu_test6)
  function new(string name="alu_test6",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence6 seq;
    phase.raise_objection(this);
    seq = alu_sequence6::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass

class alu_test7 extends alu_base; //1

  `uvm_component_utils(alu_test7)
  function new(string name="alu_test7",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence7 seq;
    phase.raise_objection(this);
    seq = alu_sequence7::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_test8 extends alu_base; //1

  `uvm_component_utils(alu_test8)
  function new(string name="alu_test8",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence8 seq;
    phase.raise_objection(this);
    seq = alu_sequence8::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_test9 extends alu_base; //1

  `uvm_component_utils(alu_test9)
  function new(string name="alu_test9",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence9 seq;
    phase.raise_objection(this);
    seq = alu_sequence9::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_test10 extends alu_base; //1

  `uvm_component_utils(alu_test10)
  function new(string name="alu_test10",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence10 seq;
    phase.raise_objection(this);
    seq = alu_sequence10::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_test11 extends alu_base; //1

  `uvm_component_utils(alu_test11)
  function new(string name="alu_test11",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence11 seq;
    phase.raise_objection(this);
    seq = alu_sequence11::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_test12 extends alu_base; //1

  `uvm_component_utils(alu_test12)
  function new(string name="alu_test12",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_sequence12 seq;
    phase.raise_objection(this);
    seq = alu_sequence12::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass


class alu_regression_test extends alu_base; //1

  `uvm_component_utils(alu_regression_test)
  function new(string name="alu_regression_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_regression seq;
    phase.raise_objection(this);
    seq = alu_regression::type_id::create("seq");
    repeat(`no_of_transaction)begin
      seq.start(env.active_agent.seqr);
     end
    phase.drop_objection(this);
  endtask
endclass
