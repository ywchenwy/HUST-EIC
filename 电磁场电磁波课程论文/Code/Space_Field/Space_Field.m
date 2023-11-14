% ���һ��z��xyƽ��ķ�Χ�ڵĴų��ֲ�

sampleRate = 200;% ȡ����
xylen = 100; %x�ᡢy��ķ�Χ����

x = linspace(-xylen,xylen,sampleRate)/1000;
y = linspace(-xylen,xylen,sampleRate)/1000;
z = ones(1,sampleRate*sampleRate)*150/1000;

% �������� �����±ߵļ���ͺ���Ļ�ͼ����
[X,Y] = meshgrid(x,y);
x = reshape(X,[1,sampleRate*sampleRate]);
y= reshape(Y,[1,sampleRate*sampleRate]);

% ���е�Ĵų���������
Bx = zeros(1,sampleRate*sampleRate);
By = zeros(1,sampleRate*sampleRate);
Bz = zeros(1,sampleRate*sampleRate);

for i = 1:sampleRate*sampleRate
    [R,Th,Ph] = xyz2R( x(i),y(i),z(i) );% ����ת��
    [Br,BTh,BPh] = Coil_Field(R,Th,Ph);% ��øõ㴦�ĵ���9��Ȧ���Ӵų�����
    [Bx(i),By(i),Bz(i)] = R2xyz(2*Br,2*BTh,2*BPh);% ����ת������2����Ϊ������Ȧ��
end

% ��ά����ͼ
figure('Name','��ά����ͼ','NumberTitle','off');
quiver3(x,y,z,Bx,By,Bz);

% α��ͼ
figure('Name','α��ͼ','NumberTitle','off');
B = (Bx.^2+By.^2+Bz.^2).^0.5; % �ų���СB
B = reshape(B,[sampleRate,sampleRate]);
pcolor(X,Y,B);
colorbar

% ����ͼ�µĵȸ���ͼ
figure('Name','�ȸ���','NumberTitle','off');
surfc(X,Y,B);
colorbar
