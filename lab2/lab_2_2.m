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

xmax=max(x);
xmin=min(x);
L=4;
step= (xmax-xmin)/(L-1);
partition = [(xmin+step/2):step:(xmax-step/2)];
codebook=[xmin:step:xmax];

[index,quants] = quantiz(x,partition,codebook); % Quantize.
figure
plot(t,x,'x',t,quants)
legend('Original signal','Quantized signal');