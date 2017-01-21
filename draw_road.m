n=celength/step;
road=reshape(edge,n,[]);
road=sum(road*step);
area=celength*cewidth;
roadtop=mod(road,area);
road=(road-roadtop)/area+L;
roadtop=ceil((roadtop/area)*10)/10;

plaza=ones(B,CELEN);
for i=1:CELEN
    plaza(road(i)+1,i)=roadtop(i);
    plaza(road(i)+2:B,i)=0;
end
plaza=1-plaza;

clear n area i road roadtop