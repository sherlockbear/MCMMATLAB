clear,clc

len=100;
L=3;
B=8;
celength=4;
cewidth=3;
r=0.5;

step=0.1;
draw_line;
draw_road;

clf
imh = image(cat(3,plaza,plaza,plaza));
axis equal
axis tight
axis off

 
% burning -> empty
% green -> burning if one neigbor burning or with prob=f (lightning)
% empty -> green with prob=p (growth)
% veg = {empty=0 burning=1 green=2}
for i=1:300000
    %nearby fires?
    
     sum = (veg(1:n,[n 1:n-1])==1) + (veg(1:n,[2:n 1])==1) + ...
           (veg([n 1:n-1], 1:n)==1) + (veg([2:n 1],1:n)==1) ;
 
    veg = ...
         2*(veg==2) - ((veg==2) & (sum>0 | (rand(n,n)<Plightning))) + ...
         2*((veg==0) & rand(n,n)<Pgrowth) ;
     
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),z) )
    drawnow
end


