function [u,psi_r] = control_1_step(t,X,X_des)
mu=7;
mu_r=mu;
a=8;
n=2;
lambda_1=a*a;
psi_0=2*pi;
psi_inf=0.1;
psir_0=(a-mu_r)^(n-1)*psi_0;
psir_inf=a^(n-1)*psi_inf;
v_bar=18;
psi_r=psir_0*exp(-mu_r*t)+psir_inf;
r=lambda_1*(X(1)-X_des(1));
u=-(2*v_bar/pi)*atan((pi/(2*v_bar))*tan(pi*r/(2*psi_r)));

end