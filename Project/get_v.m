function [value] = get_v(m,i,sel_can,N_o,D)
sum=0;
if(m==i)
    value=1;
else
    for r=i:m-1 %used to be r=0:m-1
        sum=sum - alpha_func(sel_can(:,m),sel_can,m,r,D,N_o)*get_v(r,i,sel_can,N_o,D);
    end
    value=sum;
end

%{
function [value] = get_v(m,i,sel_can,N_o)
D=zeros(size(sel_can,2)+1,size(sel_can,2)+1); %might be the fuck up
sum=0;
if(m==i)
    value=1;
else
    for r=0:m-1
        sum=sum - alpha_func(sel_can(:,m),sel_can,m,r,D,N_o)*get_v(r,i,sel_can,N_o);
    end
    value=sum;
end

    
    %}