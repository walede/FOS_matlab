function y_out = create_noise(y,P)
v=P*var(y,0,1)/100;
s=(v)^0.5;
weight=size(y,1);
y_out=zeros(weight,1);
noise= s*randn(weight,1);
for i=1:weight
    y_out(i,1)=y(i,1)+noise(i,1);
end



