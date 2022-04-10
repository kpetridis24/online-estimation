%% Online estimation using Lyapunov theorem & parallel model (P) in 2-dim

clc;
clear;

addpath("../inc/dynamics");
addpath("../inc/plots1D");
addpath("../inc/plots2D");


%% System initialization

% External force
u = @(t) 7.5 * cos(3 * t) + 10 * cos(2 * t);

% System matrices
a11 = -0.5;
a12 = -3;
a21 = 4;
a22 = -2;

b1 = 1;
b2 = 1.4;

A = [a11, a12; a21, a22];
B = [b1; b2];

% Initial state
x0 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]';
t_span = 0:0.01:100;

% Method-related parameters
gamma1 = 0.5;
gamma2 = 0.7;


%% Simulation & parameter estimation

% Solve for specified time span
[t, x] = ode15s(@(t, x) dynamics4(t, x, A, B, gamma1, ...
                                  gamma2, u), t_span, x0);

y1 = x(:, 1);
y2 = x(:, 2);
y1_hat = x(:, 9);
y2_hat = x(:, 10);

a11_hat = x(:, 3);
a12_hat = x(:, 4);
a21_hat = x(:, 5);
a22_hat = x(:, 6);

b1_hat = x(:, 7);
b2_hat = x(:, 8);

a11_hat(length(t_span))
a12_hat(length(t_span))
a21_hat(length(t_span))


%% Evaluation

% Percentage error
percentage_error = zeros(length(t_span), 1);
for i = 1:length(t_span)
    percentage_error(i) = sqrt(((y1(i) - y1_hat(i)) /  y1(i))^2 + ...
                               ((y2(i) - y2_hat(i)) /  y2(i))^2);
end

% Mean square error, calculated by (y - yhat)^2
mean_square_error = zeros(length(t_span), 1);
for i = 1:length(t_span)
    mean_square_error(i) = (y1(i) - y1_hat(i)) ^ 2 + ...
                           (y2(i) - y2_hat(i)) ^ 2;
end


%% Simulation plots

% Estimated parameter convergence 
plot_estimations2D(t_span, a11_hat, a12_hat, a21_hat, a22_hat, a11, ...
                                                    a12, a21, a22);
plot_estimations(t_span, b1_hat, b2_hat, b1, b2);

% Output of the real system vs model
plot_output(t_span, y1, y1_hat);
plot_output(t_span, y2, y2_hat);

% Percentage error
plot_error(t_span, percentage_error, false);

% Mean square error
plot_error(t_span, mean_square_error, true);
