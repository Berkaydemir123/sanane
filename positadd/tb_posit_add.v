module tb_posit_add;

  integer fid_input;
  integer fid_output;
  integer returnval;
  reg i_clk;
  reg i_rst;
  reg signed [15:0] A;
  reg signed [15:0] B;
  wire signed [15:0] S;

  reg start;
  wire inf, zero, done;

  posit_add DUT(
            .in1(A),
            .in2(B),
            .start(start),
            .out(S), 
            .inf(inf), 
            .zero(zero), 
            .done(done));

  always
  begin
    #10 i_clk = ~i_clk;
  end


  initial
  begin
    $dumpfile("tb_posit_add.vcd");
    $dumpvars;
  end


  initial
  begin
    fid_input = $fopen("PI.csv","r");
    fid_output = $fopen("PO.txt","w");
    i_clk = 0;
    i_rst = 0;
    A=0;
    B=0;
    #500 i_rst = 1;
    while(!$feof(fid_input))
    begin
      @(negedge i_clk);
      returnval = $fscanf(fid_input,"%d,%d,%d",A,B,start);
      $fwrite(fid_output,"%h,%h,%h,%h\n",S,inf,zero,done);
    end
    $fclose(fid_input);
    $fclose(fid_output);
    $finish;
  end


endmodule
