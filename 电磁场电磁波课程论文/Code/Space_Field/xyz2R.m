function [ R,Th,Ph ] = xyz2R( x,y,z )
% ֱ������ϵ��������ϵת��

R = (x*x+y*y+z*z)^0.5;
Th = acos(z/R);

Ph = atan2(y,x);
if Ph<0
    Ph = Ph + 2*pi;
end

end
