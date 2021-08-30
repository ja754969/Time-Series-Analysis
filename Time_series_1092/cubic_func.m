function ans_S =cubic_func(x,ad)
S_x(i,j) = a(i) + b(i)*(x_re(j)-x(i)) + c(i)*((x_re(j)-x(i))^2) + d(i)*((x_re(j)-x(i))^3);
end