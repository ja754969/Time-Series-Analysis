function wr = wt2(dat,c,pmn,pmx,m)
%WT2(dat,c,pmn,pmx,m) 2-D Morlet Wavelet Transform.
%       dat:   (n,1)-dimension data,
%         c:   parameter (5.5).
%       pmn:   minimum points,
%       pmx:   maximum points (omega=2pi/p),
%         m:   number in the vertical direction,
%       n must be even !!!!!!!
%       The output is a complex r(m,n).
%       The output is equi-frequency scaling.

%       Z. SHEN 03-27-1995
%       At The Johns Hopkins University.

%     s(tau,a)=1/sqrt(a) int(g*(t-tau/a)s(t),dt)

wmn=2*pi/pmx;wmx=2*pi/pmn;
w_y=(linspace(wmx,wmn,m))';
a=zeros(m,1);
a=c./w_y;
n=size(dat,1);
dw=2*pi/n;
r=zeros(n,m);
g=zeros(n,1);
w=zeros(n,1);
w(1:n/2+1)=(linspace(0,pi,n/2+1))';
w(n/2+2:n)=(linspace(-pi+dw,-dw,n/2-1))';
sw=fft(dat);
for j=1:m,
    a1=a(m-j+1);
    g=exp(-(a1*w-c).*(a1*w-c)/2)/sqrt(2*pi);
    g(n/2+2:n)=zeros(n/2-1,1);
    r(:,j)=ifft(g.*sw)*2*pi*sqrt(a1);
end
r=rot90(r);
r=abs(r);
for j=1:fix(n/3),
   wr(:,j)=(r(:,3*j)+r(:,3*j-1)+r(:,3*j-2))/3.;
end
wr=flipud(wr);
