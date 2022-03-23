function P_blocking = erlangb_factorial(r, c)
  numerator = power(r, c) / factorial(c);
  denominator = 0;
  for k = 0 : c
    denominator = denominator + (power(r, k) / factorial(k));
  endfor
  P_blocking = 100 * (numerator / denominator);
  printf("[Factorial] Probability of rejecting a client (ñ = %d, c = %d) is: %f%%\n", r, c, P_blocking)
endfunction


