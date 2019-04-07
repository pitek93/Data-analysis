%nargin = number of input arguments

function [ result ] = 3_fun_nargin(a, b)
if nargin == 1
    result=a*a;
elseif nargin == 2
    result=a^b;
end

