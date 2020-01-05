function [y_model,solution,mse,id_mse] =FOS(x,y,L,K,order)
%randomly generated x column vector and the nonlinear result y column
%vector are inputs
%K and L are the delays in the input and output respectively
[pot_can,M]=pick_can(x,L,y,K,order);
can_labels=pick_can_string(L,K,order);
if (order==3)
    i=1;
    while i<=M
        if any(pot_can(:,i))==0
            can_labels(i)=[];
            M=M-1;
            i=i-1;
        end
        i=i+1;
    end
    pot_can=pot_can(:,any(pot_can));
    M=size(pot_can,2);
end
labels=cell(1,20);
coeff=zeros(1,20);
Q_history=zeros(1,21);
Q_index=2;
con=1;
label_index=1;
coeff_index=1;
sol_index=1;
g=zeros(21,1);
sel_can=zeros(size(x,1),20);
D_reign=zeros(21,21);
C_reign=zeros(21,1);
D_temp=zeros(21,21);
C_temp=zeros(21,1);
Q_reign=0;
g_reign=0;
stop=0;
N_o=max(L,K);
%for m=0 case
D_temp(1,1)=1; %D(0,0)
C_temp(1)=mean(y((N_o+1):end)); %C(0)
g(1)=C_temp(1)/D_temp(1,1); %g_0
Q_history(1)=g(1)^2; %Q(0)
while stop==0 && M~=1 && con==1
    for a=1:M %lets do one candidate
        can_A=pot_can(:,a); %p1 search
        D=D_temp;
        C=C_temp;
        for m=1:sol_index
            D((m+1),1)=D_func(can_A,sel_can,m,0,D,N_o);
            for r=0:m-1
                D((m+1),(r+2))=D_func(can_A,sel_can,m,(r+1),D,N_o);
            end
            C(m+1)=C_func(y,m,can_A,sel_can,C,D,N_o);
        end
        g_A=(C(sol_index+1)/D((sol_index+1),(sol_index+1)));  %%replacing a with solution index
        Q_A=Q_func(g_A,sol_index,can_A,sel_can,D,N_o); %g,m,pot_can,sel_can,D)
        if (Q_A>Q_reign) %check the two values 
            g_reign=g_A;
            Q_reign=Q_A;
            win_can=can_A;
            index_reign=a; %keep track of which one to save     
            D_reign=D;
            C_reign=C;
        end
    end
    con=stop_check(size(x,1),N_o,y,sol_index,Q_reign,Q_history); 
    if(con==1)
        g(sol_index+1)=g_reign;
        sel_can(:,sol_index)=win_can;
        labels(label_index)=can_labels(index_reign);
        label_index=label_index+1;
        Q_history(Q_index)=Q_reign; %save the Q values that will be used
        Q_index=Q_index+1;
        D_temp=D_reign;
        C_temp=C_reign;
    end
    M=M-1; %reduce the traveling size
    can_labels(index_reign)=[]; %save the label name then delete it from the list to match the number    
    pot_can(:,index_reign)=zeros(size(pot_can,1),1); %%maybe can then remove the zero vector
    pot_can=pot_can(:,any(pot_can));
    if (sol_index==20) %might remove
        stop=1;
    else
        stop=0;
        sol_index=sol_index+1;
        Q_reign=0; %reset these values
        g_reign=0;
        win_can=zeros(size(x,1),1);        
    end
end
%remove the zero vectors in the candidates
sel_can=sel_can(:,any(sel_can));
y_model=0;
M=size(sel_can,2);
for i=0:M
    if(i==0)
        hold=get_coeff(g,i,sel_can,N_o,D_reign,M);
        coeff(coeff_index)=hold;
        y_model=y_model + hold*1;
        coeff_index=coeff_index+1;
    else
        hold=get_coeff(g,i,sel_can,N_o,D_reign,M);
        coeff(coeff_index)=hold;
        y_model=y_model + hold*sel_can(:,i);
        coeff_index=coeff_index+1;
    end
end %coefficients
solution='y(n)=';
for i=0:M
    if(i==0)
        solution=strcat(solution,char(string(coeff(i+1))),'+');
    elseif (i==size(sel_can,2))
        solution=strcat(solution,char(string(coeff(i+1))),'*',labels{i},'.');
    else
        solution=strcat(solution,char(string(coeff(i+1))),'*',labels{i},' + ');
    end
end %final answer
mse=mean((y(N_o+1:end)-y_model(N_o+1:end)).^2);
id_mse=ideal_mse(y_model,y,L,K);

