pkg load statistics

clc;
clear all;
close all;
#Task1_1_A
# 
k = 0:1:70;
lambda = [3, 10, 30, 50];

for i=1:columns(lambda)
  poisson(i,:) = poisspdf(k, lambda(i));              #for each lambda, an array with the pdf for each k is created
endfor 

colors = "rbkm";
figure(1);
hold on;
for i=1:columns(lambda)                               #lambda columns traversal
  if(i != find(lambda == 30))                         #we do not print for lambda = 30
    stem(k,poisson(i,:),colors(i),"linewidth",1.2);   #stem is used for discrete functions
  endif
endfor
hold off;

title("Probability Mass Function of Poisson processes");
xlabel("k values");
ylabel("probability");
legend("lambda=3","lambda=10","lambda=50");

#Task1_1_B
#

index = find(lambda == 30);
chosen = poisson(index,:);
mean_value = 0;

#Columns(...) = 71, so we subtract 1, so i runs from 0 to 70 => 71 times
for i=0:(columns(poisson(index,:))-1)          
  mean_value = mean_value + i.*poisson(index,i+1);
endfor

printf("Ìean value of Poisson with lambda 30 is: %f\n", mean_value);

second_moment = 0;
for i=0:(columns(poisson(index,:))-1)
  second_moment = second_moment + i.*i.*poisson(index,i+1);
endfor

variance = second_moment - mean_value.^2;
printf("Variance of Poisson with lambda 30 is: %f\n", variance);

# #Task1_1_C
#

first = find(lambda==10);
second = find(lambda==50);
poisson_first = poisson(first,:);
poisson_second = poisson(second,:);

composed = conv(poisson_first,poisson_second);       #convolution of two processes
new_k = 0:1:(2*70);

figure(2);
hold on;
stem(k,poisson_first(:),colors(1),"linewidth",1.2);
stem(k,poisson_second(:),colors(2),"linewidth",1.2);
stem(new_k,composed,"mo","linewidth",2);
hold off;
title("Convolution of two Poisson processes");
xlabel("k values");
ylabel("Probability");
legend("lambda=10","lambda=50","new process");

# Task1_1_D
#

k = 0:1:60;
# Define the desired Poisson Process
lambda = 30;
i = [1, 2, 3, 4, 5];
#Bin(n,p = lambda/n)
n = lambda.*i;
p = lambda./n; 
colors = "rgmbk"

figure(3);
title("Poisson process as the limit of the binomial process");
xlabel("k values");
ylabel("Probability");
hold on;
for i = 1 : columns(i)
  binomial = binopdf(k,n(i),p(i));
  stem(k, binomial, colors(i), 'linewidth', 1.2);
endfor
legend("n = 30", "n = 60", "n = 90", "n = 120", "n = 150")
hold off;
