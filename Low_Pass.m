function [Res] = Low_Pass(Signal)

%%H = (1-z^(-6))^2/(1-z^(-1))^2;

b=zeros(1,13);
b(1)=1;
b(7)=-2;
b(13)=1;

a=[1 -2 1];

filterlow = filter(b,a,[1 zeros(1,12)]);

Res = conv(Signal,filterlow);