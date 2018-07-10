function [dydpsic]=ddpsi(psi,y)

% dy/dpsi = dy/dz * dz/dpsi + dy/dr * dr/dpsi
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
dzc=z(izp1)-z(izm1);
drc=r(irp1)-r(irm1);

%% dy in r direction
dyrc=y(irp1)-y(irm1);

%% dy in z direction
dyzc=y(izp1)-y(izm1);

%% dpsi in r direction
dpsirc=psi(irp1)-psi(irm1);

%% dpsi in z direction
dpsizc=psi(izp1)-psi(izm1);

%% dy/dz, dy/dr

dydzc=dyzc./dzc;
dydrc=dyrc./drc;

%% dpsi/dz, dpsi/dr

dzdpsic=dzc./dpsizc;
drdpsic=drc./dpsirc;

%% dy/dpsi = dy/dz * dz/dpsi + dy/dr * dr/dpsi

dydpsic = dydzc * dzdpsic + dydrc * drdpsic;