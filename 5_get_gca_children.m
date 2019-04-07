x= linspace(0,5,500);
y1=x-x.^3/6+x.^5/120;
y2=sin(x);
y3=x+1;

plot(x,y1,x,y2,x,y3);


h = get(gca, 'children')

get(h(1), 'LineStyle')
