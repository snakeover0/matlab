%PRODUCTO MEDIO MODIFICADO

k = input('Numero constante (k): ');
s = input('Semilla (s): ');

tns = input('Total de numeros seudoaleatorios: ');

if(length(num2str(k*s))<2)
    break
end

for i=1 : tns
   display(k*s)
   
   aux = num2str(k*s);
   s = str2double(aux(1:2));
end