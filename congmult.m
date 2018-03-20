% ;;METODO CONGRUENCIAL MULTIPLICATIVO

x = input('Semilla: ');
t = input('Numero impar: ');
m = input('Mod numero par (m): ');
tnp = input('Total de numeros pseudoaleatorios: ');

a = 8*t-3;
d = m/4;

for  i=1 : tnp
  x = mod ((a*x),m);
  disp(x);
end

disp('periodo: ');
disp(d);
