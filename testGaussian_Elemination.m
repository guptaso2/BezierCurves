clc;
clear;


A=[4 1 0 0;
   1 4 1 0;
   0 1 4 1;
   0 0 1 4];
b=[2;3;4;5];

x=A\b;

xt=Gaussian_Elimination(A,b);

x-xt