clear;clc;close all
x1 = [0 2 2.5 1 4 7];
x2 = [0 1 2 3 6 2];
y = [3 6 3 -8 -11 21];
D = [length(y) sum(x1) sum(x2);...
    sum(x1) sum(x1.^2) sum(x1.*x2);...
    sum(x2) sum(x1.*x2) sum(x2.^2)];
Y = [sum(y);sum(x1.*y);sum(x2.*y)];
A1 = D\Y;

reg = A(1) + A(2)*x1 + A(3)*x2;
reg_text = ['y = ' num2str(A(1)) '+' num2str(A(2)) '\timesx1 ' num2str(A(3)) '\timesx2'];
figure
sx1 = scatter(x1,y);hold on;
px1 = plot(x1,reg);title('x1');xlabel('x1');ylabel('y');
grid on;legend([sx1,px1],{'x1 data',reg_text},'Location','best');
print('x1.png','-dpng');
figure
sx2 = scatter(x2,y);hold on;
px2 = plot(x2,reg);title('x2');xlabel('x2');ylabel('y');
grid on;legend([sx2,px2],{'x2 data',reg_text},'Location','best');
grid on;
print('x2.png','-dpng');
%%
clear;clc;close all
x = [0 1 2 3 4 5];
y = [2.1 7.7 13.6 27.2 40.9 61.1];
D = [length(y) sum(x) sum(x.^2);...
    sum(x) sum(x.^2) sum(x.^3);...
    sum(x.^2) sum(x.^3) sum(x.^4)];
Y = [sum(y);sum(x.*y);sum(x.^2.*y)];
A = D\Y;
reg = A(1) + A(2)*x + A(3)*(x.^2);
reg_text = ['y = ' num2str(A(1)) '+' num2str(A(2)) '\timesx +' num2str(A(3)) '\timesx^2'];
figure
sx = scatter(x,y);hold on;
px = plot(x,reg);title('x');xlabel('x');ylabel('y');
legend([sx,px],{'x data',reg_text},'Location','best');
grid on;
print('x.png','-dpng');