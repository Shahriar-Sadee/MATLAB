clc;
clear;


% N = 10;                    % Number of bits to transmit
% data = randi([0 1], 1, N);  % Random binary data
% Input binary data sequence
data = [1 0 1 1 0 0 1 0 1];  % Example binary data
%data=input('input the binary data')
% Number of bits
N = length(data);
fc = 10;  
fs = 1000;  
Tb = 1;  % Bit duration (seconds)
t = 0:1/fs:Tb-(1/fs);  % Time vector for one bit
ASK_signal = [];
for i = 1:N
    if data(i) == 1
        ASK_signal = [ASK_signal sin(2*pi*fc*t)];  % Signal with carrier
    else
        ASK_signal = [ASK_signal zeros(1, length(t))];  % No signal
    end
end

t_total = 0:1/fs:(N*Tb)-(1/fs);% total time i.e. Time vector for all bits


% Plot the original data sequence
subplot(3,1,1);
stem(0:N-1, data, 'LineWidth', 2);
title('Original Binary Data Sequence');
xlabel('Bit index');
ylabel('Amplitude');
ylim([-0.2 1.2]);
grid on;

% Plot the ASK modulated signal
subplot(3,1,2);
plot(t_total, ASK_signal, 'LineWidth', 2);
title('ASK Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the carrier signal for reference (for one bit)
subplot(3,1,3);
plot(t, sin(2*pi*fc*t), 'LineWidth', 2);
title('Carrier Signal (for 1 bit duration)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;