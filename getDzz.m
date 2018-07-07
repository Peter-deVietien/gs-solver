function Dzz=getDzz(z)
%% r * d/dr * (1/r * d/dr) = d2/dr2 - 1/r * d/dr

% Loop through D twice, once for d2/dr2 and once for -1/r * d/dr
[ni,nj]=size(z);
D=zeros(nj,nj);

%% d2/dr2
for i = 2:nj-1
    for j = 2:nj-1
        if (i+1)==j
            D(i,j)=1/(r(i+2,j)-r(i,j)) * 1/(r(i+1,j)-r(i,j))
            %D(i,j)='A'
        elseif i==j
            D(i,j)=1/(r(i+1,j)-r(i-1,j)) * 1/(r(i+1,j)-r(i,j)) + ...
                   1/(r(i+1,j)-r(i-1,j)) * 1/(r(i,j)-r(i-1,j));
            D(i,j)=-D(i,j)
            %D(i,j)='B'
        elseif (i-1)==j
            D(i,j)=1/(r(i,j)-r(i-2,j)) * 1/(r(i,j)-r(i-1,j))
            %D(i,j)='C'
        end
    end
end

