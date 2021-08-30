clear;clc;clf
load('xx.txt')
% x1 = xx(1:1000);
x1 = xx(3501:4500);
figure(1)
t = linspace(1,length(x1),length(x1));
plot(x1)
delta_t = 5*60; % 5分鐘
fn = 1/(2*delta_t);

figure(2)
hour_group = [6 12 16 25];
p1 = plot(t,x1,'LineWidth',1.5,'Color',[0.5 0.5 0.5]);
for i = 1:length(hour_group)
    hold on;
    fB = 1/(hour_group(i)*3600)/fn; 
    [B,A] = butter(4,fB);
    xx1 = filtfilt(B,A,x1);
    
    p_filt{i} = plot(t,xx1)
end
xlabel('time');ylabel('data value');grid on;
legend([p1,p_filt{1},p_filt{2},p_filt{3},p_filt{4}],...
    {'original data','filter : 6 hrs','filter : 12 hrs','filter : 16 hrs','filter : 25 hrs'},...
    'Location','bestoutside')
%% 過濾 6 12 16 25 小時 (HW:1)
fB = 1/(6*3600)/fn; % 6 小時
[B,A] = butter(4,fB);
xx1 = filtfilt(B,A,x1);
t = linspace(1,length(x1),length(x1));
figure(2)
plot(t,x1,t,xx1,'-r')
%% 過濾 12 小時 (HW:2)
fB = 1/(13*3600)/fn; % 13 小時
[B,A] = butter(4,fB);
xx1 = filtfilt(B,A,x1);
t = linspace(1,length(x1),length(x1));
figure(3)
plot(t,x1,t,xx1,'-r')
%% 過濾 30 小時 (HW:3)
fB = 1/(30*3600)/fn; % 30 小時
[B,A] = butter(4,fB);
xx2 = filtfilt(B,A,x1);
t = linspace(1,length(x1),length(x1));
figure(4)
plot(t,x1,t,xx1,'-r',t,xx2,'b')
%% 過濾 25 小時 (HW:4)
fB = 1/(25*3600)/fn; % 30 小時
[B,A] = butter(4,fB);
xx2 = filtfilt(B,A,x1);
t = linspace(1,length(x1),length(x1));
figure(4)
plot(t,x1,t,xx1,'-r',t,xx2,'b')
% %% 過濾 6 小時 (第7001到8000筆資料)
% fB = 1/(6*3600)/fn; % 6 小時
% [B,A] = butter(4,fB);
% xx1 = filtfilt(B,A,x1);
% t = linspace(1,length(x1),length(x1));
% figure(2)
% plot(t,x1,t,xx1,'-r')
% %% 過濾 13 小時 (第1到1000筆資料)
% fB = 1/(13*3600)/fn; % 13 小時
% [B,A] = butter(4,fB);
% xx1 = filtfilt(B,A,x1);
% t = linspace(1,length(x1),length(x1));
% figure(3)
% plot(t,x1,t,xx1,'-r')
% %% 過濾 30 小時 (第1到1000筆資料)
% fB = 1/(30*3600)/fn; % 30 小時
% [B,A] = butter(4,fB);
% xx2 = filtfilt(B,A,x1);
% t = linspace(1,length(x1),length(x1));
% figure(4)
% plot(t,x1,t,xx1,'-r',t,xx2,'b')


