clc;
clear;
close;
t_end = 2;
dt = 1e-4;
t = 0:dt:t_end;
numS = length(t);
x(:,1) = [0;0];
Ra = 0.2;
La = 0.01;
B = 0.1;
kb = 1;
kt = 1;
J = 1;
d2=(Ra*B)/(La*J)+(kb*kt)/(La*J);
d1=(Ra/La)+(B/J);
n1=kt/(La*J);
x_des=0.1;
A=[0,1;-d2,-d1];
B=[0;n1];
f=@(t,x,u) A*x+B*u;
u(1)=0;
psir_r(1)=0;
X_d(1)=0;
for i = 1:numS-1
    X_des(1)=x_des;
    k_1 = dt*f(t(i),x(:,i),u(i));
    k_2 = dt*f(t(i) + dt/2, x(:,i) + k_1/2,u(i));
    k_3 = dt*f(t(i) + dt/2, x(:,i) + k_2/2,u(i));
    k_4 = dt*f(t(i) + dt  , x(:,i) + k_3,u(i));
    x(:,i+1) = x(:,i) + (k_1 + 2*k_2 + 2*k_3 + k_4)/6;
    [u(i+1),psi_r(i+1)]=control_1_step(t(i),x(:,i),X_des);
    X_d(i+1)=X_des(1);
end
%[t, X] = ode45(@(t,X) omni(t,X), t_span, X_init);
% Plotting results
figure
subplot(2,3,1)
plot(t, x(1,:), 'LineWidth', 1.5)
title('Speed')
xlabel('Time (s)')
ylabel('Speed')

subplot(2,3,2)
plot(t, u, 'LineWidth', 1.5)
title('Input')
xlabel('Time (s)')
ylabel('Control Input')

subplot(2,3,3)
plot(t, psi_r, 'LineWidth', 1.5)
title('\psi_r')
xlabel('Time (s)')
ylabel('\psi_r')

subplot(2,3,4)
plot(t, X_d, 'LineWidth', 1.5)
title('X_d')
xlabel('Time (s)')
ylabel('X_d')

subplot(2,3,5)
plot(t, x(1,:) - X_d, 'LineWidth', 1.5)
title('x - X_d')
xlabel('Time (s)')
ylabel('Error (x - X_d)')