High = 450;
Low = 0;
records_number=450;

% x = sort((High-Low)*rand(records_number,1)+Low,'ascend' or 'descend');
x = sort((High-Low)*rand(records_number,1)+Low,'ascend');
x=[];
for i=1:450
        
     x(i)=i;
        
end 
y=[];
y=x';

