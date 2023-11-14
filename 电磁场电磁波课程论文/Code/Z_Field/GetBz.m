function [ Bz ] = GetBz( r )
% 此函数是用于实现求得9个线圈在Z轴上的磁场
a = linspace(32,32+4*9,9)/1000; % 半径
u0 = 4*pi*10^(-7);
I = 1000;

Temp = zeros(1,9); % 9个圆线圈的磁场
for i = 1:9
    Temp(i) =  u0*I*a(i)^2/(2*(a(i)^2+r^2)^1.5);
end

Bz = sum(Temp); % 最终的Bz即为所有的叠加

end

