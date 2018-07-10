clear
get_mesh

Drr=getDrr(r);
Dzz=getDzz(z);

rsq=r.^2;
Drr*rsq
zsq=z.^2;
zsq*Dzz