function [res]= Smwi(Ssq,N)
res = zeros(N,1);
delta = ones(1,N);
res = conv(Ssq,delta)*1/N;
    