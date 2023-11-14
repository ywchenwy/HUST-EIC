function [Br,BTh,BPh] = Coil_Field(R,Th,Ph)
% 9����Ȧ���Ӳ������ڵ㣨R��Th��Ph���Ĵų�

num = 9;% ��Ȧ������num

% �뾶a ��λ��mm
a = linspace(32,32+4*num,num)/1000;% 9����Ȧ�İ뾶

% ����1000 ����
I = 1000;

Br = zeros(1,num);% 9����Ȧ������9��Br
BTh = zeros(1,num);% 9����Ȧ������9��BTh

for i = 1:num
    Br(i) = GetBr( I,a(i),R,Th,Ph );
    BTh(i) = GetBTh( I,a(i),R,Th,Ph );
end
Br = sum(Br);% 9����Ȧ�ĵ���
BTh = sum(BTh);% 9����Ȧ�ĵ���
BPh = 0;% Ph�����Ϻ�Ϊ0

end