function [xPitch]=VoiceFeatures(b)
F=fft(b(:,1));
%plot(real(F));
m=max(real (F));
xPitch=find(real(F) == m,1) %find out first istance of maxima

