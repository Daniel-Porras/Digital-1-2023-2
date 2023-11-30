/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */
module DIG_D_FF_1bit
#(
    parameter Default = 0
)
(
   input D,
   input C,
   output Q,
   output \~Q
);
    reg state;

    assign Q = state;
    assign \~Q = ~state;

    always @ (posedge C) begin
        state <= D;
    end

    initial begin
        state = Default;
    end
endmodule


module Prototipo_UWU (
  input X,
  input R,
  output S0,
  output S1,
  output S2,
  output S3
);
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  assign s4 = ((~ X & s5) | (X & ~ s5 & s7) | (s5 & ~ s7));
  assign s6 = ((~ X & s7) | (X & ~ s7));
  assign S0 = (X & ~ s5 & ~ s7);
  assign S1 = (X & ~ s5 & s7);
  assign S2 = (X & s5 & ~ s7);
  assign S3 = (X & s5 & s7);
  // FF1
  DIG_D_FF_1bit #(
    .Default(0)
  )
  DIG_D_FF_1bit_i0 (
    .D( s4 ),
    .C( R ),
    .Q( s5 )
  );
  // FF2
  DIG_D_FF_1bit #(
    .Default(0)
  )
  DIG_D_FF_1bit_i1 (
    .D( s6 ),
    .C( R ),
    .Q( s7 )
  );
endmodule
