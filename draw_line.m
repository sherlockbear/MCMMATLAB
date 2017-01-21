LBdif=B-L;
mLBdif=LBdif*cewidth;
x0=[0 r*len len];
y0=[mLBdif mLBdif/2 0];
x=step:step:len-step;
pp=csape(x0,y0,[1,1],[0,0]); 
edge=[mLBdif fnval(pp,x)];

clear pp x0 y0 LBdif mLBdif

% p=polyfit(x0,y0,6);
% y=polyval(p,x);

% plot(x,y);
% axis equal
% axis tight
% axis off