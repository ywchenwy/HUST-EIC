% ��������ʵ��Z���ϵĴų��Ĵ�С

sampleRate = 300;% ȡ����
z=linspace(-150,150,sampleRate)/1000;% Z�᷶Χȡ����150mm

Bz = zeros(1,sampleRate);
for i = 1:sampleRate
    Bz(i) = 2*GetBz( z(i) );% �˴���2 ����Ϊ˫����Ȧ���Խ��Ƶ����������ĵ��Ӽ���
end

figure('Name','Z-axis �ų�','NumberTitle','off');
plot(z,Bz)
