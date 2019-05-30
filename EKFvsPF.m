%%Introduction to Robotics Assignment
%%Ugur Can Kozan%% 
%%150201025%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x='x(1,:)/2+25*x(1,:)./(1+x(1,:).^2)+8*cos(1.2*t)';
y='x(1,:).^2/20';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m=nl(x,y,[1 0 1 0]);
m.fs=1;
m.x0=10;
m.px0=10;  
m.pv=10;  
m.pe=1;

z=simulate (m ,50) ; %Second parameter for timing.
npf=m; %New object as same as m. 
npf.pe =10*cov(m.pe);%Covariance determination.
lekf = ekf(m,z);%Extended Kalman Filter
lpf=pf(npf,z,'Np' ,1000,'animate','on','sampling','simple');%Particle Filter.
xplot (z,lpf ,lekf ,'conf',90,'view','cont')%Default settings for plotting.
