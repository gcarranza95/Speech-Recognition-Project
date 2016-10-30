%Gerardo Carranza
%2/18/14

function [speechSeg, err] = getSeg(micSpeech)

tau=0.1; % Initialize threshold value
err=0; %Initialize error condition to zero
speechSeg = zeros(1,401);
%% Volume Verification 
if max(abs(micSpeech))>.3    
    

micSpeech=micSpeech/max(abs(micSpeech)); % Normalize micSpeech

%% First and last index value, istrt and iend
for i = 1:length(micSpeech)
    if micSpeech(i)>tau
        istrt = i;                      % remember first i value that exceeds tau
        break                           % exit loop
    end
end

for i = 1:length(micSpeech)
    if micSpeech(length(micSpeech)-i+1)>tau
        iend = length(micSpeech)-i+1; % remember last i value that exceeds tau
        break % exit loop
    end
end


%% Extraction of elements 

imid= round((istrt+iend)/2); %Calculate midpoint value

speechSeg = micSpeech(imid-200:imid+200);% Extract 401 elements about midpoint

else
    err=1;
    disp('The microphone speech was too softly uttered, please try again.');
end
