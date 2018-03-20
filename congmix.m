%  ;;METODO CONGRUENCIAL MIXTO

x  = input('Semilla (x): ');
a  = input('Multiplicador (a): ');
ca = input('Constante aditiva (ca): ');
m  = input('Mod (m): ');
tnp= input('Total de numeros pseudoaleatorios: ');

if ~(a>0&&x>0&&ca>0&&m>0)
    break
end

if ~(m>x && m>a && m>ca)
    break
end

for i=1 : tnp
    x = mod(a*x+ca,m);
    disp(x);
    disp(x/m);
end

