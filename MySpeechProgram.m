%Gerardo Carranza
%4/1/14

errCnt = 0; % initialize error count
phonemes = ['ah';'ee'; 'er'; 'oo'; 'eh'; 'ih'];
numPhn = max(size(phonemes));
CM = zeros(numPhn,numPhn); % intialize confusion matrix
recObj = audiorecorder(8000, 8, 1); % initialize microphone


disp('The system is trained for the following sounds') %Initial display
x=(1:6)';
s=num2str(x);
words= [' as in saw- ';' as in bee- ';' as in her- ';' as in boo- ';' as in met- ';' as in sit- ']; %Words
disp([phonemes, words, s])

n=input('Type the  number of the sound you will speak - or 0 to stop- and hit Enter '); %Input phoneme number

while(n~=0)
    error=1;
    while error == 1 %while sound is too soft continue recordings
        disp('Start speaking now') %prompt speaker
        recordblocking(recObj, 2); % record for 2 sec
        disp('End of recording'); % indicate end
        
        signal = getaudiodata(recObj)'; % write data in real-valued array
        
        [s err] = getSeg(signal); % form 401-sample segment      
        error=err; %Once error equals zero, it will extit the while loop
        pause(2)
        Rtest = autocor(s,10);
        
    end
    
    Emin = 1000; %Emin set to large # to not affect later comparison
    candMin = phonemes(2,:);
    
    %Program compares Rtest to the database as in Assignment 12.
    for iCand = 1:numPhn
        
        cand = phonemes(iCand,:);
        candDBfile = [ cand 'DB.dat']; %Extract DB file to be tested
        DBc = load(candDBfile); % Load DB file
        
        for iRow = 1:10
            candR = DBc(iRow, :); %Extracts candidate from DB file
            dif = Rtest - candR; %Compares candidate to test file
            E = dif*dif'; %compute weighted square error
            
            if E <= Emin
                %Chooses candidate from DB file most similar to test file
                Emin = E; %Sets error to minimum error, Emin
                candMin=cand; %Assigns corresponding candidate name
                candNum= iCand; %Assigns corresponding candidate phoneme #
            end
        end
    end
    
    testName=phonemes(n,:); %spoken phoneme name
    %Displays phoneme name(test file) along with the candidate
    %that was the best match
    disp([ 'spoken => ' num2str(testName) ' recognized => ' num2str(candMin)])  
    
    CM(n,candNum) = CM(n,candNum) +1; %Confusion matrix update
    %Display for next input
    n=input('Type the  number of the sound you will speak - or 0 to stop- and hit Enter ');
end

%Final display
disp('     ah    ee    er    oo    eh    ih ')
disp(CM)
