#Task5_1_2
#------------------------------------
clc;
clear all;
close all;
#------------------------------------
a = [0.001 : 0.001 : 0.999];
lambda = 10^4;
pack_length =128 * 8;        #In bits
C2 = 12 * 10^6;               #In bits/s
m2 = C2/pack_length;
Numerator = (2 * lambda) * a.^2 - (2 * lambda + 0.25 * m2) * a + 1.25 * m2;
Denominator = (-(lambda)^2) * a.^2 + (0.25 * m2 * lambda + (lambda)^2 ) * a + 1.25 * m2 * (m2 - lambda);
mean_delay = Numerator./Denominator;
figure(1);
plot(a, mean_delay);
xlabel("a-chance of going through line 1");
ylabel("Mean delay time of a packet in the system");
title("Mean delay time to splitting chance");
min_mean = mean_delay(1);
index = a(1);
for i = 2 : columns(a)
  if(mean_delay(i) < min_mean)
    min_mean = mean_delay(i);
    index = a(i);
  endif
endfor

printf("E(T) is minimized for a = %f\n", index);
printf("E(T)_min = %f\n", min_mean);


