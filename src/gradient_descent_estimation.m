%% Online estimation using Stochastic Gradient Descent

clc;
clear;

addpath("../inc/dynamics");
addpath("../inc/plots1D");


%% System initialization

% External force
u = @(t) 3;% * cos(2 * t);

a = 1.5;
b = 2;

% Initial state
x0 = [0, 0, 0, 0, 0, 0]';
t_span = 0:0.05:25;

% Method-related parameters
am = 6;
gamma = 5;


%% Simulation & parameter estimation 

% Solve for specified time span
[t, x] = ode15s(@(t, x) dynamics1(t, x, a, b, am, gamma, u), t_span, x0);

y = x(:, 1);
theta_hat1 = x(:, 2);
theta_hat2 = x(:, 3);
phi1 = x(:, 4);
phi2 = x(:, 5);
y_hat = x(:, 6);

% Estimated parameters a, b
a_hat = am - theta_hat1(:);
b_hat = theta_hat2(:);

a_hat(length(t_span))
b_hat(length(t_span))


%% Evaluation

% Percentage error, calculated by (y - yhat) / y
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
                            