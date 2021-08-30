%% Week 14 2021/5/28
clear;clc
cd('E:\NTOU_109大暑計畫\Coding_109Summer')
load('y_for_FFT.txt');
load('xx.txt');
figure;plot(xx);
N = 24;
for k = 1:N/2
   sum_even = 0;
   for n = 1:N/2
       sum_even = sum_even + (y_for_FFT(n)+y_for_FFT(n+N/2))*exp(-i*2*pi/(N/2)*(k-1)*(n-1));    
   end
   xx_solution(k*2-1) = sum_even;
end
for k = 1:N/2
   sum_odd = 0;
   for n = 1:N/2
       sum_odd = sum_odd + (y_for_FFT(n) - y_for_FFT(n+N/2))*exp(-i*2*pi/(N/2)*(k-1)*(n-1))*exp(-i*2*pi/N*(n-1));    
   end
   xx_solution(k*2) = sum_odd;
end
% stem(abs(xx))
%% Week 15 2021/6/4 取樣做出power spectrum
sn = 2000;
xx_new = xx(1:sn);
figure;plot(xx_new);
y = fft(xx_new,sn);
y_period = y.*conj(y)/sn;
f = (0:sn-1)*288/sn;
figure;plot(f,y_period(1:sn));
figure
loglog(f,y_period(1:sn))
% axis([10^-1 10 10^-2 10^3]);
%% Week 15 2021/6/4 過濾高頻
tt = linspace(1,sn,sn);
y1 = y(1:50);
xx1 = ifft(y1,sn); 
figure
plot(tt,xx_new,'-k',tt,xx1,'--r')
y2 = y(1:10);
hold on;
xx2 = ifft(y2,sn);
plot(tt,xx_new,'-k',tt,xx2,'--b')
hold off;
figure
% [pxx,f_pxx] = pwelch(xx_new,sn,sn,sn,1);
[pxx,f_pxx, pxxc] = pwelch(xx_new,sn,100,sn,288,'ConfidenceLevel',0.95); % 100 點做一次平均，取樣頻率採288(一天測量288次)
% [pxx,f_pxx] = pwelch(xx_new,sn,100,sn,288); % 100 點做一次平均，取樣頻率採288(一天測量288次)
loglog(f_pxx,pxx);
hold on;
loglog(f_pxx,pxxc,':');
%% Week 15 2021/6/4 HW1 採樣 6980 點
sn = 6980; 
xx_new = xx(1:sn);
figure;plot(xx_new);
y = fft(xx_new,sn);
y_period = y.*conj(y)/sn;
f = (0:sn-1)*288/sn;
figure;plot(f,y_period(1:sn));
figure
loglog(f,y_period(1:sn))
title('Power Spectrum (FFT)');
xlabel('frequency (cycle per day)');
ylabel('Estimated spectral density (^{\circ}C)^2 /cpd');
grid on;
%axis([10^-1 10 10^-2 10^3]);
%% Week 15 2021/6/4 HW2 過濾高頻
tt = linspace(1,sn,sn);
y1 = y(1:30);
xx1 = ifft(y1,sn); 
figure
p1 = plot(tt,xx_new,'-k')
hold on;
p2 = plot(tt,xx1,'--r')
y2 = y(1:15);
hold on;
xx2 = ifft(y2,sn);
p3 = plot(tt,xx2,'--b')
hold off;
grid on;
title('freqency filter')
xlabel('time (per 5 minutes)')
ylabel('^{\circ}C')
legend([p1,p2,p3],{'original','first 30','first 15'},'Location','best');
figure
[pxx,f_pxx] = pwelch(xx_new,sn,100,sn,288); % 100 點做一次平均，取樣頻率採288(一天測量288次)
loglog(f_pxx,pxx);grid on;
title('Power Spectrum (pwelch)');
xlabel('frequency (cycle per day)');
ylabel('Estimated spectral density (^{\circ}C)^2 /cpd');