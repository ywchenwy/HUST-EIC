% 求出一定z的xy平面的范围内的磁场分布

sampleRate = 200;% 取点数
xylen = 100; %x轴、y轴的范围长度

x = linspace(-xylen,xylen,sampleRate)/1000;
y = linspace(-xylen,xylen,sampleRate)/1000;
z = ones(1,sampleRate*sampleRate)*150/1000;

% 生成网格 便于下边的计算和后面的画图操作
[X,Y] = meshgrid(x,y);
x = reshape(X,[1,sampleRate*sampleRate]);
y= reshape(Y,[1,sampleRate*sampleRate]);

% 所有点的磁场各个分量
Bx = zeros(1,sampleRate*sampleRate);
By = zeros(1,sampleRate*sampleRate);
Bz = zeros(1,sampleRate*sampleRate);

for i = 1:sampleRate*sampleRate
    [R,Th,Ph] = xyz2R( x(i),y(i),z(i) );% 坐标转换
    [Br,BTh,BPh] = Coil_Field(R,Th,Ph);% 求得该点处的单层9线圈叠加磁场分量
    [Bx(i),By(i),Bz(i)] = R2xyz(2*Br,2*BTh,2*BPh);% 坐标转换（×2是因为两层线圈）
end

% 三维向量图
figure('Name','三维向量图','NumberTitle','off');
quiver3(x,y,z,Bx,By,Bz);

% 伪彩图
figure('Name','伪彩图','NumberTitle','off');
B = (Bx.^2+By.^2+Bz.^2).^0.5; % 磁场大小B
B = reshape(B,[sampleRate,sampleRate]);
pcolor(X,Y,B);
colorbar

% 曲面图下的等高线图
figure('Name','等高面','NumberTitle','off');
surfc(X,Y,B);
colorbar
