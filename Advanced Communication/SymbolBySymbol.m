clc;
clear all;
close all;

D = [1 0 1 1 0 1];
N = length(D);
P = zeros(1, N);
I = zeros(1, N);
D_decoded = zeros(1, N);

P(1) = D(1); % Initialize the first element of P
for n = 2:N
    P(n) = mod(D(n) + P(n-1), 2); % Modulo 2 operation
end

for n = 2:N
    I(n) = 2 * P(n) - 1; % Adjusted to match typical binary operations
end

for n = 2:N
    D_decoded(n) = mod(P(n) + P(n-1), 2); % Modulo 2 operation
end

D_decoded(1) = P(1); % Initialize the first element of D_decoded

disp('Original Data:');
disp(D);

disp('Precoded Seq:');
disp(D_decoded);