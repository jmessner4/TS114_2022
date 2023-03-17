%création de la fonction spectro
function [Sx, f, t] = spectro(x,w,d,N_fft,Fs)


L = length(x);
M=floor(L/d);
N=5;
m=0:M*d;
[STFT_X,f,t]=stft(x,w,d,N_fft,Fs);


Sx=zeros(N_fft,M); %on fabrique une matrice de N_fft lignes et M colonnes 
for i=1:N_fft
    for j=1:M
        Sx(i,j)=(1/N)*(abs(STFT_X(i,j))*abs(STFT_X(i,j)));
    end
end

