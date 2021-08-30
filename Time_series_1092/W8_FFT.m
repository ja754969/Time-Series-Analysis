%% FFT fit
clear;clc;close all
figure
SST = [7.6 7.4 8.2 9.2 10.2 11.5 12.4 13.4 13.7 11.8 10.1 9,...
    8.9 9.5 10.6 11.4 12.9 12.7 13.9 14.2 13.5 11.4 10.9 8.1];
plot(SST)
n_SST = 1:24;
for p = 1:12
   A_p(p) = 2/length(n_SST)*SST*cos(2*pi*p*n_SST/length(n_SST))';
   B_p(p) = 2/length(n_SST)*SST*sin(2*pi*p*n_SST/length(n_SST))';
%    A_0(p) = 2/length(n)*SST(p);
   
end
p = 1:12;
A_0 = sum(SST)/24;
for n = 1:24
   SST_fit(n) = A_0 + A_p*cos(2*pi*p*n/length(n_SST))'+ B_p*sin(2*pi*p*n/length(n_SST))';
   
end
figure
plot(n_SST,SST,'DisplayName','SST observed')
hold on;
plot(n_SST,SST_fit,'--r','DisplayName','SST FFT Fit');grid on;
xlabel('Time (months)');ylabel('SST (^\circC)')
legend('Location','best');
%%
sum(SST)
T1 = 12;
T2 = 6;
alpha1 = 1/12*24;
alpha2 = 1/6*24;
n_least_sq = 1:24;
cc11 = cos(2*pi*alpha1*n_least_sq/24)*cos(2*pi*alpha1*n_least_sq/24)';
d = [24,zeros(1,4);0,12,zeros(1,3);zeros(1,2),12,zeros(1,2);zeros(1,3),12,0;zeros(1,4),12];
yc = [262.7 -21.30 -5.30 -23.87 -0.69];
yc = yc';
z = d\yc;
y2 = z(1) + z(2)*cos(2*pi*1/12*n_least_sq) + z(3)*cos(2*pi*1/6*n_least_sq) +...
    z(4)*sin(2*pi*1/12*n_least_sq) + z(5)*sin(2*pi*1/6*n_least_sq);
figure
plot(n_least_sq,SST,n_least_sq,y2,':r')
%% FFT fit (first 3 component)
n_ = 1:24;
A_p = [A_p(1:3) zeros(1,9)];
B_p = [B_p(1:3) zeros(1,9)];

p = 1:12;
A_0 = sum(SST)/24;
for n = 1:24
   SST_fit(n) = A_0 + A_p*cos(2*pi*p*n/length(n_SST))'+ B_p*sin(2*pi*p*n/length(n_SST))';
   
end
figure
plot(n_SST,SST,'DisplayName','SST observed')
hold on;
plot(n_SST,SST_fit,'--r','DisplayName','SST FFT Fit');grid on;
legend('Location','best');
%% Table 5.8 W8_hw6.png
SLH = [1.97 1.46 0.98 0.73 0.67 0.82 1.15 1.58 2.00 2.33 2.48 2.43 2.25 2.02 1.82 1.72 ...
    1.75 1.91 2.22 2.54 2.87 3.10 3.15 2.94 2.57 2.06 1.56 1.13 0.84 0.73 0.79 1.07];
% SLH = [SLH SLH SLH SLH SLH SLH SLH SLH SLH SLH SLH SLH SLH SLH SLH];
sum(SLH)
N = length(SLH);
T1 = 24;
T2 = 12;
alpha0 = sum(SLH);
alpha1 = 1/T1*N;
alpha2 = 1/T2*N;
n_least_sq = 1:N;
c1 = sum(cos(2*pi*alpha1*n_least_sq/N));
c2 = sum(cos(2*pi*alpha2*n_least_sq/N));
s1 = sum(sin(2*pi*alpha1*n_least_sq/N));
s2 = sum(sin(2*pi*alpha2*n_least_sq/N));
cc11 = cos(2*pi*alpha1*n_least_sq/N)*cos(2*pi*alpha1*n_least_sq/N)';
cc22 = cos(2*pi*alpha2*n_least_sq/N)*cos(2*pi*alpha2*n_least_sq/N)';
ss11 = sin(2*pi*alpha1*n_least_sq/N)*sin(2*pi*alpha1*n_least_sq/N)';
ss22 = sin(2*pi*alpha2*n_least_sq/N)*sin(2*pi*alpha2*n_least_sq/N)';
cc12 = cos(2*pi*alpha1*n_least_sq/N)*cos(2*pi*alpha2*n_least_sq/N)';
cs11 = cos(2*pi*alpha1*n_least_sq/N)*sin(2*pi*alpha1*n_least_sq/N)';
cs12 = cos(2*pi*alpha1*n_least_sq/N)*sin(2*pi*alpha2*n_least_sq/N)';
cs21 = cos(2*pi*alpha2*n_least_sq/N)*sin(2*pi*alpha1*n_least_sq/N)';
cs22 = cos(2*pi*alpha2*n_least_sq/N)*sin(2*pi*alpha2*n_least_sq/N)';
ss12 = sin(2*pi*alpha1*n_least_sq/N)*sin(2*pi*alpha2*n_least_sq/N)';
cc21 = cos(2*pi*alpha2*n_least_sq/N)*cos(2*pi*alpha1*n_least_sq/N)';
sc11 = sin(2*pi*alpha1*n_least_sq/N)*cos(2*pi*alpha1*n_least_sq/N)';
sc21 = sin(2*pi*alpha2*n_least_sq/N)*cos(2*pi*alpha1*n_least_sq/N)';
sc12 = sin(2*pi*alpha1*n_least_sq/N)*cos(2*pi*alpha2*n_least_sq/N)';
sc22 = sin(2*pi*alpha2*n_least_sq/N)*cos(2*pi*alpha2*n_least_sq/N)';
ss21 = sin(2*pi*alpha2*n_least_sq/N)*sin(2*pi*alpha1*n_least_sq/N)';
d = [length(n_least_sq),c1,c2,s1,s2;...
    c1,cc11,cc12,cs11,cs12;...
    c2,cc21,cc22,cs21,cs22;...
    s1,sc11,sc12,ss11,ss12;...
    s2,sc21,sc22,ss21,ss22];
yc0 = sum(SLH);
yc1 = SLH*cos(2*pi*alpha1*n_least_sq/N)';
yc2 = SLH*cos(2*pi*alpha2*n_least_sq/N)';
ys1 = SLH*sin(2*pi*alpha1*n_least_sq/N)';
ys2 = SLH*sin(2*pi*alpha2*n_least_sq/N)';
yc = [yc0 yc1 yc2 ys1 ys2];
yc = yc';
z = d\yc;
SLH_fit = z(1)+z(2)*cos(2*pi*1/T1*n_least_sq)+z(3)*cos(2*pi*1/T2*n_least_sq)+z(4)*sin(2*pi*1/T1*n_least_sq)+z(5)*sin(2*pi*1/T2*n_least_sq);
figure
plot(n_least_sq,SLH,'-b','DisplayName','SLH');hold on;
plot(n_least_sq,SLH_fit,'--r','DisplayName','Fitted SLH');grid on;
xlabel('Time (hours)');ylabel('SLH (m)')
legend('Location','best');
print('W8_hw6.png','-dpng');