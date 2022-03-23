#Task2_2
clc;
clear all;
close all;

mu = 5.01 : 0.01 : 10;
lambda_rate = 5;

for i = 1 : columns(mu)              
  lambda(i) = lambda_rate;          #if args of qsmm1 = 2, vectors are needed
endfor

color = "rgbm";
figure(1);
[U, R, Q, X] = qsmm1(lambda, mu);

figure(1);
plot(mu, U, color(1), "linewidth", 1.2);
title("Utilization dependency on service rate");
xlabel("Service rate (ì)");
ylabel("Utilization (u)");

figure(2);
plot(mu, R, color(2), "linewidth", 1.2);
title("Mean time of delay dependency on service rate");
xlabel("Service rate(ì)");
ylabel("Mean time of delay (E[T])");

figure(3);
plot(mu, Q, color(3), "linewidth", 1.2);
title("Mean number of clients dependency on service rate");
xlabel("Service rate (ì)");
ylabel("Mean number of clients (E[n(t)])");

figure(4);
plot(mu, X, color(4), "linewidth", 1.2);
title("Throughput dependency on service rate");
xlabel("Service rate (ì)");
ylabel("Throughput (ã)");

