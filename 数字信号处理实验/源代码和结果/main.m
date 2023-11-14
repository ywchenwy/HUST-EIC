[xx, fs] = audioread('SunshineSquare.wav');%wav文件读入

%xx = (xx(85000:end));%此为原信号后边噪声集中处

N = length(xx);%N为取样点的总数
n=(0:N-1);
t = n/fs;%时间轴
f = n*fs/N;%频率轴
w = n*2*pi/N;%角频率轴
xxSpectrum=abs(fft(xx,N));%快速傅里叶变换得到频谱图

figure('Name','原信号时域分析','NumberTitle','off');
subplot(2,1,1); plot(n,xx);
title('原语音时域波形');xlabel('time(Sample)--n');ylabel('Amp');grid on;
subplot(2,1,2); plot(t,xx); 
title('原语音时域波形');xlabel('time(s)');ylabel('Amp');grid on;

figure('Name','原信号频域分析','NumberTitle','off');
subplot(2,1,1);plot(f,xxSpectrum);grid on;
title('原语音频率波形');xlabel('Freq.(Hz)');ylabel('Amp');
subplot(2,1,2);plot(w,xxSpectrum);grid on;
title('原语音频率波形');xlabel('Freq.(rad)');ylabel('Amp');

%经过观察信号的频谱图，可以确定下列频率是需要滤除的部分
f1 = [0,1575,3150,4725];
yy = xx;
yy = FIR_lowpass( yy,f1(1),fs );
yy = FIR_lowpass( yy,f1(2),fs );
yy = FIR_lowpass( yy,f1(3),fs );
yy = FIR_lowpass( yy,f1(4),fs );
yyfft = abs(fft(yy,N));

figure('Name','滤波后信号的时域和频域分析','NumberTitle','off');
subplot(2,1,1);plot(t,yy);grid on;
title('滤波后语音信号的时域波形');xlabel('time(s)');ylabel('Amp');
subplot(2,1,2);plot(f,yyfft);grid on;
title('滤波后语音信号的频域波形');xlabel('Freq.(Hz)');ylabel('Amp');

%输出滤波之后的结果命名为After_Filter.wav
audiowrite('After_Filter.wav',yy,fs);

%经分析可以再次手动滤除某些无法通过滤波滤除的几个噪声
%即振幅绝对值大于0.5的直接归零
for i = 1:N
    if abs(yy(i)) > 0.5
        yy(i) = 0;
    end
end

figure('Name','滤波后再分析后信号的时域和频域分析','NumberTitle','off');
subplot(2,1,1);plot(t,yy);grid on;
title('语音信号的时域波形');xlabel('time(s)');ylabel('Amp');
subplot(2,1,2);plot(f,yyfft);grid on;
title('语音信号的频域波形');xlabel('Freq.(Hz)');ylabel('Amp');

%在输出最终的结果Ultimate.wav
audiowrite('Ultimate.wav',yy,fs);
