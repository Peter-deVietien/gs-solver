function Dzz=getDzz(z)

% Loop through D for d2/dz2
[ni,nj]=size(z);
D=zeros(nj,nj);
Dl=zeros(nj,nj);

%% d2/dz2
for i = 2:nj-1
    for j = 2:nj-1
        if (i-1)==j
            D(i,j)=1/(z(i,j+2)-z(i,j+1)) * 1/(z(i,j+1)-z(i,j));
            Dl(i,j)='A';
        elseif i==j
            D(i,j)=1/(z(i,j+1)-z(i,j)) * 1/(z(i,j)-z(i,j-1));
            D(i,j)=-2*D(i,j);
            Dl(i,j)='B';
        elseif (i+1)==j
            D(i,j)=1/(z(i,j)-z(i,j-1)) * 1/(z(i,j-1)-z(i,j-2));
            Dl(i,j)='C';
        end
    end
end

Dzz=D';