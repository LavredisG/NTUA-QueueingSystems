pkg load statistics

clc;
clear all;
close all;

#Task1_2_A
k = 0 : 0.0001 : 8;
mean_value = [0.5, 1, 3];    #(1/lambda)

for i = 1 : columns(mean_value)
  exponential_pdf(i, :) = exppdf(k, mean_value(i));
endfor

colors = "rbm";
figure(1);
hold on;
for i = 1 : columns(mean_value)
  plot(k, exponential_pdf(i, :), colors(i), "linewidth", 1.2);
endfor

hold off
title("PDF of Exponential Processes");
xlabel("x-values");
ylabel("Probability");
legend("Mean value = 0.5", "Mean value = 1", "Mean value = 3");

#Task1_2_B

for i = 1 : columns(mean_value)
  exponential_cdf(i, :) = expcdf(k, mean_value(i));
endfor

figure(2);
hold on
for i = 1 : columns(mean_value)
  plot(k, exponential_cdf(i, :), colors(i), "linewidth", 1.2);
endfor
hold off

title("CDF of Exponential Processes");
xlabel("x-values");
ylabel("Probability");
legend("Mean value = 0.5", "Mean value = 1", "Mean value = 3");

