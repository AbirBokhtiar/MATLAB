% AMI
% 22-47038-1
% AB-CDEFG-H
clc 
clear all 
close all 
bit_stream = [0 0 0 0 0 0 1 1 1 0 0 0]; 
no_bits = length(bit_stream); 
bit_rate = 5000; % 5 kbps 
pulse_per_bit = 1; % for AMI
pulse_duration = 1/((pulse_per_bit)*(bit_rate)); 
no_pulses = no_bits*pulse_per_bit; 
samples_per_pulse = 500; 
fs = (samples_per_pulse)/(pulse_duration); %sampling frequency 
% including pulse duration in sampling frequency 
% ensures having enough samples in each pulse  
t = 0:1/fs:(no_pulses)*(pulse_duration); % sampling interval 
% total duration = (no_pulse)*(pulse_duration) 
no_samples = length(t); % total number of samples 
dig_sig = zeros(1,no_samples); 
max_voltage = 5; 
min_voltage = 0; 
sign = 1;
for i = 1:no_bits 
    if bit_stream(i) == 1
        dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = sign*max_voltage*ones(1,samples_per_pulse);
        sign = (-1)*sign;
    else 
        dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = min_voltage*ones(1,samples_per_pulse); 
    end 
end 
plot(t,dig_sig,'linewidth',1.5) 
grid on 
xlabel('time in seconds') 
ylabel('Voltage') 
title(['AMI for ',num2str(bit_stream),''])