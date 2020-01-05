function [value] = alpha_func(pot_can,sel_can,m,r,D,N_o)
if D((m+1),(r+1))==0
    value=(D_func(pot_can,sel_can,m,r,D,N_o)/D_func(pot_can,sel_can,r,r,D,N_o));
else
    value=D(m+1,r+1)/D((r+1),(r+1));
end 
