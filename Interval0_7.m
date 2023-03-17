function [Res]= Interval0_7(Interval,Q,S)

len=length(Interval);

resPR=zeros(1,len);
resTR=zeros(1,len);

k=1;
for i=1:len
    if Interval(i)~=0
        tmp(k)=i;
        k=k+1;
    end
end

lentmp=length(tmp);

for i=1:lentmp-1
    a=tmp(i);
    b=tmp(i+1);
    inter=b-a;
    ajout=floor(a+inter*0.7);
    res(ajout)=ajout;
end

res;

k=1;
while k<=length(res)
    for i=1:len
        if i==res(k)
            Q(i)=i;
            S(i)=i;
        end
    end
    k=k+1;
end

tmpQ=find(Q~=0);
tmpS=find(S~=0);

lenQ=length(tmpQ);

tmpQ=[floor(tmp(1)*0.7),tmpQ];

for k=1:2:lenQ-1
    a=tmpQ(k);
    b=tmpQ(k+1);
    for j=a:b
        resPR(j)=1;
    end
end

lenS=length(tmpS);

for k=1:2:lenS-1
    a=tmpS(k)+10;
    b=tmpS(k+1);
    for j=a:b
        resTR(j)=1;
    end
end

Res(1,:)=resPR;
Res(2,:)=resTR;
