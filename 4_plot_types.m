%Plot expression or function
fplot('sin', [0 2*pi]);
clear all

%Easy-to-use function plotter
ezplot('sin', [0 2*pi]);
clear all

%Easy-to-use polar coordinate plotter
ezpolar('sin', [0 2*pi]);
clear all

%2-D line plot
x=0: 0.1: 2*pi;
y=sin(x);
x2=0: 0.1: 2*pi;
y2=cos(x);
plot(x,y, x2,y2, 'm--');
axis([0 2*pi -1.5 1.5]) %limit xmin xmax ymin ymax
xlabel('time[s]');
ylabel('Voltage[v]');
title('Voltage dependence of time');
%text('x', 'y', 'text');

