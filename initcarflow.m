carmap=zeros(B,CELEN);
carvelmap=carmap;
carmermap=carmap;
%caraccmap=carmap;
newcar=(rand(1,B)<0.5)';
newcarvel=newcar*initvel;
%newcaracc=newcar*acc;
carmap=[newcar carmap(:,2:end)];
carvelmap=[newcarvel carvelmap(:,2:end)];
%caraccmap=[newcaracc caraccmap(:,2:end)];

clear newcar newcarvel