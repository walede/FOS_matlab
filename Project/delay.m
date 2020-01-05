function [value] = delay(x,k)
%x is inputed as a column vector and the delay value is k
value=zeros(size(x,1),1);
j=1;
for i=(k+1):size(x,1)
    value(i)=x(j);
    j=j+1;
end
    
   
    