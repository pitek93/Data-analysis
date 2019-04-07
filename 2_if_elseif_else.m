%x=-5
%x=6
x=9;

if x < 3
    y = x - 1;
    disp(y);
elseif (x >= 3 ) && ( x < 7)
    y = x * sin(x);
    disp(y);
else
    y = (1 / (x^2 + 1));
    disp(y);
end
