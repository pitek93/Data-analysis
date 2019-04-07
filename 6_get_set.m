x= linspace(0,5,100);
y1=x-x.^3/6+x.^5/120;
y2=sin(x);
y3=x+1;
plot(x,y1, '-.r*', x,y2, '--mo', x,y3,':bs');
xlabel('xyz')

%rozszyfrowac obiekt
uchwyt = get(gca, 'Children');

%opis = get(gca, 'XLabel');
%set(opis, 'Linewidth', [0.9])

get(uchwyt(1), 'Linestyle');
get(uchwyt(2), 'Marker');
get(uchwyt(3), 'LineWidth');
%get(gca)
%set(uchwyt(1), 'LineStyle', '--')
%set(uchwyt(1), 'color', 'red')
