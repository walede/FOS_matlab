function [value] = get_coeff(g_m,i,sel_can,N_o,D,M)
%i=which candidate term we solving for, starting at least 0
sum=0;
for m=i:M
    sum=sum + g_m(m+1)*get_v(m,i,sel_can,N_o,D);
end
value=sum;

