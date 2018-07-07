% nx(1) is r and i direction, nx(2) is z and j direction
nx=[5,7];
rlim=[0,10];
zlim=[-1,1];

rl = linspace(rlim(1),rlim(2),nx(1));
zl = linspace(zlim(1),zlim(2),nx(2));

[z,r]=meshgrid(zl,rl);