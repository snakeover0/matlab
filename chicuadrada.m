% PRUEBA DE CHI-CUADRADA

%{
La prueba de chi-cuadrada busca determinar si los numeros del conjunto r, 
se distribuyen de manera uniforme en el intervalo (0,1). Para llevar a 
cabo esta prueba es necesario divir el intervalo (0,1) en msub-intervalos,
en donde es recomendable m = sqr(n) (m  es igual a raizcuadrada de n). 
Luego se clasifica cada numero pseudoaleatorio delconjunto r, en los m 
intervalos. A cantidad de numeros r que se clasifican en cada intervalo 
se le denomina frecuencia observada (O), y a la cantidad de numeros r que
se espera encontrar en cada intervalo sele llama frecuencia esperada (E); 
teoricamente, la E es igual n/m. A partir de los valores de O y E se 
determina el estadistico X^(2) mediante la ecuacion:
            X^2 = ((E-O)^2)/E
Si el valor estadistico X^2 es menor al valor de tablas X^2a, m-1 entonces
no se puede rechazar el conjunto de numeros r.
%}

r  = input('Conjunto de numeros (r): '); %Matriz de numeros
tb = input('Tabla Chi-Cuadrada(X^2): '); %Tabla chicuadrada
nc = input('Nivel de confianza (%): ');  %Nivel de confianza en porcentaje (%) 


n = numel (r);  %Numero de elementos del array
m = sqrt(n);    %Numero de intervalos (raiz cuadrada del total de elementos)
a =(100-nc)/100;%Nivel de significancia

%Calculo del numero de filas y columnas a traves de la dimension
d = size(r);    %Dimension
f = d(1);       %Filas 
c = d(2);       %Columnas


si = [];        %Intervalos (sub-intervalos)
O  = [];        %Frecuencia observada 
E  = n/m;       %Frecuencia esperada
Xi = [];        %Estadistico para cada valor en i
Xam1 = 0;       %Valor estadistico en la tabla de chi-cuadrada

%Cada valor de un intervalo asignado a un vector
for i = 1 : m
   si = horzcat(si, i/m);
end

disp('intervalos: ');
disp(si);
%Frecuencia observada para cada intervalo del total de los numeros del
for z=1 : m
    contador = 0;
    for i=1 : f
        for j = 1 : c 
            if(r(i,j)>= (si(z)-si(1)) && r(i,j)< si(z))
                contador = contador +1;
            end
        end
    end
    O = horzcat(O, contador);
end
disp('Frecuencia observada (O):');
disp(O);
%Calculo del estadistico para cada valor del intervalo
for w=1 : m
    Xi = horzcat(Xi,power(E-O(w),2)/E);
end

disp('Valor Estadistico (Xi): ');
disp(Xi);

disp('Sumatoria de la Estadistica (X): ')
disp(sum(Xi));

%Busqueda del valor dentro de la tabla chi-cuadrada
tablesize = size(tb);
rows = tablesize(1);
columns = tablesize(2);

fc = [];

for i=1 : rows; 
    if(tb(i,1)==m-1)
        fc = horzcat(fc,i);
    end
end

for j=1 : columns 
    if(tb(1,j)==a)
        fc = horzcat(fc,j);
    end
end

Xam1 = tb (fc(1),fc(2));
disp('Valor en la tabla Chi-cuadrada: ');
disp(Xam1);

%Sumatoria Estadistica menor al valor en tabla
if(sum(Xi) < Xam1) 
    disp('<<El conjunto r es aceptado como uniforme dentro del intervalo (0,1)>>.');
else
    disp('Se rechaza el conjunto.');
end
