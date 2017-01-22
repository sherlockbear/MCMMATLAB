clear all
clc

len=200;
L=3;
B=8;
celength=4;
cewidth=3;
CELEN=len/celength;
r=0.7;
Vmax=7;
arrival=0;
Time=1000;
flowden=0.1;

left=1;
right=0;

step=0.1;
draw_line;
draw_road;

initvel=0;
%acc=1;
%deacc=acc;
initcarflow;

avervel=[];

fre=0;

clf
imh = image(cat(3,1-carmap-plaza*0.4,1-carmap-plaza,1-plaza));
axis equal
axis tight
axis off

tic
for t=1:Time
    refresh_vel_mer
    move_forward
    
    fre=fre+1;
    if fre==20
        fre=0;
        avervel=[avervel sum(sum(carvelmap))/sum(sum(carmap))];
    end
    
    set(imh, 'cdata', cat(3,1-carmap-plaza*0.4,1-carmap-plaza,1-plaza))
    drawnow
end
toc

area(avervel);



