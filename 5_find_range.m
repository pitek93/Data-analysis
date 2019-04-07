%mark values within a range [20..40]

%x = linspace(0,5,1000);
x = 0: 0.1: 5;
y = humps(x);

[val, idx] = find(y>=20 & y<=40);

plot(x,y);
axis([0 2 -1 50])
hold on

h = plot(x(idx), y(idx), 'ro');

%changing handler fields
%gca
%get(h)
%get(h, 'LineWidth')
%set(h)
%set(h, 'LineStyle', '--')
