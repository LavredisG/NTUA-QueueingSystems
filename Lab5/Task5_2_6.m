#Task5_2_6
lambda1 = 0.6 : 0.06 : 5.94; #from 10% of lambda1 max to 99% of it
lambda2 = 1;
m1 = 6;
m2 = 5;
m3 = 8;
m4 = 7;
m5 = 6;
total_in = (lambda1 .+ lambda2);
[mean1,mean2,mean3,mean4,mean5] = mean_clients(lambda1,lambda2,m1,m2,m3,m4,m5);
figure(1)
total_mean = mean1 + mean2 + mean3 + mean4 + mean5
mean1 
delay_mean = total_mean ./ total_in;
plot(lambda1, delay_mean, "r", "linewidth", 1.3);
xlabel("ë_1 - from 10% to 99% of it's maximum value");
ylabel("Mean delay time");
title("Mean delay time to ë_1");



