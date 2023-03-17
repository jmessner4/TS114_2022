function [Res] = differentiation(Signal, Fs)

Ts=1/Fs;
b = [1 2 0 -2 -1]*(1/(8*Ts));
Res = filter(b,1,Signal);


