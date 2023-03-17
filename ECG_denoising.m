clear
close all

file = load('/net/t/aolivie003/Desktop/ts114-15820/data/ecg_noisePL.mat')

figure
subplot(221),plot(file.ecg)
title('fichier loaded')
xlabel('time s')
ylabel('fequence herz')
xlim([0*10^4, 5.2*10^4])

Fs = file.Fs; % sample rate in herz
SD  = file.ecg; % sample data dans vecteur SD
SD_N = numel(SD); % Nomber of element of vector SD
t = 1/Fs; % sampling period
f = Fs*(0:(SD_N/2))/SD_N; % sampling frequency


N = length(SD); % variable de la longeur du fichier
N_fft = fft(SD) % TTF du nombre de sample date du vecteur SD

S = (fft(SD(1:N), N_fft)); % définition de la fft 

subplot(222),plot(abs(S))
title('TTF with absolute values')
xlabel('frequence hz')
ylabel('power')
xlim([-500, 10500])

S_shift = fftshift(S); 
k_shift = ((-N_fft/2:N_fft/2 -1)); % zero-centered frequency range

subplot(223),plot(k_shift,abs(S_shift))
title('TTF zero-centered with absolute values')
xlabel('frequence hz')
ylabel('power')

