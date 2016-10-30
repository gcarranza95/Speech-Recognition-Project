phonemes = ['ah';'ee'; 'er'; 'oo'; 'eh'; 'ih'];
errCnt=0; % Initializes error count 
numPhn=max(size(phonemes));  % number of phonemes

for iPhn=1:numPhn
    
    phnName = phonemes(iPhn,:) %phoneme name
    for iTst=2:2:10
        
        testNameNum = iTst; % test name number
        
        % testFile to be compared to each of the candidates, e.g. ah2.dat
        testFile = [ phnName num2str(testNameNum) '.dat']; 
        
        test = testFile(1:2); %Phoneme name of test file
        speech = load(testFile);
        
        % auto-correlation sequence on even numbered test file
        testR = autocor(speech, 10); 
        
         
        Emin = 1000; %Emin set to large # to not affect later comparison
        candMin = phonemes(2,:);
        
        for iCand = 1:numPhn
            
            cand = phonemes(iCand,:);
            candDBfile = [ cand 'DB.dat']; %Extract DB file to be tested
            DBc = load(candDBfile); % Load DB file
            
            for iRow = 1:5
                candR = DBc(iRow, :); %Extracts candidate from DB file
                dif = testR - candR; %Compares candidate to test file
                E = dif*dif'; %compute weighted square error 
                
                if E <= Emin
                    %Chooses candidate from DB file most similar to test file
                    Emin = E; %Sets error to minimum error, Emin
                    candMin=cand; %Assigns corresponding candidate name
                end
                
            end
            
        end
        
        %Displays phoneme name(test file) along with the candidate
        %(from all 5 rows of the 6 DB files)that was the best match
        disp([ test ' ' candMin]) 
        
        if strcmp(test, candMin) == 0
            %Increments error if phoneme names don't match
            errCnt = errCnt + 1 ; 
            disp (' ') %Display space, easier to see where error occured
        end
        
        
    end
end
errCnt %Final error count