n=celength/step;
road=reshape(edge,n,[]);
road=sum(road*step);
area=celength*cewidth;
roadtop=mod(road,area);
road=(road-roadtop)/area+L;
roadtop=ceil((roadtop/area)*10)/10;

celen=len/celength;
plaza=ones(B,celen);
z=zeros(B,celen);
for i=1:celen
    plaza(road(i)+1,i)=roadtop(i);
    plaza(road(i)+2:B,i)=0;
end

clear n area