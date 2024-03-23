% x1(t) = K1*cos(2π(E+F+5)t + J1), x2(t) = K2*cos(2π(C+D+5)t + J2)
% The value of the amplitudes are as follows: let K1 = 4 and K2 = 11. For the phases, use
% J1 = 35 (in degrees), and take J2 = 30º. When doing computations in Matlab, make
% sure to convert degrees to radians.
% (a) Make a plot of both signals on two separate figure windows, over a range of ‘t’ that will
% exhibit approximately 3 cycles. Make sure that you have enough samples per period of the wave
% to have a smooth signal in figure.
% (b) Create a third sinusoid as the sum: x3(t) = x1(t) + x2(t). In Matlab this amounts to summing
% the vectors that hold the samples of each sinusoid. Make a plot of x3(t) over the same range of
% time as used in the previous two plots.
% (c) Use subplot (3,1,1), subplot (3,1,2), and subplot (3,1,3) to make a three-panel subplot that
% puts all of three signals (x1(t), x2(t), and x3(t)) on the same window. See help subplot.

clc
clear all
close all
A=2,B=2,C=4,D=7,E=0,F=3,G=8,H=1
K1 = 4
K2 = 11
J1 = deg2rad(35)
J2 = deg2rad(30)
freq1 = E+F+5
freq2 = C+D+5
T = 1/freq1
time = 0:T/100:T*6
x1 = K1*cos(2*pi*freq1*time + J1)
subplot(3,1,1)
plot(time,x1,'r--')
axis([0 0.5 -5 5])
xlabel('time')
ylabel('x1')
title('time/x1')
%figure
subplot(3,1,2)
x2 = K2*cos(2*pi*freq2*time + J2)
plot(time,x2,'b--')
axis([0 0.5 -10 10])
xlabel('time')
ylabel('x2')
title('time/x2')
%figure
subplot(3,1,3)
x3 = x1 + x2
plot(time,x3,'g--')
axis([0 0.5 -15 15])
xlabel('time')
ylabel('x3')
title('time/x3')
