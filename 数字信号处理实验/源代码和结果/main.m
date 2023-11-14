[xx, fs] = audioread('SunshineSquare.wav');%wav�ļ�����

%xx = (xx(85000:end));%��Ϊԭ�źź���������д�

N = length(xx);%NΪȡ���������
n=(0:N-1);
t = n/fs;%ʱ����
f = n*fs/N;%Ƶ����
w = n*2*pi/N;%��Ƶ����
xxSpectrum=abs(fft(xx,N));%���ٸ���Ҷ�任�õ�Ƶ��ͼ

figure('Name','ԭ�ź�ʱ�����','NumberTitle','off');
subplot(2,1,1); plot(n,xx);
title('ԭ����ʱ����');xlabel('time(Sample)--n');ylabel('Amp');grid on;
subplot(2,1,2); plot(t,xx); 
title('ԭ����ʱ����');xlabel('time(s)');ylabel('Amp');grid on;

figure('Name','ԭ�ź�Ƶ�����','NumberTitle','off');
subplot(2,1,1);plot(f,xxSpectrum);grid on;
title('ԭ����Ƶ�ʲ���');xlabel('Freq.(Hz)');ylabel('Amp');
subplot(2,1,2);plot(w,xxSpectrum);grid on;
title('ԭ����Ƶ�ʲ���');xlabel('Freq.(rad)');ylabel('Amp');

%�����۲��źŵ�Ƶ��ͼ������ȷ������Ƶ������Ҫ�˳��Ĳ���
f1 = [0,1575,3150,4725];
yy = xx;
yy = FIR_lowpass( yy,f1(1),fs );
yy = FIR_lowpass( yy,f1(2),fs );
yy = FIR_lowpass( yy,f1(3),fs );
yy = FIR_lowpass( yy,f1(4),fs );
yyfft = abs(fft(yy,N));

figure('Name','�˲����źŵ�ʱ���Ƶ�����','NumberTitle','off');
subplot(2,1,1);plot(t,yy);grid on;
title('�˲��������źŵ�ʱ����');xlabel('time(s)');ylabel('Amp');
subplot(2,1,2);plot(f,yyfft);grid on;
title('�˲��������źŵ�Ƶ����');xlabel('Freq.(Hz)');ylabel('Amp');

%����˲�֮��Ľ������ΪAfter_Filter.wav
audiowrite('After_Filter.wav',yy,fs);

%�����������ٴ��ֶ��˳�ĳЩ�޷�ͨ���˲��˳��ļ�������
%���������ֵ����0.5��ֱ�ӹ���
for i = 1:N
    if abs(yy(i)) > 0.5
        yy(i) = 0;
    end
end

figure('Name','�˲����ٷ������źŵ�ʱ���Ƶ�����','NumberTitle','off');
subplot(2,1,1);plot(t,yy);grid on;
title('�����źŵ�ʱ����');xlabel('time(s)');ylabel('Amp');
subplot(2,1,2);plot(f,yyfft);grid on;
title('�����źŵ�Ƶ����');xlabel('Freq.(Hz)');ylabel('Amp');

%��������յĽ��Ultimate.wav
audiowrite('Ultimate.wav',yy,fs);
