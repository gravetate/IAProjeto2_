

function f = plotcities_2024(inputcities,set_id)



shg 

clf

temp_2 = line(inputcities(1,:),inputcities(2,:),'Marker','o','Markersize',6,'Markerfacecolor','r');
set(temp_2,'color','r');
xlabel('Lati.')
ylabel('Longi.')

if set_id == 1
  axis([40.2 42.3 6.2 8.7])
elseif set_id == 2

 axis([36.5 42 6 9.5])
else 
    fprintf(1,'Error in the set_id number');
end

  
x = [inputcities(1,1) inputcities(1,length(inputcities))];
y = [inputcities(2,1) inputcities(2,length(inputcities))];

temp_3 = line(x,y);
set(temp_3,'color','r');

