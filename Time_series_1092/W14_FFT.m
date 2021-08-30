%% 2021/5/28
clear;clc
% X(f) = integer x(t)*exp(-i*2*pi*f*t)df
x = [3 6 2 4];
X_solution = [];
for k = 1:length(x)
   X_temp = 0;
   for n = 1:length(x)
    X_temp = X_temp + x(n)*exp(-i*2*pi/4*(k-1)*(n-1)); 
   end
   X_solution(k) = X_temp;
end
X_solution
X_function = fft(x)
