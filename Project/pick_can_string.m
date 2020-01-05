function [string_holder] = pick_can_string(L,K,order)
%x and y are column vectors
%K is the delay in the output, L is the delay in the input

if order~=2 && order~=3 && order ~=1
    order=2;
end
index=1;
if order==2
    weight=(L+1)+K+(K*(K+1)/2)+((L+2)*(L+1)/2)+(L+1)*K;
elseif order==3
    weight=(L+1)+K+(K*(K+1)/2)+((L+2)*(L+1)/2)+(L+1)*K +(((L+1)*(L+2)*(L+3))/6)+((K*(K+1)*(K+2))/6)+((K*(L+1)*(L+2))/2)+(((L+1)*K*(K+1))/2);
else
    weight=(L+1)+K;
end
string_holder=cell(1,weight);
%points=size(x,1);
%candidate=zeros(points,weight);
for l=0:L
    if(l==0)
        name='x(n)';
    else
        name=sprintf('x(n-%d)', l);
    end
    string_holder(index)={name};
    index=index+1;
end 
for k=1:K
    name=sprintf('y(n-%d)', k);
    string_holder(index)={name};
    index=index+1;
end 
if (order==2) || (order==3)
    for l_1=0:L
        for l_2=l_1:L
            if l_1==0 && l_2==0
                name='x^2(n)';
            elseif l_1==l_2
                name=sprintf('x^2(n-%d)',l_1);
            elseif l_1==0
                name=sprintf('x(n)*x(n-%d)',l_2);    
            elseif l_2==0
                name=sprintf('x(n)*x(n-%d)',l_1);                
            else
                name=sprintf('x(n-%d)*x(n-%d)',l_1,l_2);
            end
            string_holder(index)={name};
            index=index+1;
        end 
    end
    for k_1=1:K
        for k_2=k_1:K
            if k_1==k_2
                name=sprintf('y^2(n-%d)',k_1);
            else
                name=sprintf('y(n-%d)*y(n-%d)',k_1,k_2);
            end
            string_holder(index)={name};
            index=index+1;
        end
    end
    for k=1:K
        for l=0:L
            if(l==0)
                name=sprintf('x(n)*y(n-%d)',k);
            else
                name=sprintf('x(n-%d)*y(n-%d)',l,k);
            end
            string_holder(index)={name};        
            index=index+1;
        end 
    end
end
if order==3
    for l_1=0:L
        for l_2=l_1:L
            for l_3=l_2:L
                if l_1==l_2==l_3==0
                    name='x^3(n)';
                elseif l_1==l_2==l_3
                    name=sprintf('x^3(n-%d)',l_1);
                elseif l_1==l_2==0
                    name=sprintf('x^2(n)*x(n-%d)',l_3);
                elseif l_1==l_2
                    name=sprintf('x^2(n-%d)*x(n-%d)',l_1,l_3);
                elseif l_1==l_3==0
                    name=sprintf('x^2(n)*x(n-%d)',l_2);
                elseif l_1==l_3
                    name=sprintf('x^2(n-%d)*x(n-%d)',l_1,l_2);
                elseif l_2==l_3==0
                    name=sprintf('x^2(n)*x(n-%d)',l_1);
                elseif l_2==l_3
                    name=sprintf('x^2(n-%d)*x(n-%d)',l_2,l_1);    
                else    
                    name=sprintf('x(n-%d)*x(n-%d)*x(n-%d)',l_1,l_2,l_3);
                end
                string_holder(index)={name};    
                index=index+1;
            end
        end 
    end
    for k_1=1:K
        for k_2=k_1:K
            for k_3=k_2:K
                if k_1==k_2==k_3
                    name=sprintf('y^3(n-%d)',k_1);
                elseif k_1==k_2==0
                    name=sprintf('y^2(n)*y(n-%d)',k_3);
                elseif k_1==k_2
                    name=sprintf('y^2(n-%d)*y(n-%d)',k_1,k_3);
                elseif k_1==k_3
                    name=sprintf('y^2(n-%d)*y(n-%d)',k_1,k_2);
                elseif k_2==k_3
                    name=sprintf('y^2(n-%d)*y(n-%d)',k_2,k_1);    
                else    
                name=sprintf('y(n-%d)*y(n-%d)*y(n-%d)',k_1,k_2,k_3);
                end
                string_holder(index)={name};                
                index=index+1;
            end
        end 
    end
    for l_1=0:L
        for l_2=l_1:L
            for k=1:K
                if l_1==0 && l_2==0
                    name=sprintf('x^2(n)*y(n-%d)',k);
                elseif l_1==l_2
                    name=sprintf('x^2(n-%d)*y(n-%d)',l_1,k);
                else
                    name=sprintf('x(n-%d)*x(n-%d)*y(n-%d)',l_1,l_2,k);
                end
                string_holder(index)={name};                
                index=index+1;
            end
        end 
    end
    for k_1=1:K
        for k_2=k_1:K
            for l=1:L
                if k_1==k_2
                    name=sprintf('x(n-%d)*y^2(n-%d)',l,k_1);
                else
                    name=sprintf('x(n-%d)*y(n-%d)*y(n-%d)',l,k_1,k_2);
                end
                string_holder(index)={name};                
                index=index+1;
            end
        end 
    end
end
