% ��������Բ�����ߺ�����ֱ�ߵ�Ӱ��
% ���������õ���˫��-9ȦԲ������

sampleRate = 100; % ȡ�ĵ���
aplha=linspace(0,2*pi,sampleRate); % �Ƕȴ�0--2pi
r=linspace(32,32+4*9,9)/1000; % 9��Բ�İ뾶
z = linspace(0,0,sampleRate); % Ĭ�Ͻ�Բ��Բ�Ĺ̶�����άֱ��������ԭ�㴦

% ��ͼ����9��Բ������
figure('Name','Model','NumberTitle','off');
for i = 1:9
    x=r(i)*cos(aplha);
    y=r(i)*sin(aplha);
    plot3(x,y,z,'-');
    hold on
end
