% 忽略两段圆弧导线和两段直线的影响
% 起主导作用的是双层-9圈圆环导线

sampleRate = 100; % 取的点数
aplha=linspace(0,2*pi,sampleRate); % 角度从0--2pi
r=linspace(32,32+4*9,9)/1000; % 9个圆的半径
z = linspace(0,0,sampleRate); % 默认将圆的圆心固定在三维直角坐标轴原点处

% 画图画出9个圆环导线
figure('Name','Model','NumberTitle','off');
for i = 1:9
    x=r(i)*cos(aplha);
    y=r(i)*sin(aplha);
    plot3(x,y,z,'-');
    hold on
end
