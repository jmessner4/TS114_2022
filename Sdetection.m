function [res] = Sdetection(X,R)

A = length(R);
res = zeros(1,A);

for i=1:A
    if R(i) ~= 0
        j=i;
        while X(j+1)<X(j)
            j = j+1;
        end
        res(j)=X(j);
    end
end