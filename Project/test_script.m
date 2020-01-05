%N = 1000;
y = 1 + 2*delay(x,1);
[z,solution]=FOS(x,y,5,5,2);
plot(y,z);
%{
y= zeros(3000,1);
for i= 4:3000
   y(i)= -0.435+0.45*x3(i)+0.5*y(i-1)+0.35*x2(i-1)*y(i-2)+0.099*x2(i-2)*x2(i)+y(i-1)*y(i-2)+0.25*x2(i-3)*y(i-3);
end
z=create_noise(y,0);


%}
%{
[y_model_1,sol_1,mse_1,id_mse_1] =FOS(x1,z1,2,3,2);
[y_model_2,sol_2,mse_2,id_mse_2] =FOS(x1,z1,4,5,2);
[y_model_3,sol_3,mse_3,id_mse_3] =FOS(x1,z1,6,7,2);
[y_model_4,sol_4,mse_4,id_mse_4] =FOS(x1,z1,8,9,2);
[y_model_5,sol_5,mse_5,id_mse_5] =FOS(x1,z1,10,10,2);
[y_model_6,sol_6,mse_6,id_mse_6] =FOS(x1,z1,5,5,3);
%}
%{
y_sim_1= zeros(1000,1);
for n=4:1000
    y_sim_1(n)=0.89774+0.17919*y_sim_1(n-3) +0.59089*x2(n-2)^2 +0.20041*x2(n-2) +0.15274*x2(n-2)*y_sim_1(n-3) +-0.20754*x2(n)*x2(n-1) +0.055005*x2(n)*y_sim_1(n-2) +0.052737*y_sim_1(n-3)^2;
end
mse_sim_1=mean((z2(4:end)-y_sim_1(4:end)).^2);
id_mse_sim_1=ideal_mse(y_sim_1,z2,2,3);

y_sim_2= zeros(1000,1);
for n=6:1000
    y_sim_2(n)=0.97295+-0.90188*x2(n-1)*x2(n-3) +0.2442*x2(n-2) +0.58359*x2(n-2)^2 +0.13084*y_sim_2(n-3) +-0.24042*x2(n)*x2(n-1) +0.1235*x2(n-2)*y_sim_2(n-3) +0.053803*y_sim_2(n-3)^2 +0.070951*x2(n) +-0.041378*x2(n-3)*y_sim_2(n-2);
end
mse_sim_2=mean((z2(6:end)-y_sim_2(6:end)).^2);
id_mse_sim_2=ideal_mse(y_sim_2,z2,4,5);

y_sim_3= zeros(1000,1);
for n=8:1000
    y_sim_3(n)=0.92834+-0.86612*x2(n-1)*x2(n-3) +0.15291*x2(n-2)*y_sim_3(n-6) +0.037189*y_sim_3(n-3)^2 +0.58657*x2(n-2)^2 +0.15386*y_sim_3(n-6) +0.026654*x2(n-5)*y_sim_3(n-3) +0.21614*x2(n-5)^2 +-0.23358*x2(n-4)*x2(n-6) +0.1949*x2(n-2)*x2(n-5) +0.1945*x2(n-2) +-0.20802*x2(n)*x2(n-1) +0.23063*x2(n) +-0.11137*x2(n)*y_sim_3(n-6) +-0.043405*x2(n-3)*y_sim_3(n-3) +0.089907*x2(n-5)*y_sim_3(n-6);
end
mse_sim_3=mean((z2(8:end)-y_sim_3(8:end)).^2);
id_mse_sim_3=ideal_mse(y_sim_3,z2,6,7);

y_sim_4= zeros(1000,1);
for n=10:1000
    y_sim_4(n)=1.0141+0.13526*x2(n-2)*y_sim_4(n-6) +-0.87153*x2(n-1)*x2(n-3) +0.58468*x2(n-2)^2 +0.029845*y_sim_4(n-3)^2 +0.05391*y_sim_4(n-6)*y_sim_4(n-9) +0.026589*x2(n-5)*y_sim_4(n-3) +0.2317*x2(n-5)^2 +-0.26282*x2(n-4)*x2(n-6) +0.22298*x2(n-2)*x2(n-5) +0.23357*x2(n-2) +0.13879*x2(n-8)^2 +-0.20001*x2(n)*x2(n-1) +0.10605*x2(n-5)*y_sim_4(n-6) +0.044657*x2(n)*y_sim_4(n-8) +-0.14056*x2(n-6)*x2(n-7) +-0.04332*x2(n-3)*y_sim_4(n-3) +0.13995*x2(n-1)*x2(n-4);
end
mse_sim_4=mean((z2(10:end)-y_sim_4(10:end)).^2);
id_mse_sim_4=ideal_mse(y_sim_4,z2,8,9);

y_sim_5= zeros(1000,1);
for n=11:1000
    y_sim_5(n)=1.0552+0.15627*x2(n-2)*y_sim_5(n-6) +-0.83895*x2(n-1)*x2(n-3) +0.57867*x2(n-2)^2 +0.018988*y_sim_5(n-3)^2 +-0.37707*x2(n-7)*x2(n-9) +0.043751*x2(n-5)*y_sim_5(n-3) +-0.00041414*y_sim_5(n-6)*y_sim_5(n-9) +0.24572*x2(n-5)^2 +-0.23508*x2(n-4)*x2(n-6) +0.20818*x2(n-8)^2 +0.21214*x2(n-2)*x2(n-5) +0.1324*x2(n-2)*y_sim_5(n-9) +-0.2016*x2(n)*x2(n-1) +-0.17776*x2(n-6)*x2(n-7) +0.044996*x2(n)*y_sim_5(n-8) +-0.1181*x2(n-5)*x2(n-9) +0.12158*x2(n-8)*y_sim_5(n-9) +0.033144*y_sim_5(n-9)^2 +-0.070478*x2(n-8)*y_sim_5(n-1) +0.096766*x2(n-5)*y_sim_5(n-6);
end
mse_sim_5=mean((z2(11:end)-y_sim_5(11:end)).^2);
id_mse_sim_5=ideal_mse(y_sim_5,z2,10,10);

y_sim_6= zeros(1000,1);
for n=6:1000
    y_sim_6(n)=0.87923+-0.012978*x2(n-2)^2*y_sim_6(n-3) +-0.85611*x2(n-1)*x2(n-3) +0.32379*x2(n-2) +-0.01202*y_sim_6(n-3)^2 +0.63312*x2(n-2)^2 +0.042156*x2(n-5)*y_sim_6(n-2)*y_sim_6(n-3) +-0.16187*x2(n-0)*x2(n-1)*y_sim_6(n-3) +0.25505*y_sim_6(n-3) +0.074273*x2(n-5)^2*y_sim_6(n-3) +0.12056*x2(n-2)*x2(n-5)*y_sim_6(n-5) +-0.2327*x2(n)^3 +0.12025*x2(n-1)*x2(n-4)*y_sim_6(n-4) +-0.34029*x2(n)^3 +0.049834*x2(n-2)*y_sim_6(n-2)*y_sim_6(n-3) +0.073765*x2(n) +0.27119*x2(n)^3 +0.00961*y_sim_6(n)^2*y_sim_6(n-5);
end
mse_sim_6=mean((z2(6:end)-y_sim_6(6:end)).^2);
id_mse_sim_6=ideal_mse(y_sim_6,z2,5,5);

%}

