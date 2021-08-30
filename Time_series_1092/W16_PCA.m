clear;clc;clf
x = [3 4;2 2;1 3]; % 列 :  temporal data，行 : spatial data
xbar = mean(x);
mmx = xbar'*ones(1,3);
A = x - mmx'
s = 1/3*(A')*A; % covariance
[V,D] = eig(s); % eigenvalue
xe = x*V % 
contourf(x');colorbar;
e2 = xe(:,1)*V(:,1)' % PC2
e1 = xe(:,2)*V(:,2)' % PC1
e1+e2
figure
contourf(e1');colorbar;
figure
contourf(e2');colorbar;