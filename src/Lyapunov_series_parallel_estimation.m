%% Online estimation using Lyapunov theorem & series parallel model (SP)

clc;
clear;

addpath("../inc/dynamics");
addpath("../inc/plots1D");


%% System initialization

% External force
u = @(t) 3 * cos(2 * t);

a = 1.5;
b = 2;

% Initial state
x0 = [0, 0, 0, 0]';
t_span = 0:0.05:25;

% Method-related parameters
gamma1 = 0.5;
gamma2 = 0.7;
theta_m = 2;


%% Noise addition (optional)

% Noise type
n0 = 1.5;
f = 20;
n = @(t) n0 * sin(2 * pi * f * t);


%% Simulation & parameter estimation

% Solve for specified time span
[t, x] = ode15s(@(t, x) dynamics3(t, x, a, b, gamma1, ...
                                  gamma2, theta_m, u, n), t_span, x0);

y = x(:, 1);
y_hat = x(:, 2);
theta_hat1 = x(:, 3);
theta_hat2 = x(:, 4);

a_hat = theta_hat1(:);
b_hat = theta_hat2(:);

a_hat(length(t_span))
b_hat(length(t_span))


%% Evaluation

% Percentage error
percentage_error = zeros(length(t_span), 1);
for i = 1:length(t_span)
    percentage_error(i) = abs((y(i) - y_hat(i)) / y(i));
end

% Mean square error, calculated by (y - yhat)^2
mean_square_error = zeros(length(t_span), 1);
for i = 1:length(t_span)
    mean_square_error(i) = (y(i) - y_hat(i)) ^ 2;
end


%% Simulation plots

% Estimated parameter convergence 
plot_estimations(t_span, a_hat, b_hat, a, b);

% Output of the real system vs model
plot_output(t_span, y, y_hat);

% Percentage error
plot_error(t_span, percentage_error, false);

% Mean square error
plot_error(t_span, mean_square_error, true);
