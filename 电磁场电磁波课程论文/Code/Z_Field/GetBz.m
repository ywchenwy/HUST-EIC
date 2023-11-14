function [ Bz ] = GetBz( r )
% �˺���������ʵ�����9����Ȧ��Z���ϵĴų�
a = linspace(32,32+4*9,9)/1000; % �뾶
u0 = 4*pi*10^(-7);
I = 1000;

Temp = zeros(1,9); % 9��Բ��Ȧ�Ĵų�
for i = 1:9
    Temp(i) =  u0*I*a(i)^2/(2*(a(i)^2+r^2)^1.5);
end

Bz = sum(Temp); % ���յ�Bz��Ϊ���еĵ���

end

