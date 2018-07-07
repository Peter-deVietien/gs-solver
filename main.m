get_mesh

Drr=getDrr(r);
Dzz=getDzz(z);

%% Initialize psi
psi=zeros(nx(1),nx(2));

% Initial Guess
psi=0.01*(1-r.^2).*(1-z.^2);

C = ones(nx(1),nx(2))*2;
dt = .001;
while 1
    dpsidt = Drr*psi + psi*Dzz - C;
    psi(2:end-1,2:end-1) = psi(2:end-1,2:end-1) + dpsidt(2:end-1,2:end-1)*dt
end