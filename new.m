s = tf('s');
sys = 100 / (s^2 + (20.1 * s) / 10 + 102);

% Given PID gains
Kp = 14.1;
Ki = 286;
Kd = 0.173;

% Create the PID controller with the given gains
cont = pid(Kp, Ki, Kd);

% Combine the system and the controller in a closed-loop configuration
closed_loop_sys = feedback(cont * sys, 1);

% Define the desired setpoint
setpoint = 0.1;

% Generate the step response for the closed-loop system to the given setpoint
t = 0:0.01:20; % Define a time vector from 0 to 20 seconds with 0.01 second intervals
[y, t] = step(setpoint * closed_loop_sys, t);

% Compute the error signal
error = setpoint - y;

% Initialize variables for PID control
dt = t(2) - t(1);
integral = 0;
previous_error = 0;
control_signal = zeros(size(t));

% Calculate the control signal
for i = 1:length(t)
    % Proportional term
    P = Kp * error(i);
    
    % Integral term
    integral = integral + error(i) * dt;
    I = Ki * integral;
    
    % Derivative term
    if i > 1
        derivative = (error(i) - previous_error) / dt;
    else
        derivative = 0;
    end
    D = Kd * derivative;
    
    % PID output
    control_signal(i) = P + I + D;
    
    % Update previous error
    previous_error = error(i);
end

% Plot the system response
figure;
subplot(2, 1, 1);
plot(t, y);
title('Step Response of the Closed-Loop System to a Setpoint of 0.1');
xlabel('Time (seconds)');
ylabel('Response');
grid on;

% Plot the control signal
subplot(2, 1, 2);
plot(t, control_signal);
title('Control Signal');
xlabel('Time (seconds)');
ylabel('Control Effort');
grid on;
