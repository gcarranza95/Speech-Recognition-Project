%Gerardo Carranza
%2/18/14
mySpeech= load('my_Speech.dat'); %microphone data file

[ speechSeg, err ] = getSeg(mySpeech) %Call getSeg function
plot(mySpeech)
%This displays Rw and err 