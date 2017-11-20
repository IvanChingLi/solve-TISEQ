format long e
clearvars
global L; global V0; global m; global hb; global xpot;global E;global h;

L=10^-9; m=9.10938291*10^-31;
hb=1.05457172*10^-34; normalization_constant=sqrt(2/L);
ground_state_energy =((hb^2)*(pi^2))/(2*m*L^2);
harmonic_ground_energy=(0.5)*hb*((1/L)*sqrt(2*V0/m));
coulomb_ground_energy=-(2.179*10^-18); %Z=1 for hydrogen,divide by n^2 where n is state

V0=50*ground_state_energy;
interest=10*L;
E=(3^2)*ground_state_energy;

x=0;xpot=0;
u=[normalization_constant -(10^5)*normalization_constant]; %initial condition is u(0)=sqrt(2/L), u'(0)=0
xvec(1)=x;yvec(1,1)=u(1);yvec(1,2)=u(2);count=0; %put x and y into vectors
nx=10^5; h=(interest/2)/nx;
while x<=interest/2 && abs(u(1))<=2*normalization_constant %stop algorithm before it's about to blow up
%     if  E-potential(xpot) < potential(L)/10
%         nx=10^5; h=(interest/2)/nx;
%     elseif E-potential(xpot) < potential(L)/2
%         nx=10^4; h=(interest/2)/nx;
%     else
%         nx=10^3; h=(interest/2)/nx;
%     end
    if x<interest/3
        nx=10^3; h=(interest/2)/nx;
    else
        nx=10^5; h=(interest/2)/nx;
    end
    k1 = TISEQ(x,u); %returns [u' u''] going to be used
    k2 = TISEQ(x+h/2,u+(h/2)*k1);
    k3 = TISEQ(x+h/2,u+(h/2)*k2);
    k4 = TISEQ(x+h,u+h*k3);
    u = u+(h/6)*(k1+2*k2+2*k3+k4) %returns resulting [u u']
    x=x+h
    xpot=xpot+h;
    count=count+1;
    xvec(count)=x;
    yvec(count,1)=u(1);yvec(count,2)=u(2);
end
ysoln=yvec(:,1);
plot(xvec,ysoln)
hold on
for i=1:length(xvec)
    pot(i)=potential(xvec(i));
end
plot(xvec,pot)
hold off
axis([min(xvec) max(xvec) min(ysoln) max(ysoln)])
norm_of_soln = norm(ysoln)
