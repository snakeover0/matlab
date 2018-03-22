
%PRUEBA CORRIDAS ARRIBA Y ABAJO DE LA MEDIA

%r = input('Conjunto de numeros: ');
r = [
 0.809 0.042 0.432 0.538 0.225 0.88  0.688 0.772 0.036 0.854
 0.397 0.268 0.821 0.897 0.07  0.721 0.087 0.35  0.779 0.482
 0.136 0.855 0.453 0.197 0.444 0.799 0.809 0.691 0.545 0.857
 0.692 0.055 0.348 0.373 0.436 0.29  0.015 0.834 0.599 0.724
 0.564 0.709 0.946 0.754 0.677 0.128 0.012 0.498 0.6   0.913
];
a = input('Nivel de confianza: ');

a = 100-a;    %Nivel de significancia
n = numel(r); %Cantidad de numeros de la muestra
n0 = 0;       %Cantidad de ceros dentro de la secuencia
n1 = 0;       %Cantidad de unos dentro de la secuencia

S = [];       %Vector de secuencias 
C = 0;        %Cantidad de corridas en la secuencia

%Dimension del vector o mtariz
dimr = size(r);
f = dimr(1);  %Filas
c = dimr(2);  %Columnas 

%Anadiendo las seceuncias a un vector
con = 1;      %Contador
media = 0.5;  %Valor de la media
for i = 1 : f
for j = 1 : c
  if r(i,j) > media
    S(con) = 1;
    n1=n1+1;  %Total de unos
  else
    S(con) = 0;
    n0=n0+1;  %Total de ceros 
  end
  con = con + 1;
end 
end
disp(S);
disp(n);
disp(n0);
disp(n1);


%Numero de corridas medias
l = numel(S) %longitud del vector S
aux = -1
for i=1 : l
  if aux ~= S(i)
    C = C + 1;
    aux = S(i);
  end  
end
disp('Total de corridas: ');
disp(C);

%Calculo del valor Z estadistico
U = ((2*n0*n1)/n)+0.5;  %Valor estimado
O = 2*n0*n1*(2*n0*n1-n)/(power(n,2)*(n-1)); %Varianza
Zo = (C-U)/sqrt(O);     %Estadistico Z

disp(Zo);

%0.67,0.62,0.05,0.49,0.59,0.42,0.05,0.02,0.74,0.67n
%{
%}



