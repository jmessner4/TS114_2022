function [res]=Tdetection (Signal,Rdetection,Q,S)

len=length(Signal);
res=zeros(1,len);

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

%Research of the Interval

Intervals=Interval0_7(Rdetection,Q,S);

TRInterval=Intervals(2,:);


%Search of the zeros in the interval

lenTR=length(TRInterval);

 i=1;
 while i<=lenTR-1
     if TRInterval(i) == 1
        j=0;
        while TRInterval(i)==1 
            if Sfiltered(i)>0 && Sfiltered(i+1)<0 && j==0
                res(i) = Signal(i);
                j=1;
            end
            i = i+1;
        end
     end
     i = i+1;
 end
