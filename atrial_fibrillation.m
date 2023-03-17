function [res] = atrial_fibrillation(k,Delta,MeanDelta)

N = length(Delta);
res = 0;
for i=1:N-k
    res = res + (Delta(i+k)-MeanDelta)*(Delta(i)-MeanDelta);
end

res = res/(N-k-1);

