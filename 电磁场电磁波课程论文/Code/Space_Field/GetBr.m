function [ Br ] = GetBr( I,a,r,Th, Ph)
% ��ôų���r�����ϵķ���

u0 = 4*pi*10^(-7);

Br = u0*I*a*a*cos(Th)/(2*(a*a+r*r)^1.5)*(1+15*(a*r)^2*sin(Th*Th)/4/(a*a+r*r)^2);


end

