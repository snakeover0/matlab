%METODO DE LOS CUADRADOS MEDIOS

num = input('Semilla: ');
cantnum = input('Cantidad de numeros pseudoaleatorios: ');
sem = num2str(num);

if(length(sem)==2 || length(sem)==4 )
    num = num*num;
    sem = num2str(num);
    display(sem)
    
    for i = 1 : cantnum-1
       if(length(sem)== 4)
           num = str2double(sem(2:3));
       elseif (length(sem)==3)
           sem = strcat('0',sem);
           num = str2double(sem(2:3));
       elseif(length(sem)==5)
           sem = strcat('0',sem);
           num = str2double(sem(3:4));
       elseif (length(sem)==8)
           num = str2double(sem(3:6));
       elseif (length(sem)==7)
           sem = strcat('0',sem);
           num = str2double(sem(3:6));
       end

       num = num* num;
       sem = num2str(num);
       display(sem)
    end
else 
    break
end