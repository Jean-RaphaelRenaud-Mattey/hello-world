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
V = zeros(nx,ny);
iterations = 100;
for m = 1:nx
    p = m;
    V(p,1) = 1;
    V(p,ny) = 1;
end
for step = 1:iterations
surf(V);
pause(0.01);
for j = 1:ny
    for d = 1:nx
        i = d;
        if j == 1
            V(i,1) = 1;
        elseif j == ny
            V(i,ny) =1;
        elseif i == 1 
            V(1,j) =0;
        elseif i == nx
            V(nx,ny)=0;
        else
            va = V(i+1,j);
            vb = V(i-1,j);
            vc = V(i,j+1);
            vd =V(i,j-1);
            V(i,j) = average(4,va,vb,vc,vd);
        end
    end
end
end