%{
y_sim_n= zeros(1000,1);
for n=11:1000
    y_sim_n(n)=1.0552+0.15627*x3(n-2)*y_sim_n(n-6) +-0.83895*x3(n-1)*x3(n-3) +0.57867*x3(n-2)^2 +0.018988*y_sim_n(n-3)^2 +-0.37707*x3(n-7)*x3(n-9) +0.043751*x3(n-5)*y_sim_n(n-3) +-0.00041414*y_sim_n(n-6)*y_sim_n(n-9) +0.24572*x3(n-5)^2 +-0.23508*x3(n-4)*x3(n-6) +0.20818*x3(n-8)^2 +0.21214*x3(n-2)*x3(n-5) +0.1324*x3(n-2)*y_sim_n(n-9) +-0.2016*x3(n)*x3(n-1) +-0.17776*x3(n-6)*x3(n-7) +0.044996*x3(n)*y_sim_n(n-8) +-0.1181*x3(n-5)*x3(n-9) +0.12158*x3(n-8)*y_sim_n(n-9) +0.033144*y_sim_n(n-9)^2 +-0.070478*x3(n-8)*y_sim_n(n-1) +0.096766*x3(n-5)*y_sim_n(n-6);
end
mse_final=mean((y3_n(11:end)-y_sim_n(11:end)).^2);
pc_mse_final=ideal_mse(y_sim_n,y3_n,10,10);
id_mse_final=ideal_mse(y_sim_n,z3,10,10);
%}
%{
y_sim_4_n= zeros(1000,1);
for n=5:1000
    y_sim_n(n)=-0.43594+1.2043*x2(n-2)^2 +-0.62056*x2(n-6)^2 +0.12402*y_sim_n(n-8) +0.047725*y_sim_n(n-8)^2 +0.15778*x2(n-2)*y_sim_n(n-3) +-0.25595*x2(n)*x2(n-1) +-0.046808*y_sim_n(n-1)^2 +-0.095479*x2(n-3) +0.087433*x2(n-5) +-0.056793*y_sim_n(n-4) +0.069509*y_sim_n(n-1)*y_sim_n(n-7) +-0.13087*x2(n-6)*y_sim_n(n-7) +-0.1717*x2(n-5)*x2(n-6) +-0.076242*x2(n-6)*y_sim_n(n-4) +-0.14707*x2(n-6)*x2(n-8) +-0.041431*y_sim_n(n-2)*y_sim_n(n-6);
end
mse_final_4=mean((y3_n-y_sim_4_n).^2);
id_mse_final_4=ideal_mse(y_sim_4_n,y3_n,6,5);
%}
