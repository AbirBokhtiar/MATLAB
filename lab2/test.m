clc
clear all
close all
fs = 5000; % Sampling frequency
t = 0:1/fs:2; % Time duration
f1 = 12; % Frequency of first signal
f2 = 6; % Frequency of second signal
A1 = 2; % Amplitude of first signal
A2 = 3; % Amplitude of second signal
x1 = A1*sin(2*pi*f1*t); % First Signal
x2 = A2*sin(2*pi*f2*t); % Second Signal
nx = length(t); % Total number of samples
%Take fourier transform
fx1 = fft(x1); % Frequency analysis is done here
fx2 = fft(x2);
% Apply fftshift to put it in the form we are used to (see
% documentation)
fx1 = fftshift(fx1)/(nx/2); % Axis correction and scaling are
% done here
fx2 = fftshift(fx2)/(nx/2);
% Next, calculate the frequency axis, which is defined by the
% sampling rate
f = linspace(-fs/2,fs/2,nx);
% fft function in Matlab returns complex numbers that has both
% frequency and phase information
% we will only plot absolute values of the
% fft transformed variables
% to see the frequency domain representations
bar(f, abs(fx1),2,'k')
hold on
bar(f, abs(fx2),2,'r')
hold off
axis([-50 50 0 4])
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain Representation of Different Signals');
legend('Signal x1','Signal x2')