clear;clc
load('y.txt')
y_stage5_wei = [1 4 6 4 1];
y_stage5 = zeros(length(y),1);
for i = 1+2:length(y)-2
    n_stage5 = i-2:1:i+2;
    for j = 1:length(n_stage5)
        y_stage5(i,1) = y_stage5(i,1) + y(n_stage5(j))*y_stage5_wei(j);
    end
end
y_stage5(y_stage5==0) = nan;
y_stage5 = y_stage5/16;
%%
y_wei = [-3,-6,-5,3,21,46,67,74,67,46,21,3,-5,-6,-3];
y_spencer = zeros(length(y),1);
for i = 1+7:length(y)-7
    n_spencer = i-7:1:i+7;
    for j = 1:length(n_spencer)
        y_spencer(i,1) = y_spencer(i,1) + y(n_spencer(j))*y_wei(j);
    end
    
end
y_spencer(y_spencer==0) = nan;
y_spencer = y_spencer/320;

figure
p = plot(y,'-k','LineWidth',5);hold on;
p_s5 = plot(y_stage5,'-c','LineWidth',3);hold on;
p_s15 = plot(y_spencer,'-r','LineWidth',3);hold off;grid minor;
title('W3_hw1','Interpreter','none');xlabel('time');ylabel('magnitude');
legend([p,p_s5,p_s15],'original','stage5','stage_spencer15','Location','best','Interpreter','none')

corrcoef_stage5 = corrcoef(y_stage5(3:end-2),y(3:end-2));
corrcoef_spencer = corrcoef(y_spencer(8:end-7),y(8:end-7));