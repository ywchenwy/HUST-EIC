function [ yy ] = FIR_lowpass( xx,freq,Fs )
% FIR低通滤波器 滤掉频率freq，采样率Fs，原信号xx

w = 2*pi*freq/Fs;
hh = [1,-2*cos(w),1];
yy = filter(hh, 1, xx);
%滤波结束，得到滤波后的信号yy

%滤波器的频率响应
ww = 0:pi/100:2*pi;
HH = freqz(hh, 1 ,ww);

figure('Name','滤波器的频率响应','NumberTitle','off');
subplot(2,1,1);plot(ww,20*log10(abs(HH)));grid on;
title(['滤波去掉的频率：',num2str(freq),'Hz--',num2str(w),'rad']);xlabel('Frequency-(rad)');ylabel('20lg|H(jω)|(dB)');
subplot(2,1,2);plot(ww,angle(HH));grid on;
title(['滤波去掉的频率：',num2str(freq),'Hz--',num2str(w),'rad']);xlabel('Frequency-(rad)');ylabel('arg[H(jω)](rad)');
end
