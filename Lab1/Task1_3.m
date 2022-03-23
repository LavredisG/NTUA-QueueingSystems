pkg load statistics

clc;
clear all;
close all;

#Task1_3_A and Task1_3_B
lambda = 5;
mean = 1/lambda;
N = [100,  200, 300, 500, 1000, 10000];                #Number of arrivals

for i = 1 : columns(N)
  arrivals = exprnd(mean, 1, N(i));                    #random samples
  increased_arrivals = arrivals;                    
  for j = 1 : (N(i)-1)                                 #increasing random samples
    increased_arrivals(1, j+1) = increased_arrivals(1, j) + arrivals(1, j+1);
  endfor
  if(i == 1)                                           #plot for Task1_3_A
    y = 1 : N(i);
    stairs(increased_arrivals(1,:), y);
    xlabel("t");
    ylabel("N(t)");
   endif
   mean_arrivals = N(i)/increased_arrivals(1, N(i));    #means display
   printf("Mean number of arrivals for N = %d in a time period T is: %f \n", N(i), mean_arrivals)   
endfor



