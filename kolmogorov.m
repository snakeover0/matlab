% PRUEBA KOLMOGOROV-SMIRNOV

r = input('Conjunto de numeros (r): ');
a = input('Nivel de confianza: ');
a = (100-a)/100;

%Dimension del vector o matriz
dim = size(r);
f = dim(1);    %Filas  
c = dim(2);    %Columnas

n = numel (r); %Cantidad de numeros del conjunto

%Funcion que returna un array ordenado en otro caso un vector
r = sortmatrix(r,f,c,n);

%Buscar el valor critico dentro de la tabla 
ksnumber = findksnumber(n,a);
disp(ksnumber);

disp('Conjunto ordenado');
disp(r);


Psup = [];     %Promedio superior para cada valor de i: i/n
Pinf = [];     %Promedio inferior para cada valor de i: (i-1)/n

Dplus = [];    %Valor critico para cada valor del promedio superior: ps-r
Dless = [];    %Valor critico para cada valor del promedio inferior: r-p i

%Asignando los promedios superiores al vector
o=1;
for i=1 : f
    for j = 1 : c 
        Psup(i,j) =  o/n;
        o = o+1;
    end
end
disp('Promedios superiores: ');
disp(Psup);

%Asignando los promedios inferiores al vector
o = 1; 
for i=1 : f
    for j = 1 : c 
        Pinf(i,j) =  (o-1)/n;
        o = o+1;
    end
end 
disp('Promedios inferiores');
disp(Pinf);

%Asignando valores criticos superiores, al vector
for i=1 : f
    for j = 1 : c     
        aux = Psup(i,j)- r(i,j);
        Dplus(i,j) =  aux;
    end
end
disp('Valores criticos de los promedios superiores: ');
disp(Dplus);

%Asignando valores criticos inferiores, al vector
for i=1 : f
    for j = 1 : c  
        aux = r(i,j) - Pinf(i,j);
        Dless(i,j) =  aux; 
    end
end
disp('Valores criticos de los promedios inferiores: ');
disp(Dless);

%Valor maximo de todos los valores criticos superiores
Dpmax = max(max(Dplus));
disp(Dpmax);
%Valor maximo de todos los valores criticos inferiores
Dlmax = max(max(Dless));
disp(Dlmax);
%Valor critico maximo entre Dpmax y Dlmax
Dmax = max (Dpmax,Dlmax);
disp('Valor critico  MAXIMO');
disp(Dmax);

if(Dmax < ksnumber)
    disp('Se acepta el conjunto n como uniforme dentro del intervalo (0,1).');
else
    disp('Se rechaza el conjunto.');
end
    
