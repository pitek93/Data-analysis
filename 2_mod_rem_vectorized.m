%
x = [3 15 9 12 -1 0 12 9 6 1];


%change values in vector x that are greater than 0 - to 1
x(x>0)=1;


%modulo == remainder but modulo returns only positive values whereas -21/4 returs remainder = -1
%multiply multiplicity of 3 in vector x by 3
x(rem(x,3)==0)=3;

%multiply even values in vector x by 5
x(mod(x,2==0))*=5;


%create vector y with values that are greater than 10
y=x(x>10)
