s=tf('s');
sys=100/(s^2 + (201*s)/10 + 102);

step(sys)
