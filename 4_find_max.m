%x = linspace(0, 2, 10000);
x = 0: 0.02: 2

%y = humps(x);
y=sin(x)

plot(x,y);
hold on

[val, idx] = max(y);
plot(x(idx), y(idx), '*r');

