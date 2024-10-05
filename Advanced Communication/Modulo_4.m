clc;
clear all;
close all;

% Prompt user for input
D = input('Enter the data sequence as a vector (e.g., [1 0 1 1 0 1]): ');
N = length(D);
P = zeros(1, N);
I = zeros(1, N);
D_decoded = zeros(1, N);

% Initialize the first element of P
P(1) = D(1); 
for n = 2:N
    P(n) = mod(D(n) + P(n-1), 4); % Modulo 4 operation
end

% Calculate I sequence
for n = 2:N
    I(n) = 2 * P(n) - 3; % Adjusted to match typical binary operations
end

% Calculate D_decoded sequence
for n = 2:N
    D_decoded(n) = mod(P(n) + P(n-1), 4); % Modulo 4 operation
end

% Initialize the first element of D_decoded
D_decoded(1) = P(1); 

disp('Original Data:');
disp(D);

disp('Precoded Seq:');
disp(D_decoded);