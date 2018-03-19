
%Funcion para ordenar el vector o la matriz
function array = sortmatrix(r, f, c, nr)

ar = []; %Contendra un array ordenado

if ~isvector(r)
    for i=1 : nr
        for  j=i : nr
            if(r(j)<r(i))
                aux  = r(j);
                r(j) = r(i);
                r(i) = aux;
            end
        end
    end
    
    o=1;
    for i=1 : f
        for  j=1 : c
            ar (i,j) = r(o);
            o=o+1;
        end 
    end
    array = ar;
else
   array = sort(r);
end
  
end

