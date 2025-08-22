class alu_monitor extends uvm_monitor;
  virtual alu_inf vif;
  uvm_analysis_port #(alu_sequence_item) item_collected_port;
  alu_sequence_item seq_item;

  `uvm_component_utils(alu_monitor)

  function new (string name, uvm_component parent);
    super.new(name, parent);
    seq_item = new();
    item_collected_port = new("item_collected_port", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_inf)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction

  virtual task run_phase(uvm_phase phase);
   forever
     begin
       repeat(2)@(posedge vif.mon_cb);
        if (vif.mon_cb.INP_VALID inside {0,1,2,3} &&
        ((vif.mon_cb.MODE == 1 && vif.mon_cb.CMD inside {0,1,2,3,4,5,6,7,8}) ||
         (vif.mon_cb.MODE == 0 && vif.mon_cb.CMD inside {0,1,2,3,4,5,6,7,8,9,10,11,12,13})))
          repeat (1) @(vif.mon_cb);
    else if (vif.mon_cb.INP_VALID == 3 && (vif.mon_cb.MODE == 1 && vif.mon_cb.CMD inside {9,10}))
      repeat (2) @(vif.mon_cb);


      if((vif.mon_cb.INP_VALID==2'b01) ||(vif.mon_cb.INP_VALID==2'b10))
      begin
        if(((vif.mon_cb.MODE==1)&& (vif.mon_cb.CMD inside {0,1,2,3,8,9,10})) || ((vif.mon_cb.MODE==0)&& (vif.mon_cb.CMD inside {0,1,2,3,4,5,12,13}))) //if two operation cmd and inp=01 or 10
          begin
            for(int j=0;j<16;j++)
              begin
                @(vif.mon_cb);
                $display("[mon 16 clock logic @%t] opa=%d opb=%d inp=%d Res=%d",$time,vif.mon_cb.OPA,vif.mon_cb.OPB,vif.mon_cb.INP_VALID,vif.mon_cb.RES);
                 begin
                   if(vif.mon_cb.INP_VALID==2'b11) //checking got inp=11
                    begin
                      if(vif.mon_cb.MODE==1 && vif.mon_cb.CMD inside {9,10})// multiplication
                      begin
                       repeat(2)@(vif.mon_cb);
                       seq_item.RES=vif.mon_cb.RES;
                        seq_item.COUT=vif.mon_cb.COUT;
                        seq_item.OFLOW=vif.mon_cb.OFLOW;
                        seq_item.G=vif.mon_cb.G;
                        seq_item.L=vif.mon_cb.L;
                        seq_item.E=vif.mon_cb.E;

                        seq_item.OPA=vif.mon_cb.OPA;
                        seq_item.OPB=vif.mon_cb.OPB;
                        seq_item.CIN=vif.mon_cb.CIN;
                        seq_item.CMD=vif.mon_cb.CMD;
                        seq_item.MODE=vif.mon_cb.MODE;
                        seq_item.INP_VALID=vif.mon_cb.INP_VALID;
                        seq_item.CE=vif.mon_cb.CE;

                        `uvm_info(get_type_name(),$sformatf("[MONITOR 11 mul (16 clock logic)]sent at time=%t",$time),UVM_LOW);
       `uvm_info(get_type_name(),$sformatf("OPA=%d OPB=%d CIN=%d CMD=%d INP_VALID=%d MODE=%d RES=%d",seq_item.OPA,seq_item.OPB,seq_item.CIN,seq_item.CMD,seq_item.INP_VALID,seq_item.MODE,seq_item.RES),UVM_LOW);
      item_collected_port.write(seq_item);
                   end
                    else //other operations
                     begin
                      repeat(1)@(vif.mon_cb);
                      seq_item.RES=vif.mon_cb.RES;
                      seq_item.COUT=vif.mon_cb.COUT;
                      seq_item.OFLOW=vif.mon_cb.OFLOW;
                      seq_item.G=vif.mon_cb.G;
                      seq_item.L=vif.mon_cb.L;
                      seq_item.E=vif.mon_cb.E;

                      seq_item.OPA=vif.mon_cb.OPA;
                      seq_item.OPB=vif.mon_cb.OPB;
                      seq_item.CIN=vif.mon_cb.CIN;
                      seq_item.CMD=vif.mon_cb.CMD;
                      seq_item.MODE=vif.mon_cb.MODE;
                      seq_item.INP_VALID=vif.mon_cb.INP_VALID;
                      seq_item.CE=vif.mon_cb.CE;

                       `uvm_info(get_type_name(),$sformatf("[MONITOR for other operation (16 clock logic)]sent at time=%t",$time),UVM_LOW);
       `uvm_info(get_type_name(),$sformatf("OPA=%d OPB=%d CIN=%d CMD=%d INP_VALID=%d MODE=%d RES=%d",seq_item.OPA,seq_item.OPB,seq_item.CIN,seq_item.CMD,seq_item.INP_VALID,seq_item.MODE,seq_item.RES),UVM_LOW);
      item_collected_port.write(seq_item);
                    end
                     break;
                   end//11
                 else
                    begin
                      continue;
                    end
                 end
              end//forloop end
          end //end of if
        else if((vif.mon_cb.MODE==1 && vif.mon_cb.CMD inside {4,5,6,7})||(vif.mon_cb.MODE==0 && vif.mon_cb.CMD inside {6,7,8,9,10,11})) //if inp=01 or 10 and single operand operation
              begin
                           seq_item.RES=vif.mon_cb.RES;
                            seq_item.COUT=vif.mon_cb.COUT;
                            seq_item.OFLOW=vif.mon_cb.OFLOW;
                            seq_item.G=vif.mon_cb.G;
                            seq_item.L=vif.mon_cb.L;
                            seq_item.E=vif.mon_cb.E;

                            seq_item.OPA=vif.mon_cb.OPA;
                            seq_item.OPB=vif.mon_cb.OPB;
                            seq_item.CIN=vif.mon_cb.CIN;
                            seq_item.CMD=vif.mon_cb.CMD;
                            seq_item.MODE=vif.mon_cb.MODE;
                            seq_item.INP_VALID=vif.mon_cb.INP_VALID;
                            seq_item.CE=vif.mon_cb.CE;

                `uvm_info(get_type_name(),$sformatf("[MONITOR 01 or 10]sent at time=%t",$time),UVM_LOW);
       `uvm_info(get_type_name(),$sformatf("OPA=%d OPB=%d CIN=%d CMD=%d INP_VALID=%d MODE=%d RES=%d",seq_item.OPA,seq_item.OPB,seq_item.CIN,seq_item.CMD,seq_item.INP_VALID,seq_item.MODE,seq_item.RES),UVM_LOW);
      item_collected_port.write(seq_item);

               end
      end //end of main 01 or 10 if
        else
           begin
             seq_item.RES=vif.mon_cb.RES;
              seq_item.COUT=vif.mon_cb.COUT;
              seq_item.OFLOW=vif.mon_cb.OFLOW;
              seq_item.G=vif.mon_cb.G;
              seq_item.L=vif.mon_cb.L;
              seq_item.E=vif.mon_cb.E;

              seq_item.OPA=vif.mon_cb.OPA;
              seq_item.OPB=vif.mon_cb.OPB;
              seq_item.CIN=vif.mon_cb.CIN;
              seq_item.CMD=vif.mon_cb.CMD;
              seq_item.MODE=vif.mon_cb.MODE;
              seq_item.INP_VALID=vif.mon_cb.INP_VALID;
              seq_item.CE=vif.mon_cb.CE;
             `uvm_info(get_type_name(),$sformatf("[MONITOR for 11 or 00]sent at time =%t",$time),UVM_LOW);
       `uvm_info(get_type_name(),$sformatf("OPA=%d OPB=%d CIN=%d CMD=%d INP_VALID=%d MODE=%d RES=%d",seq_item.OPA,seq_item.OPB,seq_item.CIN,seq_item.CMD,seq_item.INP_VALID,seq_item.MODE,seq_item.RES),UVM_LOW);
      item_collected_port.write(seq_item);
   end
    end
  endtask
endclass
