%x is random value from range [0..8] of 1 dimension
x=8*rand(1);

if x < 4
    x = 0;
else
    x = 1;
end

disp(x)
