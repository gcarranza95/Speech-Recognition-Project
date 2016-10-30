% define ADC specs: Fs=8000Hz, 8bits , one channel
recObj = audiorecorder(8000, 8, 1);

phonemes = ['ah';'ee'; 'er'; 'oo'; 'eh'; 'ih'];
% 
i=3;
phoneStr = phonemes(i,:)
answer = 1;
%
for f_num =1:10
    % get speech from microphone = micSpeech
    disp('Start speaking now')          % prompt speaker
    recordblocking(recObj,2);          % record for 2 sec
    disp('End of recording');           % indicate end
    micSpeech = getaudiodata(recObj)';
   
    % Create data files from microphone speech
    [speechSeg, err] = getSeg(micSpeech)
    
    if err == 0
        filename = [phoneStr int2str(f_num) '.dat']
        save(filename, 'speechSeg', '-ascii')
        answer = input('Another file (1/0) ')
    end
    if answer == 0
        break
    end
end