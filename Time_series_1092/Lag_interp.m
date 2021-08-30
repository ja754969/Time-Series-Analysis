function ans_Lag = Lag_interp(x)
    % W11_ Lagrange polynomial interpolation
    xx = [-2 -1 0 1 2];
    yy = [-9 -15 -5 -3 39];
    ans_Lag = 0;
    index = [1 2 3 4 5];
    for i = 1:length(yy)
       index_new = index;
       index_new(i) = [];
       ans_Lag = ans_Lag + yy(i)/((xx(i)-xx(index_new(1)))*(xx(i)-xx(index_new(2)))*(xx(i)-xx(index_new(3)))*(xx(i)-xx(index_new(4))))*...
           ((x-xx(index_new(1)))*(x-xx(index_new(2)))*(x-xx(index_new(3)))*(x-xx(index_new(4)))); 
    end
    
%     ans_Lag = -3/8*(x+1)*x*(x-1)*(x-2)+5/2*(x+2)*x*(x-1)*(x-2)...
%         -5/4*(x+2)*(x+1)*(x-1)*(x-2)+1/2*(x+2)*(x+1)*x*(x-2)...
%         +13/8*(x+2)*(x+1)*x*(x-1);
end