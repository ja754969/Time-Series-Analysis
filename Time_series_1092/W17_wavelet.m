clear;clc;clf
load('xx.txt')
% x1 = xx(1:6098);
x1 = xx(1:end);
figure(1)
plot(x1)
% 一天有 288 筆資料
w = wt2(x1,5.5,50,4000,100);
wx = linspace(1,length(x1)/288,size(w,2)); % 12 天相當於 288 小時
% 總共 length(x1)/288 天
wy = linspace(288/50,288/4000,size(w,1))';
figure(2)
img(wx,wy,flipud(w));
ylabel('Frequncy (cycle/day)')
xlabel('numbers of day')
title('wavelet frequency')
colormap('jet');
c = colorbar;
c.Label.String = 'power';
%%
figure(3)
ws = sum(rot90(w));
loglog(wy,fliplr(ws));
xlabel('Frequncy (cycle/day)')
ylabel('Estimated spectrum')
title('wavelet power spectrum')
%%
figure(4)
% [p,ff] = psd(detrend(x1),length(x1),100,hanning(length(x1)));
[p,ff] = pwelch(detrend(x1),length(x1),100,length(x1),288);
loglog(wy,fliplr(ws),'g',ff,p,'b');
ylabel('power [log scale]')
xlabel('frequncy [log scale]')
title('power spectrum');grid on;