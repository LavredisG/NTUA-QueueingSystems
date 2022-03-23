clc;
clear all;
close all;
#Task4_1_4_b
r = 200 * (23/60);
c = 1 : 200;
for i = 1 : 200
  P_blocking(i) = erlangb_iterative(r, i);
endfor

plot(c, P_blocking, "b", "linewidth", 1.3)
xlabel("Number of serving lines")
ylabel("P-blocking")
title("Probability of rejecting a client to number of lines/servers")


#Task4_1_4_c
i = 1;
while(P_blocking(i) >= 1)
  i = i + 1;
endwhile
i = i - 1;    #since indexing begins from 1
printf("P-blocking is less than 1%% for %d serving lines\n", i) 

