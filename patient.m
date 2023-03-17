clear all
close all
clc

normal1 = load('./data/PatientData.mat');
ecg = normal1.ecg;
Fs1 = 200;

disp('Patient 1');
s1 = ecg{1,1};
Signal = resample(s1,1,5);
w = rectwin(60);
HumanPatient(Signal,Fs1,w);

disp('Patient 2');
s2 = ecg{2,1};
Signal = resample(s2,1,5);
w = rectwin(60);
HumanPatient(Signal,Fs1,w);

disp('Patient 3');
s3 = ecg{7,1};
Signal = resample(s3,1,5);
w = rectwin(60);
HumanPatient(Signal,Fs1,w);