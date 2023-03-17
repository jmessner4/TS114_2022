function [X, f, t] = stft(x,w,d,N_fft,Fs)
% This function computes the stft for m = [0, d, 2d, 3d...]
% This function outputs are:
% -> X, which is a matrix of n_fft lines and M columns
%M is the number of elements of m
%X(i,j) is the value of the spectrogram for time t(i) and frequency f(j)
% -> f, is a column vector of the frequencies (in Hz)
% -> t, is a row vector containing the times of the beginning of the windows

L = length(x);
N = length(w);
M = floor(L/d);
A = zeros(d,M);
for i=1:M-1 %Framing step
    for j=1:N
        if (i*d +j)<= L
            A(j,i) = x(i*d +j);
        end
    end
end

for i= 1:M-1 %Windowing step
    A(:,i) = transpose(w.*A(:,i));
end

X = zeros(N_fft,M);
f = (1:N_fft);
t = (1:M-1)*d/Fs;

for i=1:M-1
    X(:,i) = fft(A(:,i),N_fft);
end
for i=1:N_fft-1
    f(i) = (i/N_fft)*Fs;
end
