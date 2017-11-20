function output = TISEQ(x,y)
global m; global hb; global E;global xpot;
y1=y(1);
y2=y(2);
output = [y2  (2*m/hb^2)*(potential(xpot)-E)*y1];
%^intentionally make into row vector because want one column to be u and
%one column to be u'
