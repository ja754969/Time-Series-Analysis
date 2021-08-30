function [data_2d_missing_as_zero,data_2d_missing_as_mean,in_nonan_locations] = reshape3dto2d(data)
% [data_2d, in_nonan_locations] = RESHAPE3DTO2D(data)
% Version 1.0
% Subroutine of EOF toolbox.
% Reshape 3d data(lon,lat,time) into a 2d data(lon*lat,time) and remove the
% nan values.
%% Author:
%	Zelun Wu,
%   Ph.D. student of Physical Oceanography,
%	Xiamen University & University of Delaware
%	zelunwu@stu.xmu.edu.cn, zelunwu@udel.edu
%	15th May, 2020

size_3d = size(data);


data = reshape(data, [size_3d(1)*size_3d(2),size_3d(3)]);
[in_nonan_locations, in_nonan_timesteps] = find(~isnan(data));
in_nonan_locations = unique(in_nonan_locations);
data_2d = data(in_nonan_locations,:);
% missing_filter = find(missing_rate_map(:)>40);
% data(missing_filter)=nan;

% data_2d_nan = data;
% data_2d_nan(in_nonan_locations,:) = [];
% % [r,c,p] = ind2sub([size_3d(1),size_3d(2),size_3d(3)],nan_locations);
%% Method 1 : for loop by myself (Tseng) : Get the average to fill the nan spatial points by the sum of its last time points and next time points.
% for i = 1:length(data_2d(1,:))
%     missing_data_locations{i} = find(isnan(data_2d(:,i))==1);
%     if i == 1
%         data_2d(missing_data_locations{i},i) = nanmean(data_2d(missing_data_locations{i},i+1) + data_2d(missing_data_locations{i},i+2));
%         
%     elseif i == length(data_2d(1,:))
%         data_2d(missing_data_locations{i},i) = nanmean(data_2d(missing_data_locations{i},i-1) + data_2d(missing_data_locations{i},i-2));
%             
%     else
%         data_2d(missing_data_locations{i},i) = nanmean(data_2d(missing_data_locations{i},i-1) + data_2d(missing_data_locations{i},i+1));
%     end
    
% end
%% Method 2 : for loop by myself (Tseng) : Get the average by the sum of 8 nearest points around the nan spatial points.
% data = reshape(data, [size_3d(1),size_3d(2),size_3d(3)]);
% for i = 1:length(r)
%     data_2d(r(i)*c(i),p(i)) = data(r(i)+1,c(i),p(i))+data(r(i)-1,c(i),p(i));
%     
% end

%% Method 3 : Get the average to fill the nan spatial points by the sum of its last time points and next time points.
%%%%%% fillmissing(A,'linear',2,'EndValues','nearest')
% data_2d = fillmissing(data_2d,'linear',2,'EndValues','nearest');
%% Method 4 : Remove the mean of the data and set NaN to zero or the temporal mean.
data_2d_missing_as_zero = data_2d;
% [f_r,f_c] = ind2sub([size(data_2d),size_3d(3)],find(isnan(data_2d)==0));
% for i = 1:length(f_r)
%     data_2d_missing_as_zero(f_r(i),f_c(i)) = data_2d_missing_as_zero(f_r(i),f_c(i))-mean(data_2d(f_r(i),:),'omitnan');
% end
% data_2d_missing_as_zero(isnan(data_2d)==0) = data_2d_missing_as_zero(isnan(data_2d)==0)-mean(data_2d,2,'omitnan');
data_2d_missing_as_zero(isnan(data_2d)==1) = 0;

data_2d_missing_as_mean = data_2d;
[f_r,f_c] = ind2sub([size(data_2d),size_3d(3)],find(isnan(data_2d)==1));
for i = 1:length(f_r)
    data_2d_missing_as_mean(f_r(i),f_c(i)) = mean(data_2d(f_r(i),:),'omitnan');
%     data_2d_missing_as_mean(f_r(i),f_c(i)) = mean(data_2d(:,f_c(i)),'omitnan');
end

end