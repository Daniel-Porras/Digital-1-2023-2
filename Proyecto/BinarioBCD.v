module BinarioBCD (
  input S5,
  input S4,
  input S3,
  input S2,
  input S1,
  input S0,
  output D3,
  output D2,
  output D1,
  output D0,
  output U3,
  output U2,
  output U1,
  output U0
);
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  assign D3 = 1'b0;
  assign D2 = ((S3 & S5) | (S4 & S5));
  assign s6 = ~ S5;
  assign s8 = ~ S4;
  assign s7 = ~ S3;
  assign s9 = ~ S2;
  assign s10 = ~ S1;
  assign D1 = ((S2 & S4 & s6) | (S3 & S4 & s6) | (s7 & s8 & S5));
  assign D0 = ((S1 & s9 & s7 & S4) | (S1 & S2 & S3 & S4) | (S1 & S3 & s8 & s6) | (S2 & S3 & s8 & s6) | (s9 & s7 & S4 & s6) | (S2 & s7 & S5) | (s7 & s8 & S5) | (S3 & S4 & S5));
  assign U3 = ((s10 & s9 & S3 & s8 & s6) | (S1 & s9 & s7 & S4 & s6) | (S1 & S2 & s7 & s8 & S5) | (s10 & s9 & s7 & S4 & S5) | (s10 & S2 & S3 & S4) | (S1 & S3 & S4 & S5));
  assign U2 = ((S1 & s9 & s7 & s8 & S5) | (S1 & S2 & S3 & s8) | (s10 & s9 & S3 & S4) | (s10 & s9 & S4 & s6) | (s10 & S2 & s8 & S5) | (S1 & S2 & S4 & S5) | (S2 & s7 & s8 & s6) | (s9 & S3 & S4 & s6));
  assign U1 = ((s10 & S2 & S3 & s8 & s6) | (s10 & s9 & s7 & S4 & s6) | (S1 & s9 & S3 & S4 & s6) | (S1 & S2 & s7 & s6) | (s10 & S2 & s7 & S5) | (S1 & s7 & s8 & s6) | (s10 & s7 & s8 & S5) | (S1 & S3 & s8 & S5) | (s10 & S3 & S4 & S5));
  assign U0 = S0;
endmodule
