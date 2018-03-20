%PRODUCTO MEDIO

sem1 = input('Primera semilla: ');
sem2 = input('Segunda semilla: ');

tns = input('Total de Num. Pseudoaleatorios: ');

if(length(num2str(sem1*sem2)) < 3)
    break
end

display (sem1*sem2)

for  i = 1 : tns-1
   aux = sem2; 
   s = num2str(sem1*sem2);
   if( mod(length(s),2) ~= 0)
       s = strcat('0',s);
   end
   
   sem1 = aux;
   if(length(s)==4)
       sem2 = str2double(s(2:3));
   elseif length(s) == 6
       sem2 = str2double(s(3:4));
   elseif length(s) == 8
       sem2 = str2double(s(3:6));
   end
   
   display(sem1 * sem2)
   display(sem2/100)
end