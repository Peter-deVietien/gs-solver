function Drr=getDrr(r)
%% r * d/dr * (1/r * d/dr) = d2/dr2 - 1/r * d/dr

% Loop through D twice, once for d2/dr2 and once for -1/r * d/dr
[ni,nj]=size(r);
D=zeros(ni,ni);
Dl=zeros(ni,ni);

%% d2/dr2
for i = 2:ni-1
    for j = 2:ni-1
        if (i+1)==j
            D(i,j)=1/(r(i+2,j)-r(i+1,j)) * 1/(r(i+1,j)-r(i,j));
            %Dl(i,j)='A'
        elseif i==j
            D(i,j)=1/(r(i+1,j)-r(i,j)) * 1/(r(i,j)-r(i-1,j));
            D(i,j)=-2*D(i,j);
            %Dl(i,j)='B'
        elseif (i-1)==j
            D(i,j)=1/(r(i,j)-r(i-1,j)) * 1/(r(i-1,j)-r(i-2,j));
            %Dl(i,j)='C'
        end
    end
end

D2=zeros(ni,ni);
Dl2=zeros(ni,ni);

%% - 1/r * d/dr
for i = 2:ni-1
    for j = 2:ni-1
        if (i+1)==j
            D2(i,j)=1/r(i+1,j) * 1/(r(i+2,j)-r(i,j));
            %Dl2(i,j)='A'
        elseif (i-1)==j
            D2(i,j)=-1/r(i-1,j) * 1/(r(i,j)-r(i-2,j));
            %Dl2(i,j)='C'
        end
    end
end

Dt = D + D2;

Drr=Dt';