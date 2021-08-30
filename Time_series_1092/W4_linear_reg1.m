clear;clc;close all
load('lin_reg1.txt')
x_421 = [0,1,2,3,4,5,6];
y_421 = [2,3,5,5,9,8,10];
a = (sum(y_421)*sum(x_421.^2)-sum(x_421)*sum(x_421.*y_421))/(length(x_421)*sum(x_421.^2)-sum(x_421).^2);
b = (length(x_421)*sum(x_421.*y_421)-sum(y_421)*sum(x_421))/(length(x_421)*sum(x_421.^2)-sum(x_421).^2);
corrcoef_421 = corrcoef(y_421,x_421);
% y_421 = a + b*x_421

x_lin_reg1 = 1:length(lin_reg1);
a_lin_reg1 = (sum(lin_reg1(:))*sum(x_lin_reg1(:).^2)-sum(x_lin_reg1(:))*sum(x_lin_reg1(:).*lin_reg1(:)))/(length(x_lin_reg1(:))*sum(x_lin_reg1(:).^2)-sum(x_lin_reg1(:)).^2);
b_lin_reg1 = (length(x_lin_reg1)*sum(x_lin_reg1(:).*lin_reg1(:))-sum(lin_reg1(:))*sum(x_lin_reg1(:)))/(length(x_lin_reg1(:))*sum(x_lin_reg1(:).^2)-sum(x_lin_reg1(:)).^2);
corrcoef_lin_reg1 = corrcoef(lin_reg1,x_lin_reg1);
% lin_reg1 = a_lin_reg1 + b_lin_reg1*x_lin_reg1
%%
figure(1)
subplot(2,1,1)
p_421 = plot(x_421,y_421,'-k.','MarkerSize',6);hold on;
p_421.Marker = '.';
p_421.MarkerSize = 6;
xlabel('x');ylabel('y');
title('EX 4-2-1');grid on;

subplot(2,1,2)
s_421 = scatter(x_421,y_421,'.k');hold on;
s_421.MarkerFaceColor = 'b';
y_421_reg = b*x_421 + a;
p_reg_421 = plot(x_421,y_421_reg,'-b');hold on;
xlabel('x');ylabel('y');
title({['y = ' num2str(a) ' + ' num2str(b) ' x'],...
    ['R^2 = ' num2str(corrcoef_421(1,end).^2) ', r = ' num2str(corrcoef_421(1,end))]});
grid on;
print('p_reg_421','-dpng')
%%
figure(2)
subplot(2,1,1)
p_lin_reg1 = plot(x_lin_reg1,lin_reg1,'-k');hold on;
p_lin_reg1.Marker = '.';
p_lin_reg1.MarkerSize = 6;xlabel('x');ylabel('y');
title('Raw Data : lin_reg1.txt','Interpreter','none');grid on;
subplot(2,1,2)
s_lin_reg1 = scatter(x_lin_reg1,lin_reg1,'.k');hold on;
y_lin_reg1 = b_lin_reg1*x_lin_reg1 + a_lin_reg1;
p_lin_reg1_reg = plot(x_lin_reg1,y_lin_reg1,'-b');hold on;
xlabel('x');ylabel('y');
title({['y = ' num2str(a_lin_reg1) ' + ' num2str(b_lin_reg1) ' x'],...
    ['R^2 = ' num2str(corrcoef_lin_reg1(1,end).^2) ', r = ' num2str(corrcoef_lin_reg1(1,end))]});
grid on;
print('p_lin_reg1_reg','-dpng')
% legend([p,p_s5,p_s15],'original','stage5','stage_spencer15','Location','best','Interpreter','none')
% 
% corrcoef_421 = corrcoef(y_421,y);
% corrcoef_spencer = corrcoef(y_spencer,y);