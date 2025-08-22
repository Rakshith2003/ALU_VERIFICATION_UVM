`include"define.sv"
class alu_sequence extends uvm_sequence#(alu_sequence_item);

  `uvm_object_utils(alu_sequence)
  function new(string name = "alu_sequence");
    super.new(name);
  endfunction


  virtual task body();
    repeat(2)
    begin
    req = alu_sequence_item::type_id::create("req");
    wait_for_grant();
      void'(req.randomize());
    send_request(req);
    wait_for_item_done();
        end
  endtask
endclass

class alu_sequence1 extends uvm_sequence#(alu_sequence_item);//            1

  `uvm_object_utils(alu_sequence1)

  function new(string name = "alu_sequence1");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.MODE ==1;req.CE == 1; req.CMD inside{[0:1]};req.INP_VALID == 3;})
  endtask
endclass


class alu_sequence2 extends uvm_sequence#(alu_sequence_item);//            2

  `uvm_object_utils(alu_sequence2)

  function new(string name = "alu_sequence2");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.CE == 1;req.INP_VALID dist{3:=5,2:=2,1:=2};
                          req.CMD inside{`INC_A,`INC_B,`SHR1_A,`SHR1_B,`SHL1_A,`SHR1_B,`NOT_A,`NOT_B};})
  endtask
endclass


class alu_sequence3 extends uvm_sequence#(alu_sequence_item);//            3

  `uvm_object_utils(alu_sequence3)

  function new(string name = "alu_sequence3");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.INP_VALID==3;req.MODE == 1;req.CMD inside{[0:8]};})
  endtask
endclass


class alu_sequence4 extends uvm_sequence#(alu_sequence_item);//            4

  `uvm_object_utils(alu_sequence4)

  function new(string name = "alu_sequence4");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.INP_VALID==3;req.MODE == 0;req.CMD inside{[0:13]};})
  endtask
endclass


class alu_sequence5 extends uvm_sequence#(alu_sequence_item);//            5

  `uvm_object_utils(alu_sequence5)

  function new(string name = "alu_sequence5");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.INP_VALID==3;req.MODE == 0;req.CE == 1;req.CMD inside{[14:15]};})
  endtask
endclass



class alu_sequence6 extends uvm_sequence#(alu_sequence_item);//            6

  `uvm_object_utils(alu_sequence6)

  function new(string name = "alu_sequence6");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.INP_VALID==3;req.MODE == 1;req.CE == 1;req.CMD inside{[11:15]};})
  endtask
endclass





class alu_sequence7 extends uvm_sequence#(alu_sequence_item);//            7

  `uvm_object_utils(alu_sequence7)

  function new(string name = "alu_sequence7");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.MODE == 0;req.CE == 1;req.CMD inside{[0:13]};})
  endtask
endclass




class alu_sequence8 extends uvm_sequence#(alu_sequence_item);//            9

  `uvm_object_utils(alu_sequence8)

  function new(string name = "alu_sequence8");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.MODE ==1 ;req.CE == 1;req.CMD inside{[0:8]};})
  endtask
endclass


class alu_sequence9 extends uvm_sequence#(alu_sequence_item);//            10

  `uvm_object_utils(alu_sequence9)

  function new(string name = "alu_sequence9");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(req,{req.CE inside {0,1};req.MODE==1;})
  endtask
endclass


class alu_sequence10 extends uvm_sequence#(alu_sequence_item);//            11

  `uvm_object_utils(alu_sequence10)

  function new(string name = "alu_sequence10");
    super.new(name);
  endfunction

  virtual task body();
     `uvm_do_with(req,{req.INP_VALID==3;req.MODE == 1;req.CE == 1;req.CMD ==8;})
  endtask
endclass

class alu_sequence11 extends uvm_sequence#(alu_sequence_item);//            12

  `uvm_object_utils(alu_sequence11)

  function new(string name = "alu_sequence11");
    super.new(name);
  endfunction

  virtual task body();
     `uvm_do_with(req,{req.INP_VALID==3;req.MODE == 1;req.CE == 1;req.CMD ==8;})
  endtask
endclass


class alu_sequence12 extends uvm_sequence#(alu_sequence_item);//            13

  `uvm_object_utils(alu_sequence12)

  function new(string name = "alu_sequence12");
    super.new(name);
  endfunction

  virtual task body();
     `uvm_do_with(req,{req.INP_VALID==3;req.MODE == 1;req.CE == 1;req.CMD inside{`MUL_IN,`MUL_S};})
  endtask
endclass


class alu_regression extends uvm_sequence#(alu_sequence_item);

    alu_sequence1  s1;
        alu_sequence2 s2;
        alu_sequence3 s3;
        alu_sequence4 s4;
        alu_sequence5 s5;
        alu_sequence6 s6;
        alu_sequence7 s7;
        alu_sequence8 s8;
        alu_sequence9 s9;
        alu_sequence10 s10;
    alu_sequence11  s11;
    alu_sequence12  s12;


    `uvm_object_utils(alu_regression)

        function new(string name = "alu_regression");
        super.new(name);
        endfunction:new

        virtual task body();
      `uvm_do(s1)
      `uvm_do(s2)
      `uvm_do(s3)
      `uvm_do(s4)
      `uvm_do(s5)
      `uvm_do(s6)
      `uvm_do(s7)
      `uvm_do(s8)
      `uvm_do(s9)
      `uvm_do(s10)
      `uvm_do(s11)
      `uvm_do(s12)
        endtask
endclass
