s=tf('s');
sys=100/(s^2 + (201*s)/10 + 102);
K = 1;
L = 0.0246;
T = 0.313-L;
%figure

%step(sys)


a=K*L/T;
Ti=2*L;
Td=L/2;

Kp=1.2/a;
Ki=Kp/Ti;
Kd=Kp*Td;
cont=pid(Kp,Ki,Kd)
figure
step(feedback(cont*sys,1))
