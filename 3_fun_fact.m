%factorial function
%function [y1,...,yN output_args] = function_name(x1,...,xM input_args)

function [result] = 3_fun_fact(n)
    result = 1;
    for i = 1 : n
        result = result * i;
    end
end

