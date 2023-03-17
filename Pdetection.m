%on doit se placer dans un in terval RR donc il faut la détection de R et le
%maximum

function [res] = Pdetection(Signal,Rdetection,Q,S)

lenSignal=length(Signal);
res=zeros(1,lenSignal);
meanS=mean(Signal);
%The 0,3 R-Rinterval which is the P

Intervals=Interval0_7(Rdetection,Q,S);

PRInterval=Intervals(1,:);

%First filter
b1=zeros(1,7);
b1(1)=1;
b1(7)=-1;

FirstFilter=filter(b1,1, [1 zeros(1,8)]);


%Second filter

b2=zeros(1,9);
b2(1)=1;
b2(9)=-1;

a2=[1 -1];

SecondFilter=filter(b2,a2,[1 zeros(1,10)]);

%Transformation

FirstTransformation=conv(Signal,FirstFilter);
SecondTransformation=conv(FirstTransformation,SecondFilter);

%Décalage dû au filtre

dec = 5;
Sfiltered=decal(SecondTransformation,dec,Signal);



%Search of the maximum in the interval

lenPR=length(PRInterval);
test=zeros(1000);


 i=1;
 while i<=lenPR
     if PRInterval(i) == 1
        j=0;
        while PRInterval(i)==1
            if Sfiltered(i)>0 && Sfiltered(i+1)<0 && j==0 
                res(i) = Signal(i);
                j=1;
            end
            i = i+1;
        end
     end
     i = i+1;
 end




