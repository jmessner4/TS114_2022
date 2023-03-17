function [Res] = FiltrePasseBas(Signal)

%%H = (1-z^(-6))^2/(1-z^(-1))^2;

b=zeros(1,13);
b(1)=1;
b(7)=-2;
b(13)=1;

a=[1 -2 1];

Res = filter(b,a,Signal);