% HW3 : 使用3個檔案互相比對，找出lags，共3個圖
clear;clc;close all
load('h1');
load('olb');
load('mau');
%% xcorr(h1, olb)
figure
p_h1 = plot(h1,'k');hold on;p_olb = plot(olb,'b');hold on;p_mau = plot(mau,'r');
legend([p_h1,p_olb,p_mau],{'h1','olb','mau'},'Location','best');
title('data signal');xlabel('time');ylabel('data value');grid on;
%% xcorr(h1, olb)
comp1 = '(h1, olb)';
figure('Name',['signal ' comp1])
p_h1 = plot(h1,'k');hold on;p_olb = plot(olb,'b');
legend([p_h1,p_olb],{'h1','olb'},'Location','best');
title('data signal');xlabel('time');ylabel('data value');
[c,lags] = xcorr(h1,olb,1200,'coeff');
%%  xcorr(h1,olb)
% figure('Name',['signal xcorr (no detrend)' comp1])
% plot(lags,c); % 出現金字塔是錯的，需要去除trend (detrend)
%%  xcorr(h1,olb)
figure('Name',['signal xcorr (detrend)' comp1])
[c1,lags1] = xcorr(detrend(h1),detrend(olb),1200,'coeff');

plot(lags1,c1,'LineWidth',2);yline(0);xline(0);
% 如果lag > 0 ， 代表落後；如果lag < 0 ， 代表領先如果；lag = 0 ， 代表現在時刻
xlabel('time lag numbers (5 min)');ylabel('Correlation coefficient');
% axis([-100 100 0 1])
[max1_v,max1_loc] = max(c1);
max_lags_1 = lags1(max1_loc);
r_sq1 = max1_v^2;
grid on;
title({'Cross-correlation',comp1});

%% xcorr(h1, mau)
comp2 = '(h1, mau)';
figure('Name',['signal ' comp1])
p_h1 = plot(h1);hold on;p_mau = plot(mau);
legend([p_h1,p_mau],{'h1','mau'},'Location','best');
title('data signal');xlabel('time');ylabel('data value');
[c,lags] = xcorr(h1,mau,1200,'coeff');

%% xcorr(h1, mau)
% figure(5)
% plot(lags,c); % 出現金字塔是錯的，需要去除trend (detrend)
%% xcorr(h1, mau)
figure(6)
[c2,lags2] = xcorr(detrend(h1),detrend(mau),1200,'coeff');

plot(lags2,c2,'LineWidth',2);yline(0);xline(0);
xlabel('time lag numbers (5 min)');ylabel('Correlation coefficient');
% axis([-100 100 0 1])
[max2_v,max2_loc] = max(c2);
max_lags_2 = lags1(max2_loc);
r_sq2 = max2_v^2;
title({'Cross-correlation',comp2});
grid on;
%% xcorr(olb, mau)
comp3 = '(olb, mau)';
figure(7)
p_olb = plot(olb);hold on;p_mau = plot(mau);
legend([p_olb,p_mau],{'olb','mau'},'Location','best');
title('data signal');xlabel('time');ylabel('data value');
[c,lags] = xcorr(olb,mau,1200,'coeff');

%% xcorr(olb, mau)
% figure(8)
% plot(lags,c); % 出現金字塔是錯的，需要去除trend (detrend)
%% xcorr(olb, mau)
figure(9)
[c3,lags3] = xcorr(detrend(olb),detrend(mau),1200,'coeff');

plot(lags3,c3,'LineWidth',2);yline(0);xline(0);
xlabel('time lag numbers (5 min)');ylabel('Correlation coefficient');
% axis([-100 100 0 1])
[max3_v,max3_loc] = max(c3);
max_lags_3 = lags3(max3_loc);
r_sq3 = max3_v^2;
title({'Cross-correlation',comp3});grid on;