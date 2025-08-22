class alu_environment extends uvm_env;
  alu_agent      active_agent;
  alu_agent      passive_agent;
  alu_scoreboard score;
  alu_coverage alu_cov;

  `uvm_component_utils(alu_environment)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    active_agent = alu_agent::type_id::create("active_agent", this);
    passive_agent = alu_agent::type_id::create("passive_agent", this);
    score = alu_scoreboard::type_id::create("score", this);
    alu_cov = alu_coverage::type_id::create("alu_cov", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    active_agent.mon.item_collected_port.connect(score.item_collected_export_active);
    passive_agent.mon.item_collected_port.connect(score.item_collected_export_passive);
    active_agent.mon.item_collected_port.connect(alu_cov.port_act);
    passive_agent.mon.item_collected_port.connect(alu_cov.port_pass);

  endfunction

endclass
