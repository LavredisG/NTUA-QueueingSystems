#Task5_2_3 - Mean clients
function [x1,x2,x3,x4,x5] = mean_clients(l1,l2,m1,m2,m3,m4,m5)
[t1,t2,t3,t4,t5] = intensities(l1,l2,m1,m2,m3,m4,m5);
x1 = t1./(1-t1); #E[n_1]
x2 = t2./(1-t2); #E[n_2]
x3 = t3./(1-t3); #E[n_3]
x4 = t4./(1-t4); #E[n_4]
x5 = t5./(1-t5); #E[n_5]
endfunction

