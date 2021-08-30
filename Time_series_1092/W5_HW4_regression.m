% 4個回歸方法 使用lin_reg1.txt，共4張圖
%% test
clear;clc;close all;
x = linspace(1,5,1000);
c = 1.5;b = 0.5;
y = c*exp(b*x) + rand(1,1000);
figure('Name','test : y = ce^(bx) {lin_reg1.txt}');
% subplot(6,2,[1 4])
scatter(x,y,'.');xlabel('x');ylabel('y');

lny = log(y);
[a_lin_reg1,b_lin_reg1,corrcoef_lin_reg_1] = my_regression(x,lny);
figure('Name','test : y = ce^(bx) {lin_reg1.txt}');
% subplot(6,2,[5 8])
scatter(x,lny,'.');hold on;plot(x,a_lin_reg1+b_lin_reg1*x,'k');
xlabel('x');ylabel('lny');

c_new = exp(a_lin_reg1);b_new = b_lin_reg1;
y_new = c_new*exp(b_new*x);
figure('Name','test : y = ce^(bx) {lin_reg1.txt}');
% subplot(6,2,[9 12])
scatter(x,y,'.');hold on;plot(x,y_new,'k');
xlabel('x');ylabel('y');
%%
clear;clc;close all
load('lin_reg1.txt')
lny = log(lin_reg1);
x = 1:length(lin_reg1);
lnx = log(x);
[a_xlny,b_xlny,corrcoef_xlny] = my_regression(x,lny);
[a_xy,b_xy,corrcoef_xy] = my_regression(x,lin_reg1);
b_xlny = b_xlny;c_xlny = exp(a_xlny);
%% y = ce^(bx)
figure('Name','y = ce^(bx) {lin_reg1.txt}')

s_xlny = scatter(x,lny,'.k');hold on;
y_xlny = b_xlny*x + log(c_xlny);
p_xlny = plot(x,y_xlny,'-b');hold on;
title({['lny = lnc + bx'],['ln(y) = ' num2str(log(c_xlny)) ' + ' num2str(b_xlny) ' x'],...
    ['R^2 = ' num2str(corrcoef_xlny(1,end).^2) ', r = ' num2str(corrcoef_xlny(1,end))]});
ylabel('lny');xlabel('x');grid on;
print('W5_exp_reg','-dpng')
figure('Name','y = ce^(bx) {lin_reg1.txt}')
y_new = c_xlny.*exp(1).^(b_xlny.*x);
plot(x,y_new);hold on;
s = scatter(x,lin_reg1,'.k');
title({['y = ce^{bx}'],['y = ' num2str(c_xlny) '\timese^{' num2str(b_xlny) 'x}'],...
    ['R^2 = ' num2str(corrcoef_xy(1,end).^2) ', r = ' num2str(corrcoef_xy(1,end))]});
ylabel('y');xlabel('x');grid on;
%% y = cx^(b)
[a_lnxlny,b_lnxlny,corrcoef_lnxlny] = my_regression(lnx,lny);
b_lnxlny = b_lnxlny;c_lnxlny = exp(a_lnxlny);
figure('Name','y = cx^(b) {lin_reg1.txt}')

s_lnxlny = scatter(lnx,lny,'.k');hold on;
y_lnxlny = b_lnxlny*lnx + log(c_lnxlny);
p_xlny = plot(lnx,y_lnxlny,'-b');hold on;
title({['lny = lnc+blnx'],['lny = ' num2str(log(c_lnxlny)) ' + ' num2str(b_lnxlny) '\timeslnx'],...
    ['R^2 = ' num2str(corrcoef_lnxlny(1,end).^2) ', r = ' num2str(corrcoef_lnxlny(1,end))]});
ylabel('lny');xlabel('lnx');grid on;
print('W5__reg','-dpng')
figure('Name','y = cx^(b) {lin_reg1.txt}')
y_new = c_lnxlny*(x.^b_lnxlny);
plot(x,y_new);hold on;
s = scatter(x,lin_reg1,'.k');
title({['y = cx^{b}'],['y = ' num2str(c_lnxlny) '\timesx^{' num2str(b_lnxlny) '}'],...
    ['R^2 = ' num2str(corrcoef_xy(1,end).^2) ', r = ' num2str(corrcoef_xy(1,end))]});
ylabel('y');xlabel('x');grid on;
%% y = clnx + b
[a_lnxy,b_lnxy,corrcoef_lnxy] = my_regression(lnx,lin_reg1);
c_lnxy = b_lnxy;b_lnxy = a_lnxy;
figure('Name','y = clnx + b {lin_reg1.txt}')

s_lnxy = scatter(lnx,lin_reg1,'.k');hold on;
y_lnxy = b_lnxy + c_lnxy*lnx;
p_lnxy = plot(lnx,y_lnxy,'-b');hold on;
title({['y = clnx + b'],['y = ' num2str(c_lnxy) 'lnx + ' num2str(b_lnxy)],...
    ['R^2 = ' num2str(corrcoef_lnxy(1,end).^2) ', r = ' num2str(corrcoef_lnxy(1,end))]});
ylabel('y');xlabel('lnx');grid on;
print('W5_log_reg','-dpng')
figure('Name','y = clnx + b {lin_reg1.txt}')
y_new = c_lnxy*lnx+b_lnxy;
plot(x,y_new);hold on;
s = scatter(x,lin_reg1,'.k');
title({['y = clnx + b'],['y = ' num2str(c_lnxy) '\timeslnx + ' num2str(b_lnxy)],...
    ['R^2 = ' num2str(corrcoef_xy(1,end).^2) ', r = ' num2str(corrcoef_xy(1,end))]});
ylabel('y');xlabel('x');grid on;
%% y = cb^x
[a,b,corrcoef] = my_regression(x,lny);
c = exp(a);b = exp(b);
figure('Name','y = cb^x {lin_reg1.txt}')

s = scatter(x,lny ,'.k');hold on;
lny_4 = log(c) + x*log(b);
p = plot(x,lny_4,'-b');hold on;
title({['lny = lnc + x\timeslnb'],['lny = ' num2str(log(c)) '+x\times ' num2str(log(b))],...
    ['R^2 = ' num2str(corrcoef(1,end).^2) ', r = ' num2str(corrcoef(1,end))]});
ylabel('lny');xlabel('x');grid on;
print('W5_cb^x_reg','-dpng')
figure('Name','y = cb^x {lin_reg1.txt}')
y_new = c*(b.^x);
plot(x,y_new);hold on;
s = scatter(x,lin_reg1,'.k');
title({['y = c\timesb^x'],['y = ' num2str(c) '\times' num2str(b) '^x'],...
    ['R^2 = ' num2str(corrcoef_xy(1,end).^2) ', r = ' num2str(corrcoef_xy(1,end))]});
ylabel('y');xlabel('x');grid on;