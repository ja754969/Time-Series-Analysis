%% Time Series_1092 第12周作業 Cubic Spline
clear;clc
%%
x = [0 1 2 3 4];
y = [-8 -7 0 19 56];

% x = [-1 0 1];
% y = [1 2 -1];
%%
h = [];
for i= 1:length(x)-1
   h(i) = x(i+1)-x(i);
end
size_x = length(x);
A = [h(1) 2*(h(1)+h(2)) h(2) zeros(1,size_x-3);...
    0 h(2) 2*(h(2)+h(3)) h(3) zeros(1,size_x-4);...
    0 0 h(3) 2*(h(3)+h(4)) h(4)];
% Condition 1 
% A = [2*(h(1)+h(2)) h(2) zeros(1,size_x-2);...
%     h(2) 2*(h(2)+h(3)) h(3) zeros(1,size_x-3);...
%     0 h(3) 2*(h(3)+h(4)) h(4) zeros(1,size_x-4)];
% Condition 2 
% A = [3*h(1)+2*h(2) h(2) zeros(1,size_x-2);...
%     h(2) 2*(h(2)+h(3)) h(3) zeros(1,size_x-3);...
%     0 h(3) 2*(h(3)+h(4)) h(4) zeros(1,size_x-4)];
% Condition 3 
% A = [(h(1)+h(2))*(h(1)+2*h(2))/h(2) (h(2)^2-h(1)^2)/h(2) zeros(1,size_x-2);...
%     h(2) 2*(h(2)+h(3)) h(3) zeros(1,size_x-3);...
%     0 h(3) 2*(h(3)+h(4)) h(4) zeros(1,size_x-4)];
B = 6*[(y(3)-y(2))/h(2)-(y(2)-y(1))/h(1);...
    (y(4)-y(3))/h(3)-(y(3)-y(2))/h(2);...
    (y(5)-y(4))/h(4)-(y(4)-y(3))/h(3)];
% A = [h(1) 2*(h(1)+h(2)) h(2)];
% % A = [2*(h(1)+h(2)) h(2) 0];
% % A = [(3*h(1)+2*h(2)) h(2) 0];
% % A = [(h(1)+h(2))*(h(1)+2*h(2))/h(2) (h(2)^2-h(1)^2)/h(2) 0];
% B = 6*((y(3)-y(2))/h(2)-(y(2)-y(1))/h(1));

S = B\A;
a = [];
% for i= 1:length(x)-1
%    a(i) = (S(i+1)-S(i))/6/h(i);
%    b(i) = S(i)/2;
%    c(i) = (y(i+1)-y(i))/h(i)-(2*h(i)*S(i)+h(i)*S(i+1))/6;
%    d(i) = y(i);
% 
% end
for i= 1:length(x)-1
   a(i) = (S(i+1)-S(i))/6/h(i);
   b(i) = S(i)/2;
   c(i) = (y(i+1)-y(i))/h(i)-(2*h(i)*S(i)+h(i)*S(i+1))/6;
   d(i) = y(i);

end
x_re = [2.5 0.5];
% x_re = [0.5];
S_x = nan(length(x),length(x_re))
y1 = a(1) + b(1)*(0.5-x(1)) + c(1)*((0.5-x(1))^2) + d(1)*((0.5-x(1))^3);
y2 = a(3) + b(3)*(2.5-x(3)) + c(3)*((2.5-x(3))^2) + d(3)*((2.5-x(3))^3);
% y1 = a(2) + b(2)*(0.5-x(2)) + c(2)*((0.5-x(2))^2) + d(2)*((0.5-x(2))^3);
% y2 = a(3) + b(3)*(2.5-x(3)) + c(3)*((2.5-x(3))^2) + d(3)*((2.5-x(3))^3);
% for i= 1:length(x)
%    for j = 1:length(x_re)
%       
%    end
% end