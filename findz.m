function Zn = findz (a,z)
Za2 = 1; %Za/2
Za  = 2; %Za

%Tabla distribucion normal Z
ndtable = [
    0  10    8     6     5     4     3     2     1
    Za2 1.645 1.751 1.881 1.960 2.054 2.170 2.326 2.576
    Za 1.282 1.405 1.555 1.645 1.751 1.881 2.054 2.326 
];

fc = []; %Fila y columnna
%Buscando fila
for f=1 : 3
    if z == ndtable(f,1)
        fc(1) = f;
    end
end
%Buscando columna
for c=1 :  9
    if a == ndtable(1,c)
        fc(2) = c; 
    end
end 

Zn = ndtable (fc(1),fc(2));
end