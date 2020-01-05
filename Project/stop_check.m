function [value] = stop_check(N,N_o,y_out,M,Q,Q_history)
left=Q;
sub_=0;
for m=0:M-1
    sub_=sub_ + Q_history(m+1);
end
square=y_out((N_o+1):end).^2;
right=(4/(N-N_o+1))*(mean(square) - sub_);

if (left>right)
    value=1;
else
    value=0;
end


