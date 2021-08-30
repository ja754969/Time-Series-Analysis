%% Time Series Week 15 2021/6/4
clear;clc;close all
t = 0:0.1:20;
y = 0;
for i = 0:10
    y = y + (cos(2*i+1)*t)/(2*i+1);
    figure
    plot(t,y)
    z = fft(y);
    figure
    plot(abs(z))
end
y = 0;

for i = 0:10
    y = y + cos((2*i+1)*t)/(2*i+1);
    figure
    plot(t,y)
    z = fft(y);
    figure
    plot(abs(z))
end