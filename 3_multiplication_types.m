%classical Cauchy's matrix multiplication
a = [1 -2 0; 2 3 0; 4 1 2];
b = [-2 1 4; 5 1 2; 1 1 -1];
tic
    x=a*b;
toc


clear all


%element-wise multiplication
a= [1 -2 0; 2 3 0; 4 1 2];
b= [-2 1 4; 5 1 2; 1 1 -1];
tic
    y=a.*b;
toc
