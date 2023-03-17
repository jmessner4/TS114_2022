function [res,mean, bpm,diag] = arrhythmia(R,Fs)

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

lenres = length(res);
mean = 0;

for i=1:lenres
    mean = mean + res(i);
end

mean = mean/lenres;
bp = mean/Fs;
bpm = 60/bp;

if bpm<60
    diag = 1;  %exit value for bradycardia
elseif bpm>100
    diag = 2; %exit value for tachycardia
else
    diag = 0;
end
    