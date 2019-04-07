%y= ax^2 + bx + c
a=input('input a ');
b=input('input b ');
c=input('input c ');

delta = b.^2 - (4*a*c);

%negation
if a ~=0
    if delta >= 0
        x1 = (-b - sqrt(delta)) / (2*a);
        x2 = (-b + sqrt(delta)) / (2*a);
        disp(['root of quadratic equation is ', x1, 'and ', x2]);
    elseif delta == 0
        x = -c/b;
	disp(['root of linear equation ', x]);
    else
        disp('contradictory equation');
    end
elseif a == 0
   disp('contradictory equation');
end
