function [res] = high_pass(signal)

% H = (-1 + 32z^(-16) - 32z^(-17) + z^(-32))/(1 - z^(-1))

b = zeros(1,33);
b(1) = -1;
b(17) = 32;
b(18) = -32;
b(33) = 1;
a = zeros(1,2);
a(1) = 1;
a(2) = -1;

filterhigh= filter(b,a,[1 zeros(1,4)]);

res = conv(signal, filterhigh);