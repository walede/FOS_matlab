function [value] = D_func(pot_can,sel_can,m,r,D,N_o)
%{
inputs are the candidates(pot and sel), m,r,D array
candidates will be an array of column vectors where the
column vector will represent the entire candidate
%}
if (D(m+1,r+1)~=0)
    value=D(m+1,r+1);
elseif (m==0) && (r==0) % if m and r are 0 return 1
    value=1;  
elseif (r==0) %fuck up here need the data from the last mans -fixed
    value= mean(pot_can((N_o+1):end)); %if r =0 then calculate the mean of the can
else 
    sub_=0;
    for i=0:r-1
        sub_= sub_ + alpha_func(pot_can,sel_can,r,i,D,N_o)*D_func(pot_can,sel_can,m,i,D,N_o); 
    end 
    if(m==r)
        value=mean(pot_can((N_o+1):end).*pot_can((N_o+1):end)) - sub_; %new fuck up - fixed
    else
        hold=sel_can(:,r);
        value=mean(pot_can((N_o+1):end).*hold((N_o+1):end)) - sub_; %this is the second fuck up - fixed
    end
end
%{
function [value] = D_func(pot_can,sel_can,m,r,D,N_o)
%{
inputs are the candidates(pot and sel), m,r,D array
candidates will be an array of column vectors where the
column vector will represent the entire candidate
%}
if (m==0) && (r==0) % if m and r are 0 return 1
    value=1;
elseif (r==0) %fuck up here need the data from the last mans -fixed
    if (any(sel_can(:,m))) %if it returns 1 it exists
        hold=sel_can(:,m);
        value= mean(hold((N_o+1):end));
    else
        value= mean(pot_can((N_o+1):end)); %if r =0 then calculate the mean of the can
    end
else 
    sub_=0;
    for i=0:r-1
        sub_= sub_ + alpha_func(pot_can,sel_can,r,i,D,N_o)*D_func(pot_can,sel_can,m,i,D,N_o); %pot_can,sel_can,m,r,D
    end 
    if(m==r)
        if (any(sel_can(:,m)))
            hold=sel_can(:,m);
            value=mean(hold((N_o+1):end).*hold((N_o+1):end)) - sub_;
        else
            value=mean(pot_can((N_o+1):end).*pot_can((N_o+1):end)) - sub_; %new fuck up - fixed
        end
    else
        hold=sel_can(:,r);
        value=mean(pot_can((N_o+1):end).*hold((N_o+1):end)) - sub_; %this is the second fuck up - fixed
    end
end

%}