clear;clc;close all;
% https://search.earthdata.nasa.gov/search?fi=TMI!SSM%2FI&gdf=NetCDF&fs10=Sea%20Surface%20Temperature&fsm0=Ocean%20Temperature&fst0=Oceans
% filename = '20170317120000-CMC-L4_GHRSST-SSTfnd-CMC0.2deg-GLOB-v02.0-fv02.0.nc';
% % ncdisp(filename)
% nc_dump(filename); % nc_dump 載入檔案
%%
% lat = nc_varget(filename,'lat');           % nc_varget 取出檔案中的變數 sst4
% lon = nc_varget(filename,'lon'); 
% analysed_sst = nc_varget(filename,'analysed_sst');          
% analysis_error = nc_varget(filename,'analysis_error');         
% palette = nc_varget(filename,'mask');    
%%
temporal_range = 1:25;
load('JAXA_2018_allyear.mat')
% load('JAXA_Oct_168hrs_5.mat');
nSST = SST(1800:1800+24,:,:);nlon = lon;nlat = lat;
% x_range = find(nlon>=121+45/60):find(nlon<=122.5);
% y_range = find(nlat>=21.5):find(nlat<=22.5);
x_range = find(nlon>=121.05 & nlon<=121.4);
y_range = find(nlat>=22.3 & nlat<=22.6);
[XX_lon,YY_lat] = meshgrid(nlon,nlat);
% nSST(nSST == -9999) = NaN;
SST_size = size(nSST);
k = 1;
for i = 11:15
    new_SST(:,:,k) = nSST(i,:,:);
    k = k + 1;
end
% nSST = reshape(nSST,[length(nlat),length(nlon),size(nSST,1)]);
%%
XX_lon = XX_lon(y_range,x_range);
YY_lat = YY_lat(y_range,x_range);
% [xxlon,yylat] = meshgrid(spatial_range_xlon,spatial_range_ylat);
nSST = new_SST(y_range,x_range,:);
% nSST = new_SST(:,:,:);
[data_2d_missing_as_zero,data_2d_missing_as_mean,in_nonan_locations] = reshape3dto2d(nSST);
a = reshape(nSST,[length(x_range)*length(y_range),size(nSST,3)]);
a = sum(a);
[fr,fc] = find(data_2d_missing_as_zero==0);
%%
x = data_2d_missing_as_zero;
% x(fr,:) = [];
x = x';
% data_size = size(x);
% x_original = x;
% x = reshape(x,[data_size(1)*data_size(2),data_size(3)])';
% x = [3 4 5 3;-3 3 8 2;1 -5 -5 -2;7 10 4 5]; % 列 :  temporal data，行 : spatial data
temporal_data_length = size(x,1);
xbar = mean(x);
mmx = xbar'*ones(1,temporal_data_length);
A = x - mmx';
% A = x;
s = 1/temporal_data_length*(A')*A; % covariance

[V,D] = eig(s); % eigenvalue
V = real(V);D = real(D);
eigen_variance = diag(D)/sum(diag(D));
xe = x*V; % 
contourf(x');colorbar;colormap('jet');title('Original SST data');
e4 = xe(:,end-3)*V(:,end-3)'; % PC4
e3 = xe(:,end-2)*V(:,end-2)'; % PC3
e2 = xe(:,end-1)*V(:,end-1)'; % PC2
e1 = xe(:,end)*V(:,end)'; % PC1
e1+e2+e3+e4; % 和原始資料相同

figure
% e1_plot = reshape(e1',[data_size(1),data_size(2),data_size(3)]);
% pcolor(XX_lon,YY_lat,U(:));colorbar;
contourf(e1');colorbar;colormap('jet');title('PC 1');
figure
% e2_plot = reshape(e2',[data_size(1),data_size(2),data_size(3)])';
% pcolor(XX_lon,YY_lat,e2_plot);colorbar;
contourf(e2');colorbar;colormap('jet');title('PC 2');
%%
% x = nSST;
% data_size = size(x);
% x_original = x;
% x = reshape(x,[data_size(1)*data_size(2),data_size(3)]);
% [U,S,V] = svd(x);
% spatial = U*S;
% figure
% pcolor(XX_lon,YY_lat,reshape(spatial(:,1),[data_size(1),data_size(2),1]));colorbar;
% figure
% pcolor(XX_lon,YY_lat,reshape(spatial(:,2),[data_size(1),data_size(2),1]));colorbar;