%{
function [y_model,solution,mse,id_mse] =FOS(x,y,L,K,order)
%randomly generated x column vector and the nonlinear result y column
%vector are inputs
%K and L are the delays in the input and output respectively
[pot_can,M]=pick_can(x,L,y,K,order);
can_labels=pick_can_string(L,K,order);
if (order==3)
    i=1;
    while i<=M
        if any(pot_can(:,i))==0
            can_labels(i)=[];
            M=M-1;
            i=i-1;
        end
        i=i+1;
    end
    pot_can=pot_can(:,any(pot_can));
    M=size(pot_can,2);
end
labels=cell(1,10);
coeff=zeros(1,11);
Q_history=zeros(1,11);
Q_index=2;
con=1;
label_index=1;
coeff_index=1;
sol_index=1;
g=zeros(11,1);
sel_can=zeros(size(x,1),10);
D_reign=zeros(11,11);
C_reign=zeros(11,1);
D_temp=zeros(11,11);
C_temp=zeros(11,1);
Q_reign=0;
g_reign=0;
stop=0;
N_o=max(L,K);
%for m=0 case
D_temp(1,1)=1; %D(0,0)
C_temp(1)=mean(y((N_o+1):end)); %C(0)
g(1)=C_temp(1)/D_temp(1,1); %g_0
Q_history(1)=g(1)^2; %Q(0)
while stop==0 && M~=1 && con==1
    for a=1:M %lets do one candidate
        can_A=pot_can(:,a); %p1 search
        D=D_temp;
        C=C_temp;
        for m=1:sol_index
            D((m+1),1)=D_func(can_A,sel_can,m,0,D,N_o);
            for r=0:m-1
                D((m+1),(r+2))=D_func(can_A,sel_can,m,(r+1),D,N_o);
            end
            C(m+1)=C_func(y,m,can_A,sel_can,C,D,N_o);
        end
        g_A=(C(sol_index+1)/D((sol_index+1),(sol_index+1)));  %%replacing a with solution index
        Q_A=Q_func(g_A,sol_index,can_A,sel_can,D,N_o); %g,m,pot_can,sel_can,D)
        if (Q_A>Q_reign) %check the two values 
            g_reign=g_A;
            Q_reign=Q_A;
            win_can=can_A;
            index_reign=a; %keep track of which one to save     
            D_reign=D;
            C_reign=C;
        end
    end
    con=stop_check(size(x,1),N_o,y,sol_index,Q_reign,Q_history); 
    if(con==1)
        g(sol_index+1)=g_reign;
        sel_can(:,sol_index)=win_can;
        labels(label_index)=can_labels(index_reign);
        label_index=label_index+1;
        Q_history(Q_index)=Q_reign; %save the Q values that will be used
        Q_index=Q_index+1;
        D_temp=D_reign;
        C_temp=C_reign;
    end
    M=M-1; %reduce the traveling size
    can_labels(index_reign)=[]; %save the label name then delete it from the list to match the number    
    pot_can(:,index_reign)=zeros(size(pot_can,1),1); %%maybe can then remove the zero vector
    pot_can=pot_can(:,any(pot_can));
    if (sol_index==10)
        stop=1;
    else
        stop=0;
        sol_index=sol_index+1;
        Q_reign=0; %reset these values
        g_reign=0;
        win_can=zeros(size(x,1),1);        
    end
end
%remove the zero vectors in the candidates
sel_can=sel_can(:,any(sel_can));
y_model=0;
M=size(sel_can,2);
for i=0:M
    if(i==0)
        hold=get_coeff(g,i,sel_can,N_o,D_reign,M);
        coeff(coeff_index)=hold;
        y_model=y_model + hold*1;
        coeff_index=coeff_index+1;
    else
        hold=get_coeff(g,i,sel_can,N_o,D_reign,M);
        coeff(coeff_index)=hold;
        y_model=y_model + hold*sel_can(:,i);
        coeff_index=coeff_index+1;
    end
end %coefficients
solution='y(n)=';
for i=0:M
    if(i==0)
        solution=strcat(solution,char(string(coeff(i+1))),'+');
    elseif (i==size(sel_can,2))
        solution=strcat(solution,char(string(coeff(i+1))),'*',labels{i},'.');
    else
        solution=strcat(solution,char(string(coeff(i+1))),'*',labels{i},' + ');
    end
end %final answer
mse=mean((y(N_o+1:end)-y_model(N_o+1:end)).^2);
id_mse=ideal_mse(y_model,y,L,K);
%{
  g(sol_index+1)=g_reign;
    sel_can(:,sol_index)=temp;
    pot_can(:,index_reign)=zeros(size(pot_can,1),1); %%maybe can them remove the zero vector
    pot_can=pot_can(:,any(pot_can));
    labels(label_index)=can_labels(index_reign);
    label_index=label_index+1;
    can_labels(index_reign)=[]; %save the label name then delete it from the list to match the number
    M=M-1; %reduce the traveling size
    Q_history(Q_index)=Q_reign; %save the Q values that will be used
    Q_index=Q_index+1;
    con=stop_check(size(x,1),N_o,y,sol_index,Q_reign,Q_history);
    %M_S_E=MSE(y,Q_history,sol_index,N_o);
    %if (sol_index==10)
    if (con==1) || (sol_index==10)
        stop=1;
    else
        stop=0;
        sol_index=sol_index+1;
        Q_reign=0; %reset these values
        g_reign=0;
        temp=zeros(size(x,1),1);        
    end


end
    %}
%{
for i=0:size(sel_can,2)
    if(i==0)
        hold=get_coeff(g,i,sel_can,N_o,D_reign);
        coeff(coeff_index)=hold;
        y_model=y_model + hold*1;
        coeff_index=coeff_index+1;
    else
        hold=get_coeff(g,i,sel_can,N_o,D_reign);
        coeff(coeff_index)=hold;
        y_model=y_model + hold*sel_can(:,i);
        coeff_index=coeff_index+1;
    end
end %coefficients
%}
    %}
