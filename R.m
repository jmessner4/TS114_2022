function [R1] = R(X,A)
 
 R1 = zeros(1,length(A));
 i=1;
 while i<=length(A)
     if A(i) == 1
        j=0;
        while (A(i)==1)
            if(X(i)>X(i+1) && j==0)
                R1(i) = X(i);
                j=1;
            elseif j==1
                R1(i)=0;
            end
            i = i+1;
        end
     end
     i = i+1;   
 end
 
 