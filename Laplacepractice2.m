clearvars
clearvars -GLOBAL
close all
format shortE

BCL = 1; %voltage at the left side of the Boundary Condition
BCR = 0; %voltage at the right side of the Boundary Condition
%nx = randi([10 100],1);
%ny = randi([10 100],1);
nx =50;
ny = 50;
G = sparse(nx*ny,nx*ny);
B = zeros(1,nx*ny);

for i = 1:nx
    for j =j = 1:ny
        n = j + (i-1)*ny;
        
        if i ==1
            G(n,:)=0;
            G(n,n)=1;
            B(n)=1;
        elseif i==nx
            G(n,:)=0;
            G(n,n)=1;
        elseif j ==1;
            nxm = j+ (i-2)*ny;
            nxp = j+ (i)*ny;
            nyp = j+1 + (i-1)*ny;
            
            rxm =



