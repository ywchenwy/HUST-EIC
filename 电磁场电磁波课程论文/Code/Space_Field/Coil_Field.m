function [Br,BTh,BPh] = Coil_Field(R,Th,Ph)
% 9个线圈叠加产生的在点（R，Th，Ph）的磁场

num = 9;% 线圈的数量num

% 半径a 单位：mm
a = linspace(32,32+4*num,num)/1000;% 9个线圈的半径

% 电流1000 安培
I = 1000;

Br = zeros(1,num);% 9个线圈产生的9个Br
BTh = zeros(1,num);% 9个线圈产生的9个BTh

for i = 1:num
    Br(i) = GetBr( I,a(i),R,Th,Ph );
    BTh(i) = GetBTh( I,a(i),R,Th,Ph );
end
Br = sum(Br);% 9个线圈的叠加
BTh = sum(BTh);% 9个线圈的叠加
BPh = 0;% Ph方向上恒为0

end