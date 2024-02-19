%ID: 22-46280-1
clc
clear all
close all

a=2;
b=2;
c=4;
d=6;
e=2;
f=8;
g=0;
h=1;

k1=a+b;
k2=g+h+2;
j1=deg2rad(g+d+20);
j2=deg2rad(30);
ff=e+f+5;

T=(1/ff);
time=0:(T/100):3*T;
x1=k1*cos(2*pi*ff*time+j1);
plot(time,x1,'r--')
axis([0 0.1 -5 5])
xlabel('time')
ylabel('x1')
title('time/x1')

figure
x2=k2*cos(2*pi*ff*time+j2);
plot(time,x2,'m--')
axis([0 0.1 -5 5])
xlabel('time')
ylabel('x2')
title('time/x2')


figure
%task-2

x3=x1+x2;
plot(time,x3,'k--')
axis([0 0.1 -10 10])
xlabel('time')
ylabel('x3')
title('x3=x1+x2')

%task-3
figure

subplot(311)
plot(time,x1,'r--')
axis([0 0.1 -5 5])
xlabel('time')
ylabel('x1')
title('time/x1')

subplot(312)
plot(time,x2,'m--')
axis([0 0.1 -5 5])
xlabel('time')
ylabel('x2')
title('time/x2')

subplot(313)
plot(time,x3,'k--')
axis([0 0.1 -10 10])
xlabel('time')
ylabel('x3')
title('x3=x1+x2')


