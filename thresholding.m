function [res] = thresholding(Signal)

MeanSignal = mean(Signal);
l=length(Signal);
res=zeros(1,l);

for i=1:l
    if Signal(i) < MeanSignal
        res(1,i)=0;
    end
    if Signal(i) > MeanSignal
        res(1,i)=1;
        res(1,i-1)=1;
        res(1,i-2)=1;
        res(1,i-3) = 1;
    end
end

