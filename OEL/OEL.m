%Signal 1
clc;
clear all;
close all;
f=5;
x1=[1 1 0 0 1 0 1 0] % input signal ;
x2=[1 0 0 0 1 0 0 0] % input signal ;
x3=[1 1 0 1 1 0 0 1] % input signal ;
nx1=size(x1,2);
nx2=size(x2,2);
nx3=size(x3,2);
total_Ask1 = [];
total_Ask2 = [];
total_Ask3 = [];
ask1 = 0;
ask2 = 0;
ask3 = 0;
%first signal
i=1;
while i<nx1+1
 t = i:0.001:i+1;
 
 if x1(i)==1
 ask1=sin(2*pi*f*t);
 
 else
 ask1= zeros(size(t));
 end
 total_Ask1 = [total_Ask1 ask1];
 subplot(3,1,1);
 plot(t,ask1);
 hold on;
 grid on;
 axis([1 9 -1 1]);
 title('Signal-1 ASK for [1 1 0 0 1 0 1 0]')
 i=i+1;
end


%second signal
i=1;
while i<nx2+1
 t = i:0.001:i+1;
 
 if x2(i)==1
 ask2=sin(2*pi*f*t);
 
 else
 ask2 = zeros(size(t));
 end
 total_Ask2 = [total_Ask2 ask2];
 subplot(3,1,2);
 plot(t,ask2);
 hold on;
 grid on;
 axis([1 9 -1 1]);
 title('Signal-1 ASK for [1 0 0 0 1 0 0 0]')
 i=i+1;
end


%third signal
i=1;
while i<nx3+1
 t = i:0.001:i+1;
 
 if x3(i)==1
 ask3=sin(2*pi*f*t);
 
 else
 ask3 = zeros(size(t));
 end
 total_Ask3 = [total_Ask3 ask3];
 subplot(3,1,3);
 plot(t,ask3);
 hold on;
 grid on;
 axis([1 9 -1 1]);
 title('Signal-1 ASK for [1 1 0 1 1 0 0 1]')
 i=i+1;
end

m1 = total_Ask1;
m2 = total_Ask2;
m3 = total_Ask3;

fs = 1000; %Sampling Frequency
%%
%% Carrier Signal Generation
t1 = linspace(0, nx1, length(total_Ask1));
Cm1 = 1; %Amplitude of First Carrier Signal
fc1 = 100; %Frequency of First Carrier Signal
c1 = Cm1*cos(2*pi*fc1*t1); % First Carrier Signal
t2 = linspace(0, nx2, length(total_Ask2));
Cm2 = 1; %Amplitude of Second Carrier Signal
fc2 = 170; %Frequency of Second Carrier Signal
c2 = Cm2*cos(2*pi*fc2*t2); % Second Carrier Signal
t3 = linspace(0, nx3, length(total_Ask3));
Cm3 = 1; %Amplitude of Third Carrier Signal
fc3 = 250; %Frequency of Third Carrier Signal
c3 = Cm3*cos(2*pi*fc3*t3); % Third Carrier Signal

figure
subplot(3,1,1);
plot(t1,c1);
hold on;
grid on;
axis([-0 1 -1 1]);
title('First Carrier Signal')
 
subplot(3,1,2);
plot(t2,c2);
hold on;
grid on;
axis([-0 1 -1 1]);
title('Second Carrier Signal')
 
subplot(3,1,3);
plot(t3,c3);
hold on;
grid on;
axis([-0 1 -1 1]);
title('Third  Carrier Signal')

%% Composite Signal Generation
x = (m1).*c1+(m2).*c2+(m3).*c3;

%%%% Plotting the Signals in Time-Domain and Frequency-Domain
figure
subplot(3,1,1)
plot(t1,m1)
xlabel('time')
ylabel('amplitude')
title('Message Signal 1 in Time Domain')
%ylim([-Am1 Am1])
subplot(3,1,2)
plot(t2,m2)
xlabel('time')
ylabel('amplitude')
title('Message Signal 2 in Time Domain')
%ylim([-Am2 Am2])
subplot(3,1,3)
plot(t3,m3)
xlabel('time')
ylabel('amplitude')
title('Message Signal 3 in Time Domain')
%ylim([-Am3 Am3])
M1 = abs(fftshift(fft(m1)))/(fs/2); %Fourier Transformation of m1
M2 = abs(fftshift(fft(m2)))/(fs/2); %Fourier Transformation of m2
M3 = abs(fftshift(fft(m3)))/(fs/2); %Fourier Transformation of m3
X = abs(fftshift(fft(x)))/(fs/2); %Fourier Transformation of x
% Calculate the length of the Fourier-transformed signals
N = length(M3); % Assuming M1, M2, and M3 have the same length
% Generate the frequency vector based on the length of the signals
f2 = fs/2*linspace(-1, 1, N);
figure
subplot(3,1,1)
stem(f2,M1)
xlabel('frequency')
ylabel('amplitude')
title('Message Signal 1 in Frequency Domain')
xlim([-270 270])
subplot(3,1,2)
stem(f2,M2)
xlabel('frequency')
ylabel('amplitude')
title('Message Signal 2 in Frequency Domain')
xlim([-270 270])
subplot(3,1,3)
stem(f2,M3)
xlabel('frequency')
ylabel('amplitude')
title('Message Signal 3 in Frequency Domain')
xlim([-270 270])
figure
subplot(2,1,1)
plot(t1,x)
xlabel('time')
ylabel('amplitude')
title('Composite Signal in Time Domain')
subplot(2,1,2)
stem(f2,X)
xlabel('frequency')
ylabel('amplitude')
title('Composite Signal in Frequency Domain')

