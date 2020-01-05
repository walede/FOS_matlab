function [value] = ideal_mse(y,z,L,K)
No=max(L,K);
value= 100*(mean((y(No+1:end)-z(No+1:end)).^2)/var(z(No+1:end)));
