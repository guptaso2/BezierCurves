
clear;
clc;
A=[4 1 0 0;
   1 4 1 0;
   0 1 4 1;
   0 0 1 4];

[L U]=LU_Factorization(A)

A-L*U