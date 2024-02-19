clc
clear all
close all

%ID: 22-46280-1

a=2
b=2
c=4
d=6
e=2
f=8
g=0
h=1

k1=a+b
k2=g+h+2
j1=deg2rad(g+d+20)
j2=deg2rad(30)
ff=e+f+5

T=(1/ff)
time=0:(T/100):3*T
x1=k1*cos(2*pi*ff)*time+j1
plot=(time,x1,'r--o')
xlabel('time')
ylabel('x1')
title('time/x1')



