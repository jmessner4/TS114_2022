function [res] = RRinter(R)

lenR = length(R);

% Research of the first R pic
n = 1;
while R(n)==0
    n = n+1;
end

%Variables for delta's calculation
a = n;
b=n;
k=1;

for i=n+1:lenR
    c = b-a;
    if c>0
        res(k) = c;
        k = k+1;
        a = b;
    end
    if R(i)~=0 
        b = i;
    end
end

