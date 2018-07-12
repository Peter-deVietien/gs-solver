function [dydx]=dydx(y,x)

% dy/dx = dy/dz * dz/dx + dy/dr * dr/dx
% using central differences

get_mesh

%% im = indicies for mesh
linds=1:nx(1)*nx(2);
sinds=reshape(linds,nx(1),nx(2)); %square inds
im=sinds;
im(1,:)=[];
im(end,:)=[];
im(:,1)=[];
im(:,end)=[];

irp1=im+1;
irm1=im-1;

izp1=[im(:,2:end),sinds(2:end-1,end)];
izm1=[sinds(2:end-1,1),im(:,1:end-1)];

%% Central, backward and forward dr and dz
dz=z(izp1)-z(izm1);
dr=r(irp1)-r(irm1);

%% dy
dyr=y(irp1)-y(irm1);
dyz=y(izp1)-y(izm1);

%% dx
dxr=x(irp1)-x(irm1);
dxz=x(izp1)-x(izm1);

%% dy/dz, dy/dr

dydz=dyz./dz;
dydr=dyr./dr;

%% dz/dx, dr/dx

dzdx=dz./dxz;
drdx=dr./dxr;

%% dy/dpsi = dy/dz * dz/dx + dy/dr * dr/dx

dydx = dydz * dzdx + dydr * drdx;