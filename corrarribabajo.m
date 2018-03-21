
% PRUEBA DE INDEPENDENCIA: CORRIDA ARRIBA ABAJO

r = input('conjunto de numeros: '); %Muestra
a = input('Nivel de confianza:  '); %Nivel de confianza
z = input('Tipo de significancia [Za2: 1 o Za: 2]: ');

a = 100-a;    %Nivel de significancia
n = numel(r); %Cantidad de numeros del conjunto 

%Valor estadistico Z en tabla
Za = findz(a,z);
disp('Valor estadistico en tabla: ');
disp(Za);

S = []; %Secuencia de los numeros del conjunto
Co = 0; %Cantidad de corridas observadas

%Dimension del vector o matriz
dimr = size(r);
f = dimr(1); %Filas
c = dimr(2); %columnas

%Anadiendo la secuencia a un vector
aux = r(1,1);%Primer numero del conjunto
con = 1;     %Contador
for i=1 : f
    for j = 1 : c 
        if i==1 && j == 1
            continue
        end 
        if aux < r(i,j)
            S(con) = 1;
        else
            S(con) = 0;
        end
        con = con + 1;
        aux = r(i,j);
    end
end
disp('Secuencia: ')
disp(S);

%Numero de corridas en la secuencia 
Si = -1;
for i=1 : numel(S)  
     if Si ~= S(i)
        Si = S(i);
        Co = Co + 1;
     end 
end 
disp('Cantidad de corridas: ');
disp(Co);

%Calculo del valor estadistico Z
U = (2*n-1)/3;           %Valor esperado
O = (16*n-29)/90;        %Varianza del numero de corridas        
Zo = abs((Co-U)/sqrt(O));%Estadistico z

disp('Estadistico Z: ');
disp(Zo);

if(Zo < Za)
    disp('NO se RECHAZA que el conjunto sea independiente');
else
    disp('Se RECHAZA el conjunto');
end