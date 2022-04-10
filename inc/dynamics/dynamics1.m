function dx = dynamics1(t, x, a, b, am, gamma, u)
% x = [y, theta_hat1, theta_hat2, phi1, phi2, y_hat]
    e = x(1) - x(6);
    dx(1) = -a * x(1) + b * u(t);
    dx(2) = gamma * e * x(4);
    dx(3) = gamma * e * x(5);
    dx(4) = -am * x(4) + x(1);
    dx(5) = -am * x(5) + u(t);
    dx(6) = (x(2) - am) * x(6) + x(3) * u(t);
    dx = dx';
end 

