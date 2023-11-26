module mux8a4 (
// Inputs and output ports
  input A0,
  input A1,
  input A2,
  input A3,
  input B0,
  input B1,
  input B2,
  input B3,
  input control,
  output A,
  output B,
  output C,
  output D
);

assign A=((A3 & ~(control))|(B3 & control));
assign B=((A2 & ~(control))|(B2 & control));
assign C=((A1 & ~(control))|(B1 & control));
assign D=((A0 & ~(control))|(B0 & control));

endmodule
