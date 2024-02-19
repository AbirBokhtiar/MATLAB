clc
clear all
close all
fs = 8e3; % Sampling frequency
t = 0:1/fs:1; % Time duration
f1 = 8; % Frequency of first signal
f2 =5; % Frequency of second signal
f3 =5; % Frequency of third signal
A1 = 3; % Amplitude of first signal
A2 = 5; % Amplitude of second signal
A3 = 10;
x1 = A1*sin(2*pi*f1*t); % First Signal
x2 = A2*sin(2*pi*f2*t); % Second Signal
x3 = A3*sin(2*pi*f3*t); % Third Signal
x = x1+x2+x3;
%Plotting both signals in time domain
subplot(211)
plot(t,x,'b-*','LineWidth',1)
xlabel('time in seconds')
ylabel('Amplitude in volts')
title('Signals of different Frequencies')
legend('Signal x')

subplot(212)
nx = length(t); % Total number of samples
%Take fourier transform
fx = fft(x); % Frequency analysis is done here
% Apply fftshift to put it in the form we are used to (see
% documentation)
fx = fftshift(fx)/(nx/2); % Axis correction and scaling are
% done here
% Next, calculate the frequency axis, which is defined by the
% sampling rate
f = linspace(-fs/2,fs/2,nx);
% fft function in Matlab returns complex numbers that has both
% frequency and phase information
% we will only plot absolute values of the
% fft transformed variables
% to see the frequency domain representations
bar(f, abs(fx),2,'k')
% 
axis([-50 50 0 25])
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain Representation of Different Signals');
legend('Signal x')