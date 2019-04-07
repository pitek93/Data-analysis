%different plot arrangement

choice=input('press 0 for 3 charts on a single plot, or 1 for 3 subplots');

x=linspace(-2*pi, 2*pi, 100);
y1=sin(x);
y2=sin(x).^2;
y3=sin(x).^3;

if choice == 1
    plot(x, y1, 'r', x, y2, 'b--', x, y3, 'k.');
elseif wybor == 0
    %3 rows, 1 column, position [1..n] 1 is top left, n is bottom rigt
    subplot(3,1,1);
    plot(x, y1, 'r');
    hold on
    
    subplot(3,1,2);
    plot(x, y2, 'b--');
    hold on
    
    subplot(3,1,3);
    plot(x, y3, 'k.');
    hold on
end
