function [value] = C_func(y_out,m,pot_can,sel_can,C,D,N_o)
%y_out is a colum vector, m the index, pot_can & sel_can the candidates
if(C(m+1)~=0)
    value=C(m+1);
elseif (m==0)
    value=mean(y_out((N_o+1):end));
else
    sub_=0;
    for r=0:m-1
        sub_= sub_ + alpha_func(pot_can,sel_can,m,r,D,N_o)*C_func(y_out,r,pot_can,sel_can,C,D,N_o);
    end 
    value=mean(y_out((N_o+1):end).*pot_can((N_o+1):end)) - sub_;
end 
%{
function [value] = C_func(y_out,m,pot_can,sel_can,C,D,N_o)
%y_out is a colum vector, m the index, pot_can & sel_can the candidates
if (m==0)
    value=mean(y_out((N_o+1):end));
else
    sub_=0;
    for r=0:m-1
        sub_= sub_ + alpha_func(pot_can,sel_can,m,r,D,N_o)*C_func(y_out,r,pot_can,sel_can,C,D,N_o);
    end 
    if(C(m+1)==0)
        if (any(sel_can(:,m))) %if it returns 1 it exists
            hold=sel_can(:,m);
            value=mean(y_out((N_o+1):end).*hold((N_o+1):end)) - sub_;
        else
            value=mean(y_out((N_o+1):end).*pot_can((N_o+1):end)) - sub_;
        end
    else
        value=C(m+1);
    end
end 
    

    %}
