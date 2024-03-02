clc;clear all;

n = 20; 
u = linspace(-1, 1, n)';
e = 0.1 * randn(n, 1);
y_true = 1.05 + 0.14 * u + 4 * u.^2 + 2 * u.^3 + e;

% Model 1: y(i) = b_0
A1 = ones(n, 1);
b1 = A1\y_true;

% Model 2: y(i) = b_0 + b_1*u
A2 = [ones(n, 1), u];
b2 = A2\y_true;

% Model 3: y(i) = b_0 + b_1*u + b_2*u^2
A3 = [ones(n, 1), u, u.^2];
b3 = A3\y_true;

% Model 4: y(i) = b_0 + b_1*u + b_2*u^2 + b_3*u^3
A4 = [ones(n, 1), u, u.^2, u.^3];
b4 = A4\y_true;


y_hat1 = A1 * b1;
y_hat2 = A2 * b2;
y_hat3 = A3 * b3;
y_hat4 = A4 * b4;

% Plot the results
figure;
subplot(2, 2, 1);
plot(u, y_true, 'o', u, y_hat1, '-')
title('Model 1: y(i) = b_0');
grid on
subplot(2, 2, 2);
plot(u, y_true, 'o', u, y_hat2, '-')
title('Model 2: y(i) = b_0 + b_1*u');
grid on
subplot(2, 2, 3);
plot(u, y_true, 'o', u, y_hat3, '-')
title('Model 3: y(i) = b_0 + b_1*u + b_2*u^2');
grid on
subplot(2, 2, 4);
plot(u, y_true, 'o', u, y_hat4, '-')
title('Model 4: y(i) = b_0 + b_1*u + b_2*u^2 + b_3*u^3');
grid on


