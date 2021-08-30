%% FFT fit
clear;clc;
close all
load('y1.txt');
%% resampling
y1_new = [];
kk = 1;
for i = 1:length(y1)
   if i/12-fix(i/12)==0
      y1_new(kk) = y1(i);
      kk = kk+1;
   end
end
y1 = y1_new;
%% Table 5.8 W10_class.png
SLH = y1;
sum(SLH)
N = length(SLH);
alpha0 = sum(SLH);
T1 = 24.91;
T2 = 12.42;
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
plot(n_least_sq,SLH_fit,'-r','DisplayName','Fitted SLH');grid on;
xlabel('Time (hours)');ylabel('sea level (cm)')
legend('Location','best');
print('W10_class.png','-dpng');