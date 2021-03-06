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

for i =1:nx
    for j=1:ny
        n = j+(i-1)*ny;
        if i ==1
            G(n,:)=0;
            G(n,n)=1;
            B(n)=1;
        elseif i==nx
            G(n,:)=0;
            G(n,n)=1;
        elseif j==1
            nxm = j + (i-2)*ny;
            nxp = j+ (i)*ny;
            nyp = j+1 +(i-1)*ny;
            
            rxm = 1;
            rxp = 1;
            ryp = 1;
            
            G(n,n)= -(rxm+rxp+ryp);
            G(n,nxm) = rxm;
            G(n,nxp) = rxp;
            G(n,nyp) = ryp;
        elseif j ==ny
            nxm = j + (i-2)*ny;
            nxp = j+ (i)*ny;
            nyp = j-1 +(i-1)*ny;
            
            rxm = 1;
            rxp = 1;
            ryp = 1;
            
            G(n,n)= -(rxm+rxp+ryp);
            G(n,nxm) = rxm;
            G(n,nxp) = rxp;
            G(n,nyp) = ryp;
        else
            nxm = j +(i-2)*ny;
            nxp = j +(i)*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;
            
            rxm = 1;
            rxp = 1;
            rym = 1;
            ryp = 1;
            
            G(n,n)= -(rxm+rxp+rym+ryp);
            G(n,nxm) = rxm;
            G(n,nxp) = rxp;
            G(n,nym) = rym;
            G(n,nyp) = ryp;
        end
    end
    
    
end
f1 = figure;
f2 = figure;
f3 =figure;
spy(G);
figure(f1)
[E,D] = eigs(G,9,'SM');
subplot(2,1,1)
surf(E)
subplot(2,1,2)
plot(D)
figure(f2)
Emap1 =zeros(nx,ny);
for i = 1:nx
    for j =1:ny
        n = j+(i-1)*ny;
        Emap1(i,j) = E(n);
    end
end
subplot(2,1,1)
surf(Emap1)
Emap2 =zeros(nx,ny);
for i = nx:2*nx
    for j =ny:2*ny
        n = j+(i-1)*ny;
        Emap2(i,j) = E(n);
    end
end
subplot(2,1,2)
surf(Emap2)

