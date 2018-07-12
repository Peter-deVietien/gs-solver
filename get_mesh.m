% nx(1) is r and i direction, nx(2) is z and j direction
nx=[8,8];
rlim=[.01,.5];
zlim=[.01,.5];

rl = linspace(rlim(1),rlim(2),nx(1));
zl = linspace(zlim(1),zlim(2),nx(2));

[zi,ri]=meshgrid(1:nx(1),1:nx(2));
[z,r]=meshgrid(zl,rl);