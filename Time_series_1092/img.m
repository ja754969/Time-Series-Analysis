function  h=img(t,f,nt)
% img(t,f,nt) :: imagesc(t,f,nt) with normal Ydir

g=imagesc(t,f,nt);
set(gca,'tickdir','out');
h=get(g,'Parent');
set(h,'Ydir','normal');