%%SNR
figure
Rec1 = awgn(total_Ask1, 10);
subplot(3,1,1);
plot(t1, Rec1);
axis([0 1*length(x1) -2 2]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Demultiplexed ASK - 1 Signal');

Rec2 = awgn(total_Ask2, 10);
subplot(3,1,2);
plot(t1, Rec2);
axis([0 1*length(x2) -2 2]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Demultiplexed ASK - 2 Signal');

Rec3 = awgn(total_Ask3, 10);
subplot(3,1,3);
plot(t1, Rec3);
axis([0 1*length(x3) -2 2]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Demultiplexed ASK - 3 Signal');

%% Passing the Composite Signal Through Bandpass Filter
[num1, den1] = butter(5, [(fc1-f-6)/(fs/2),(fc1+f+6)/(fs/2)]);
%Butterworth Filter Window Determining for Bandpass Filter
bpf1 = filter(num1,den1,x); %Filtering is done here
[num2, den2] = butter(5, [(fc2-f-6)/(fs/2),(fc2+f+6)/(fs/2)]);
%Butterworth Filter Window Determining for Bandpass Filter
bpf2 = filter(num2,den2,x); %Filtering is done here
[num3, den3] = butter(5, [(fc3-f-6)/(fs/2),(fc3+f+6)/(fs/2)]);
%Butterworth Filter Window Determining for Bandpass Filter
bpf3 = filter(num3,den3,x); %Filtering is done here

%% Mixing
z1 = 2*bpf1.*c1;
z2 = 2*bpf2.*c2;
z3 = 2*bpf3.*c3;


%% Passing the Mixed Signals Through Lowpass Filter
[num4, den4] = butter(5, (f+3)/(fs/2)); %Low pass filter ismade here
rec1 = filter(num4,den4,z1); %Filtering is done here
[num5, den5] = butter(5, (f+3)/(fs/2)); %Low pass filter ismade here
rec2 = filter(num5,den5,z2); %Filtering is done here
[num6, den6] = butter(5, (f+3)/(fs/2)); %Low pass filter is made here
rec3 = filter(num6,den6,z3); %Filtering is done here
%% Plotting the Received Signals in Time-Domain and Frequency Domain
figure
subplot(3,1,1)
plot(t1,rec1)
xlabel('time')
ylabel('amplitude')
title('received signal 1 in time domain')
%ylim([-Am1 Am1])
subplot(3,1,2)
plot(t2,rec2)
xlabel('time')
ylabel('amplitude')
title('received signal 2 in time domain')
%ylim([-Am2 Am2])
subplot(3,1,3)
plot(t3,rec3)
xlabel('time')
ylabel('amplitude')
title('received signal 3 in time domain')
%ylim([-Am3 Am3])
R1 = abs(fftshift(fft(rec1)))/(fs/2); %Fourier Transformation isdone here
R2 = abs(fftshift(fft(rec2)))/(fs/2); %Fourier Transformation isdone here
R3 = abs(fftshift(fft(rec3)))/(fs/2); %Fourier Transformation isdone here
figure
subplot(3,1,1)
stem(f2,R1)
xlabel('frequency')
ylabel('amplitude')
title('received signal 1 in frequency domain')
xlim([-270 270])
subplot(3,1,2)
stem(f2,R2)
xlabel('frequency')
ylabel('amplitude')
title('received signal 2 in frequency domain')
xlim([-270 270])
subplot(3,1,3)
stem(f2,R3)
xlabel('frequency')
ylabel('amplitude')
title('received signal 3 in frequency domain')
xlim([-270 270])


%Analog to Digital Conversion

% Levels for Quantization
L = 8;

samp_sig = Rec1;
samp_sig1 = Rec2;
samp_sig2 = Rec3;
% Quantizing
delta = (max(samp_sig) - min(samp_sig)) / (L-1); % step size
quant_sig = min(samp_sig) + round((samp_sig - min(samp_sig)) / delta)* delta; % quantized signal 
delta1 = (max(samp_sig1) - min(samp_sig1)) / (L-1); % step size
quant_sig1 = min(samp_sig1) + round((samp_sig1 - min(samp_sig1)) / delta1)* delta1;
delta2 = (max(samp_sig2) - min(samp_sig2)) / (L-1); % step size
quant_sig2 = min(samp_sig2) + round((samp_sig2 - min(samp_sig2)) / delta2)* delta2;



