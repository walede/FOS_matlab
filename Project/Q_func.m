function [value] = Q_func(g,m,pot_can,sel_can,D,N_o)
value=(g^2)*D_func(pot_can,sel_can,m,m,D,N_o);
