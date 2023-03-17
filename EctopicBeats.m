%research of the ectopic beats in a R-R interval

function [res]=EctopicBeats(R,epsilon)

Rdelta=RRinter(R);
lenRdelta=length(Rdelta);

%Search of the mean of an R-R interval

sum=0;

for i=1:lenRdelta
    sum=sum+Rdelta(i);
end


for k=2:lenRdelta
    if abs(Rdelta(k) - Rdelta(k-1))>=epsilon
        res(k)=1;
    else
        res(k)=0;
    end
end