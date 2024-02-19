clc
close all
fs = 8e3; % Sampling frequency
f1 = 8; % Frequency of first signal
f2 =5; % Frequency of second signal
f3 =5; % Frequency of third signal
A1 = 3; % Amplitude of first signal
A2 = 5; % Amplitude of second signal
A3 = 10;
x1 = A1*sin(2*pi*f1*t); % First Signal
x2 = A2*sin(2*pi*f2*t); % Second Signal
x3 = A3*sin(2*pi*f3*t); % Third Signal
%x = x1+x2+x3;

f = 5;% frequency of the signal
t = 0:1/fs:1/f;%discrete time
A = 2;
x = A*sin(2*pi*f*t);% discrete signal
%--------Quantization------------%
n = 3;
L =(2^n);
delta=(max(x)-min(x))/(L-1);
xq = min(x)+(round((x-min(x))/delta)).*delta;
%--------END------------%
plot(t,x,'r-.', 'linewidth',1.5);
hold on;
plot(t,xq,'k-.', 'linewidth',1.5);
%plotting wave forms.
xlabel('time')
ylabel('amplitude')
title('example of manual quantization')
legend('Original signal','quantized signal')