function [a_lin_reg1,b_lin_reg1,corrcoef_lin_reg_1] = my_regression(x,y)
    % y = a + bx
    a_lin_reg1 = (sum(y(:))*sum(x(:).^2)-sum(x(:))*sum(x(:).*y(:)))...
        /(length(x(:))*sum(x(:).^2)-sum(x(:)).^2);
    b_lin_reg1 = (length(x)*sum(x(:).*y(:))-sum(y(:))*sum(x(:)))...
        /(length(x(:))*sum(x(:).^2)-sum(x(:)).^2);
    corrcoef_lin_reg_1 = corrcoef(y,x);
end