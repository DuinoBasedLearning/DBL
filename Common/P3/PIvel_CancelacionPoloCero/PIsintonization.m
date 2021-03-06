%% Discrete PI controller for position (pole-cero cancellation)

% Matlab program to automatically calculate the parameters of the
% controller by pole placement

% plant
K0=0.82;
tau0=0.26;

% Sampling time
Ts=0.01;

% Especifications
ts_2=0.8; % settling time with %2 criterion
Tdes=ts_2/4;

% Controller design
Zdes=exp(-Ts/Tdes);
alpha=exp(-Ts/tau0);
Kp=((1-Zdes)/(2*K0))*((1+alpha)/(1-alpha));
Ki=(2/Ts)*Kp*((1-alpha)/(1+alpha));

%% PI Sintonization

% plant
K0=0.82;
tau0=0.26;

% Sampling time
Ts=0.01;

% Especifications
xi=1;
ts_2=0.8; % settling time with %2 criterion
Tdes=ts_2/4;
wn=5.8/(xi*ts_2);

% Controller design
Zdes=exp(-Ts/Tdes);
alpha=exp(-Ts/tau0);
beta=-2*exp(-Ts*xi*wn)*cos(wn*Ts*sqrt(1-xi^2));
gamma=exp(-2*Ts*xi*wn);

Ki_star=(gamma-alpha+beta+(alpha+1))/(2*K0*(1-alpha));
Ki=(2/Ts)*Ki_star;
Kp=((beta+alpha+1)/(K0*(1-alpha)))-Ki_star;



%%
syms gamma alpha beta K0 Ts

Ki_star=(gamma-alpha+beta+(alpha+1))/(2*K0*(1-alpha));
Ki=(2/Ts)*Ki_star;

