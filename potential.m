function output = potential(x)
%one-dimensional potential well
global V0; global L; global h;

%square potential
if or(x<-L/2,x>L/2)
    output = V0; %potential outside well is V0
else
    output = 0; %potential inside well is 0
end

%parabolic potential
%output = V0*((x/L)^2);
%^analogous to square well, potential=V0 at x=L

%Coulomb potential
% if x==0
%     output = -(7.45795*10^-51)*(1/(x+h));
% else
%     output = -(7.45795*10^-51)*(1/x);
% end
%^analogous to square well, potential=V0 at x=L
