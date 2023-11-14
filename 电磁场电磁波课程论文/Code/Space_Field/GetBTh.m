function [ BTh ] = GetBTh( I,a,r,Th, Ph)
% 求得磁场的Th方向上的分量

u0 = 4*pi*10^(-7);

BTh = -u0*I*a*a*sin(Th)/(4*(a^2+r^2)^2.5)*(2*a*a-r*r+15*(a*r*sin(Th))^2*(4*a*a-3*r*r)/8/(a*a+r*r)^2);


end