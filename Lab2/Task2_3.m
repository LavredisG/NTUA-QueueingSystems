#Task2_3
pkg install -forge queueing
pkg load queueing

clc;
clear all;
close all;

lambda = 5;
mu = 10;        #changing mu, gives us results for vi
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu,  mu,  mu];

#Task2_3_i
% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
printf("Transition matrix of our M/M/1/4 system: \n");
transition_matrix

#Task2_3_ii
% get the ergodic probabilities of the system
P = ctmc(transition_matrix);
printf("System's ergodic probabilities: \n");
P_percentage = 100 * P

#Task2_3_iii
E_n = 0;
for i = 1 : columns(states)
  E_n = E_n + (i * P(i));
endfor
printf("Mean number of clients in our system is: E[n(t)] = %d clients\n", E_n);

#Task2_3_iv
P_blocking = 100 * P(columns(P));
printf("The possibility of declining a client is: P_4 = %f %% \n", P_blocking)

#Task2_3_v
#transient probability of states until convergence to ergodic probabilities
#Convergence takes place when P0 and P differ by 0.01
index = 0;
for T = 0 : 0.01 : 50
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);          #state 0
  Prob1(index) = P0(2);          #state 1
  Prob2(index) = P0(3);          #state 2
  Prob3(index) = P0(4);          #state 3
  Prob4(index) = P0(5);          #state 4
  if (P0 - P < 0.01)
    break;
  endif
endfor
T = 0 : 0.01 : T;
figure(1);
colors = "rgbmk";
hold on
title("Time dependency of each state's Probability")
plot(T, Prob0, colors(1), "linewidth", 1.3);
plot(T, Prob1, colors(2), "linewidth", 1.3);
plot(T, Prob2, colors(3), "linewidth", 1.3);
plot(T, Prob3, colors(4), "linewidth", 1.3);
plot(T, Prob4, colors(5), "linewidth", 1.3);
xlabel("Time");
ylabel("Probability");
legend("State 0", "State 1", "State 2", "State 3", "State 4");
hold off

#Task2_3_v_i
mu = 1;
index = 0;
for T = 0 : 0.01 : 50
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);          #state 0
  Prob1(index) = P0(2);          #state 1
  Prob2(index) = P0(3);          #state 2
  Prob3(index) = P0(4);          #state 3
  Prob4(index) = P0(5);          #state 4
  if (P0 - P < 0.01)
    break;
  endif
endfor
T = 0 : 0.01 : T;
figure(1);
colors = "rgbmk";
hold on
title("Time dependency of each state's Probability")
plot(T, Prob0, colors(1), "linewidth", 1.3);
plot(T, Prob1, colors(2), "linewidth", 1.3);
plot(T, Prob2, colors(3), "linewidth", 1.3);
plot(T, Prob3, colors(4), "linewidth", 1.3);
plot(T, Prob4, colors(5), "linewidth", 1.3);
xlabel("Time");
ylabel("Probability");
legend("State 0", "State 1", "State 2", "State 3", "State 4");
hold off

  




