% 单独用于实现Z轴上的磁场的大小

sampleRate = 300;% 取点数
z=linspace(-150,150,sampleRate)/1000;% Z轴范围取上下150mm

Bz = zeros(1,sampleRate);
for i = 1:sampleRate
    Bz(i) = 2*GetBz( z(i) );% 此处×2 是因为双层线圈可以近似当场是两倍的叠加即可
end

figure('Name','Z-axis 磁场','NumberTitle','off');
plot(z,Bz)
