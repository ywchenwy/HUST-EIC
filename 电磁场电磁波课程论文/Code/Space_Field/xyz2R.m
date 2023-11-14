function [ R,Th,Ph ] = xyz2R( x,y,z )
% 直角坐标系到球坐标系转化

R = (x*x+y*y+z*z)^0.5;
Th = acos(z/R);

Ph = atan2(y,x);
if Ph<0
    Ph = Ph + 2*pi;
end

end
