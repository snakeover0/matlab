% ;;METODO CONGRUENCIAL ADITIVO

disp(' ;;METODO CONGRUENCIAL ADITIVO')

array_ve = input('Valores de entrada. Al menos dos. Ej. [23, 33]: ');
md = input('Mod: ');
tns = input('Total numeros pseudoaleatorios: ');

for i=1 : tns 
    len = length(array_ve);
    n = mod((array_ve(i)+array_ve(len)),md);
    ri = n / (md-1);
    
    array_ve = horzcat(array_ve,n);
    
    disp(n);
    disp(ri);
end

