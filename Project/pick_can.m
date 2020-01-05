function [candidate,weight] = pick_can(x,L,y,K,order)
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

points=size(x,1);
candidate=zeros(points,weight);
for l=0:L
    candidate(1:points,index)=delay(x,l);
    index=index+1;
end 
for k=1:K
    candidate(1:points,index)=delay(y,k);
    index=index+1;
end
if(order==2) || (order==3)
    for l_1=0:L
        for l_2=l_1:L
            candidate(1:points,index)=(delay(x,l_1)).*(delay(x,l_2));
            index=index+1;
        end 
    end
    for k_1=1:K
        for k_2=k_1:K
            candidate(1:points,index)=(delay(y,k_1)).*(delay(y,k_2));
            index=index+1;
        end
    end
    for k=1:K
        for l=0:L
            candidate(1:points,index)=(delay(y,k)).*(delay(x,l));
            index=index+1;
        end 
    end
end
if order==3
    for l_1=0:L
        for l_2=l_1:L
            for l_3=l_2:L
                candidate(1:points,index)=(delay(x,l_1)).*(delay(x,l_2)).*(delay(x,l_3));
                index=index+1;
            end
        end 
    end
    for k_1=1:K
        for k_2=k_1:K
            for k_3=k_2:K
                candidate(1:points,index)=(delay(y,k_1)).*(delay(y,k_2)).*(delay(y,k_3));
                index=index+1;
            end
        end 
    end
    for l_1=0:L
        for l_2=l_1:L
            for k=1:K
                candidate(1:points,index)=(delay(x,l_1)).*(delay(x,l_2)).*(delay(y,k));
                index=index+1;
            end
        end 
    end
    for k_1=1:K
        for k_2=k_1:K
            for l=0:L
                candidate(1:points,index)=(delay(y,k_1)).*(delay(y,k_2)).*(delay(x,l));
                index=index+1;
            end
        end 
    end
end
