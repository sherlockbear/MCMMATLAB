clear all
clc

len=100;
L=3;
B=8;
celength=4;
cewidth=3;
CELEN=len/celength;
r=0.5;
Vmax=7;
arrival=0;
Time=3000;

step=0.1;
draw_line;
draw_road;

initvel=0;
acc=1;
deacc=acc;
initcarflow;

clf
imh = image(cat(3,1-carmap-plaza,1-carmap-plaza,1-plaza));
axis equal
axis tight
axis off

tic
for t=1:Time
    refresh_vel_mer
    move_forward
    
    set(imh, 'cdata', cat(3,1-carmap*0.4-plaza*0.4,1-carmap-plaza,1-plaza))
    drawnow
end
toc



