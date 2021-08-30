% W5 : Autocorrelation
clear;clc;clf
load('h1');
% x = linspace(-4*pi,4*pi,8192);
% h = cos(x);
h = h1;
figure(1)
plot(h);
[c,lags] = xcorr(h,h,1200,'coeff');
figure(2)
plot(lags,c); % 出現金字塔是錯的，需要去除trend (detrend)
figure(3)
[c,lags] = xcorr(detrend(h),detrend(h),1200,'coeff');
plot(lags,c);
% axis([-100 100 0 1])

grid on;
%%
figure(4)
s1 = h(1:4000);
s2 = h(1+100:4000+100);
t = linspace(1,4000,4000)';
plot(t(1:500),s1(1:500),'b-');hold on;
plot(t(1:500),s2(1:500),'r:')
[c,lags] = xcorr(detrend(s1),detrend(s2),1200,'coeff');
figure(5)
plot(lags,c);
%%
x = 1:1:5;
y = [0.5 1.7 3.4 5.7 8.4];
lnx = log(x);
a1 = sum((lnx-sum(lnx)/5)*(y - sum(y)/5)')/...
    sum((lnx-sum(lnx)/5)*(lnx-sum(lnx)/5)');
a0 = sum(y)/5 - a1*sum(lnx)/5;
yk = a1*log(x) + a0;
figure(6)
plot(x,y,x,yk,'r-')
R_square = ((yk-sum(y)/5)*(yk-sum(y)/5)')/((y-sum(y)/5)*(y-sum(y)/5)');
