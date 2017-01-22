for j=1:CELEN
    for i=1:B
        if carmap(i,j)==0
            continue
        end
        frontline=j+1:1:min(CELEN,j+carvelmap(i,j)+1);
        G=min([min(find(carmap(i,frontline)==1)),min(find(plaza(i,frontline)>0.8))]);
        if i~=1&&sum(carmap(i-1,frontline-1))==0%&&carvelmap(i,j)~=0
            Gl=min([min(find(carmap(i-1,frontline-1)==1)),min(find(plaza(i-1,frontline-1)>0.8))]);
            if G
               p=0.9;%(1-0.9*exp(1-Gl/G))*(0.5+0.5*plaza(i,min(CELEN,j+carvelmap(i,j))));
            else
                p=0.1;
            end
        else
            p=0;
        end
        
%         if sum(carmap(i,frontline))==0||sum(plaza(i,frontline))<1
%             p=0.1;
%         else
%             if i~=1&&sum(carmap(i-1,frontline-1))==0
%                p=1-0.9*exp(1-Gl/G);
%             else
%                 p=0;
%             end
%         end 

        if rand<p
            carmermap(i,j)=1;
        else
            if G
                carvelmap(i,j)=G-1;
            else
                p=exp((carvelmap(i,j)-Vmax)/2);
                if rand>p
                    carvelmap(i,j)=carvelmap(i,j)+1;
                end
            end
        end
        
    end
end