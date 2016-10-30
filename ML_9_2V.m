%Gerardo Carranza
%2/18/14

phonemes = ['ah']; % Initialize phonemes array (size of 1 for this assignment)

i=1;
phoneStr = phonemes(i,:) %Initialize phoneStr to name of phoneme


for i=1:10
    filename = [phoneStr int2str(i) '.dat'] %ah#.dat file name
    phoneme = load(filename); %load ah#.dat file
    
    t=0:length(phoneme)-1; %Set interval from 0 to 400
    
    subplot(5,2,i),plot(t,phoneme); %Plot 401 point array 
    title(filename); %Title each ah#.dat file
    
end
