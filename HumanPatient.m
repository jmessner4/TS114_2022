function HumanPatient(Signal,Fs,w)

N=length(w);

%Low Pass Filter

Spb=Low_Pass(Signal);

%High Pass Filter

Sph=high_pass(Spb);

%Derivation

Sdiff=differentiation(Sph,Fs);

%Absolute and power by two

Sabs = abs(Sdiff);
Ssqr=Sabs.^2;

%Moving-Window Integration

Smov=Smwi(Ssqr,N);

%Thresholding

Sthrdec=thresholding(Smov);
dec = 10;
Sthr = decal(Sthrdec,dec,Signal);

%R detection
R1 = R(Signal,Sthr);
Rind = find(R1~=0);
Raff = zeros(1,length(Rind));
for i=1:length(Rind)
    Raff(i) = R1(Rind(i));
end

%Q and S detection

Q = Qdetection(Signal,R1);
Qind = find(Q~=0);
Qaff = zeros(1,length(Qind));
for i=1:length(Qind)
    Qaff(i) = Q(Qind(i));
end
            
S = Sdetection(Signal,R1);
Sind = find(S~=0);
Saff = zeros(1,length(Sind));
for i=1:length(Sind)
    Saff(i) = S(Sind(i));
end

%P Detection

P=Pdetection(Signal,R1,Q,S);
Pind = find(P~=0);
Paff = zeros(1,length(Pind));
for i=1:length(Pind)
    Paff(i) = P(Pind(i));
end

%T Detection

T=Tdetection(Signal,R1,Q,S);
Tind = find(T~=0);
Taff = zeros(1,length(Tind));
for i=1:length(Tind)
    Taff(i) = T(Tind(i));
end

%Ectopic Beats

RRDelt = RRinter(R1);
% figure,
% histogram(RRDelt);
thresholdecto = 200;
Ecto = EctopicBeats(R1,thresholdecto);
k=0;
for i=1:length(Ecto)
    if Ecto(i)==1
        k=1;
    end
end

if k==1
    disp("Ectopic Beats detected");
end

% Arrythmia detection

[Deltas, MeanDelta,bpm,diag] = arrhythmia(R1,Fs);
if diag==0
    disp("Everything is fine");
elseif diag==1
    disp("Warning, Bradycardia detected");
elseif diag==2
    disp("Warning, Tachycardia detected");
end
bpm

%AF
AF = zeros(1,100);
for k=1:100
    AF(k) = atrial_fibrillation(k,Deltas,MeanDelta);
end

%% Display

i=1;
while Rind(i+1)<1000
    i = i+1;
end

j=1;
while Pind(j+1)<1000
    j = j+1;
end

k=1;
while Tind(k+1)<1000
    k = k+1;
end

figure,
plot(Signal(1:1000));
xlabel('Time in s');
ylabel('Frequency');
title('ECG patient');
hold on,
plot(Rind(1:i),Raff(1:i),'*');
hold on, 
plot(Sind(1:i),Saff(1:i),'*');
hold on,
plot(Qind(1:i),Qaff(1:i),'*');
hold on,
plot(Pind(1:j),Paff(1:j),'*');
hold on,
plot(Tind(1:k),Taff(1:k),'*');
legend('ECG','R','S','Q','P','T');
