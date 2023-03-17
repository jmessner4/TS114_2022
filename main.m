clear
close all
%clc

normal1 = load('./data/ecg_normal_3.mat');
s1 = -normal1.ecg;
Fs1 = normal1.Fs;

N_fft=512;
w=rectwin(60);
N=length(w);

%The picture of the signal for some periods
figure,
plot(s1(1:1000))
title('s1');

%Low Pass Filter

Spb=Low_Pass(s1);
%Spb = circshift(Spbdec,[1,]);
NormSpb=norm(Spb);

figure,
subplot(221)
plot(Spb(1:1000)/NormSpb)

%High Pass Filter

Sph=high_pass(Spb);
NormSph=norm(Sph);

subplot(222)
plot(Sph(1:1000)/NormSph)


%Derivation

Sdiff=differentiation(Sph,Fs1);
NormSdiff=norm(Sdiff);
subplot(223)
plot(Sdiff(1:1000)/NormSdiff)

%Absolute and power by two

Sabs = abs(Sdiff);
Ssqr=Sabs.^2;
NormSsqr=norm(Ssqr);
subplot(224)
plot(Ssqr(1:1000)/NormSsqr)

%Moving-Window Integration

Smov=Smwi(Ssqr,N);
NormSmov=norm(Smov);
% figure,
% plot(Smov(1:1000)/NormSmov)


%Thresholding

Sthrdec=thresholding(Smov);
dec = 10;
Sthr = decal(Sthrdec,dec,s1);
% figure,
% plot(Sthr(1:1000));

%Maximum detection
R1 = R(s1,Sthr);
figure,
plot(R1(1:1000));
title('R detection');


%Q and S detection

Q = Qdetection(s1,R1);
NormQ = norm(Q);
% figure,
% plot(Q(1:1000)/NormQ);
% title('Q detection');

            
S = Sdetection(s1,R1);
NormS = norm(S);

figure,
plot(S(1:1000)/NormS);
title('S detection');

%P Detection

P=Pdetection(s1,R1,Q,S);
NormP = norm(P);
figure,
plot(P(1:1000)/NormP);
title('P detection');

%T Detection

T=Tdetection(s1,R1,Q,S);
NormT=norm(T);
figure,
plot(T(1:1000)/NormT)
title('T detection')

%Ectopic Beats

EtcBts=EctopicBeats(R1);

% Arrythmia detection

[Deltas, MeanDelta,diag] = arrhythmia(R1,Fs1);
if diag==0
    disp("Tout va bien");
elseif diag==1
    disp("Attention, Bradycardia detected");
elseif diag==2
    disp("Attention, Tachycardia detected");
end



%AF
AF = zeros(1,100);
for k=1:100
    AF(k) = atrial_fibrillation(k,Deltas,MeanDelta);
end

