module bcd7seg (
// Inputs and output ports
  input A,
  input B,
  input C,
  input D,
  output Y,
  output X,
  output W,
  output V,
  output U,
  output T,
  output S,
  output N
);

  wire s0;
  wire s1;
  wire s2;
  assign s0 = ~ B;
  assign s2 = ~ C;
  assign s1 = ~ D;
  assign Y = ~(A | (s0 & s1) | (B & D) | C);
  assign X = ~(s0 | (s2 & s1) | (C & D));
  assign W = ~(B | s2 | D);
  assign V = ~(A | (s0 & s1) | (s0 & C) | (B & s2 & D) | (C & s1));
  assign U = ~((s0 & s1) | (C & s1));
  assign T = ~(A | (B & s2) | (B & s1) | (s2 & s1));
  assign S = ~(A | (s0 & C) | (B & s2) | (C & s1));
  assign N= 1;
endmodule
