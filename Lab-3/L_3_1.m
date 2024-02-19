    %Student Id: 21-45934-3

clc
clear all
close all
    A=2;
    B=1;
    C=4;
    D=5;
    E=9;
    F=3;
    G=4;
    H=3;
A1 = (A+B+H);
A2 = (B+C+H);
s = (C+D+H)/30;
fs = 8000; 
t = 0:1/fs:1-1/fs;
cx = A1*sin(2*pi*((C+D+H)*100)*t ) + A2*cos(2*pi*((D+E+H)*100)*t) + s*randn(size(t));

signal = A1*sin(2*pi*((C+D+H)*100)*t ) + A2*cos(2*pi*((D+E+H)*100)*t);
noise=s*randn(size(t));

     % Answer-1
plot(t,signal,'r--')
hold on
axis([0 0.01 -20 20])
xlabel('time')
ylabel('signal')
title('time/signal')

        % Answer-2 
noisySignal = cx;
SNR_DB = snr(noisySignal);
SNR= 10.^(SNR_DB/10);

      % Answer-3
bandwidth = obw(cx,fs);
C = bandwidth*log2(1+SNR);

      % Answer-4
N = C * 0.8;
L= ceil(2^(N/(2*bandwidth)))

plot(t,noise,'k--')
axis([0 0.01 -20 20])
xlabel('time')
ylabel('noisy')
title('time/NoisySignal')
