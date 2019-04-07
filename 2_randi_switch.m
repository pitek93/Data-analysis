%x = 10 * [0..1](1D)
x=10*rand(1);

% rand integer from 0..10 with 1x1 Dim
x=randi([0 10],1,1)

disp(['you have drawn ', num2str(x)])

switch(x)
    case 1
        y=sin(x);
        disp(['the sine of x is', y]);
    otherwise
        y=tan(x);
        disp(['the tangent of x is', y]);
end
