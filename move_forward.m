newcarmap=carmap;
newcarvelmap=carvelmap;
for j=1:CELEN
    for i=1:B
        if carmap(i,j)==0
            continue
        end
        
        newcarmap(i,j)=0;
        newcarvelmap(i,j)=0;
        if j+carvelmap(i,j)>CELEN
            arrival=arrival+1;
        else
            if carmermap(i,j)==1
            end
            newcarmap(i-carmermap(i,j),j+carvelmap(i,j))=1;
            newcarvelmap(i-carmermap(i,j),j+carvelmap(i,j))=carvelmap(i,j);
        end 
        
    end
end
newcar=(rand(1,B)<0.8)';
newcarmap=[newcar|newcarmap(:,1) newcarmap(:,2:end)];
carmap=newcarmap;
carvelmap=newcarvelmap;
carmermap(:,:)=0;