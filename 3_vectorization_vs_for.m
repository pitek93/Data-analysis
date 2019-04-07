% x = from : step : to
% x = linspace(from, to, number_of_points)


%vectorized implementation
n = 150000;
a = 0;
b = 2 * pi;
tic
    x = 0 : (b-a)/n : 2*pi;
    y = cos(x);
toc


clear all


%using for loop implementation
n = 150000;
a = 0;
b = 2 * pi;
tic
    for i = 1 : n
        x(i) = a + (i-1) * ((b-a)/n);
        y(i) = cos(x(i));
    end
toc
