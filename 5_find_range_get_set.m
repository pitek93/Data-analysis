% set values [0.9...1.2] and [2.5...2.9] to 0 (use different style)

t = linspace(0,pi,50);
x=t.*sin(t);
hL = line(t,x);

[idx] = find(t>=0.9 & t<=1.2);
x(idx) = 0;

[idx] = find(t>=2.5 & t<=2.9);
x(idx) = 0;	

get(hL);
set(hL, 'LineStyle', 'o');
set(hL, 'LineStyle', '--');
set(hL, 'Color', 'k');
set(hL, 'YData', x);

hold on

