clear all;
close all;
clc;
%% Input for testing
name=input('Whose file do you want to run? Enter name: ','s')
file=strcat('E:\6thSem\dsp\VoiceRecognition\test\',name,'.wav');
b=audioread(file);
%% Feature Extraction
FE=VoiceFeatures(b);
%% Classify
load database
D=[];
for(i=1:size(F,1))%returns the length of 1st dimension of F
    d=sum(abs(F(i)-FE));
    D=[D d];
end
%% Smallest distance
sm=inf;
ind=-1;
for(i=1:length(D))
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
%% Output
file_number=FN(ind);
sc=strcat('The file number of ', name, ' in training is: ');
disp(sc)
file_number
%% Plotting
%test file
[t,x]=audioread(file);
subplot(2,1,1)
plot(abs(t(:,1)))
xlabel('Time')
ylabel('Amplitude')
title('TEST')
%train file
subplot(2,1,2)
filet=strcat('E:\6thSem\dsp\VoiceRecognition\train\a',num2str(file_number), '.wav');
[v,s]=audioread(filet);
plot(abs(v(:,1)))
xlabel('Time')
ylabel('Amplitude')
title('TRAIN')
%Pitch
figure(2);
plot(real(fft(v)))
title('PITCH')

