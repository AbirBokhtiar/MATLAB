% Generate a composite signal using three simple signals as,
% x1 = a1*cos(2*pi*f1*t), x2 = a2*sin(2*pi*f2*t), x3 = a3*cos(2*pi*f3*t)
% signal_x = x1 + x2 + x3
% Select the values of the amplitude and frequency as follows: a1 = G + 1, a2 = F + 2, a3 = E + 3,
% f1 = E + 1, f2 = F + 2, f3 = G + 3.
% (a) Show time domain and frequency domain representations of signal_x in a single figure
% window using subplot. Use axis, or xlim, or ylim to appropriately represent the signal.
% (b) Quantize signal_x in 4 equally distributed levels and provide image for one cycle of the
% original signal and quantized signal. Use axis, or xlim, or ylim to appropriately represent the
% signal. [Use quantiz() function]
% (c) Quantize signal_x in 8 equally distributed levels and provide image for one cycle of the
% original signal and quantized signal. Use axis, or xlim, or ylim to appropriately represent the
% signal. [Do not use quantiz() function]

%Quantized Signal
subplot(2,1,1)
a1 = 9, a2 = 5, a3 = 3, f1 = 1, f2 = 5, f3 = 11
fs = 50e3
t = 0:1/fs:1/f1
x1 = a1*cos(2*pi*f1*t), x2 = a2*sin(2*pi*f2*t), x3 = a3*cos(2*pi*f3*t)
signal_x = x1 + x2 + x3
L = 2
n = log2(L)
delta = (max(signal_x)-min(signal_x))/(L-1)
sigQ = min(signal_x) + (round(signal_x - min(signal_x))/delta).*delta
plot(t,sigQ,'r-.', 'linewidth',1.5);

%Using quantiz function
subplot(2,1,2)
partition = -1.5:1.5
codebook = -2:2
[index,quants] = quantiz(signal_x,partition,codebook)
plot(t,signal_x,'x',t,quants,'-')
legend('Original signal','Quantized signal');

