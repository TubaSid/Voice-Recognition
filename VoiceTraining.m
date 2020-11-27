clear all;
close all;
clc;
%% Store Features
for i=1:13
    filename=strcat('E:\6thSem\dsp\VoiceRecognition\train\a',num2str(i),'.wav');
    b = audioread(filename);
   
    FE=VoiceFeatures(b);
try
    load database
    F=[F;FE];
    FN=[FN;i];
    database=[database;F;FN];
    save database.mat database F FN
catch
     F=FE;%F=features
     FN=i;
    save database F FN
end
end


