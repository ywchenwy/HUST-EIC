function [ yy ] = FIR_lowpass( xx,freq,Fs )
% FIR��ͨ�˲��� �˵�Ƶ��freq��������Fs��ԭ�ź�xx

w = 2*pi*freq/Fs;
hh = [1,-2*cos(w),1];
yy = filter(hh, 1, xx);
%�˲��������õ��˲�����ź�yy

%�˲�����Ƶ����Ӧ
ww = 0:pi/100:2*pi;
HH = freqz(hh, 1 ,ww);

figure('Name','�˲�����Ƶ����Ӧ','NumberTitle','off');
subplot(2,1,1);plot(ww,20*log10(abs(HH)));grid on;
title(['�˲�ȥ����Ƶ�ʣ�',num2str(freq),'Hz--',num2str(w),'rad']);xlabel('Frequency-(rad)');ylabel('20lg|H(j��)|(dB)');
subplot(2,1,2);plot(ww,angle(HH));grid on;
title(['�˲�ȥ����Ƶ�ʣ�',num2str(freq),'Hz--',num2str(w),'rad']);xlabel('Frequency-(rad)');ylabel('arg[H(j��)](rad)');
end
