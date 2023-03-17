clear
close all
clc

normal1 = load('./data/ecg_normal_1.mat');
s1 = normal1.ecg;
Fs1 = normal1.Fs;

normal2 = load('./data/ecg_VF.mat');
s2 = normal2.ecg;
Fs2 = normal2.Fs;

w = hamming(8);
d = 1;
N_fft = 512;

[Sx1,f,t]=spectro(s1,w,d,N_fft,Fs1);

figure,
%subplot(221);
%plot(Sx1);

subplot(121);
imagesc(t,f, 10*log10(Sx1));
h = colorbar;
ylabel(h, 'Power/Frequency(dB/Hz)')
xlabel('time(s)');
ylabel('Frequency(Hz)');
set(gca,'YDir','normal');
title('the ecg-normal-1 spectrogram')

[Sx2,f2,t2]=spectro(s2,w,d,N_fft,Fs2);

%subplot(222);
%plot(Sx2);
subplot(122);
imagesc(t2,f2, 10*log10(Sx2));
h = colorbar;
ylabel(h, 'Power/Frequency(dB/Hz)')
xlabel('time(s)');
ylabel('Frequency(Hz)');
set(gca,'YDir','normal');
title('the ecg-VF spectrogram')