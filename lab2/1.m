clc
clear all
close all
fs = 500; % Sampling frequency
t = 0:1/fs:0.5; % Time duration
f1 = 8; % Frequency of first signal
f2 =5; % Frequency of second signal
f3 =5; % Frequency of third signal
f=5;
A1 = 3; % Amplitude of first signal
A2 = 5; % Amplitude of second signal
A3 = 10;
x1 = A1*sin(2*pi*f*t); % First Signal
x2 = A2*sin(2*pi*f*t); % Second Signal
x3 = A3*sin(2*pi*f*t); % Third Signal
x = x1+x2+x3;
%Plotting both signals in time domain

plot(t,x,'b-*','LineWidth',1)
xlabel('time in seconds')
ylabel('Amplitude in volts')
title('Signals of different Frequencies')
legend('Signal x')