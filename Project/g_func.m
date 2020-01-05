function [value] = g_func(y_out,m,pot_can,sel_can,C,D,N_o)
value=C_func(y_out,m,pot_can,sel_can,C,D,N_o)/D_func(pot_can,sel_can,m,m,D,N_o);

