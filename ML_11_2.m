DB3D= load('DB3D');
%reshape(DB3D, [ 5 11 6]);

phonemes = ['ah';'ee'; 'er'; 'oo'; 'eh'; 'ih'];

for i=1:max(size(phonemes))
    testPhonName= phonemes(i,:)
    for j=2:2:10
        test= load([testPhonName int2str(j) '.dat']);
        testR= autocor(test,10);
        
        DB3size= size(DB3D)
        Emin=1000;
        
        for k=1:DB3size(3)
            for m=1:DB3size(1)
                candD= autocor(DB3D(m,:,k))
                dif= testR -candD;
                
                E = dif(1:numR)*dif(1:numR)'; %compute weighted square error
                
                if E <= Emin
                    %Chooses candidate from DB file most similar to test file
                    Emin = E; %Sets error to minimum error, Emin
                    DB3num=k;          %Assigns corresponding candidate name
                end
            end
        end
        
        DB3name=phonemes(k,:)
        disp(['test: ' testPhonName 'matched to candidate: ' DB3name])
        if strcmp(testPhonName, DB3name) == 0
            %Increments error if phoneme names don't match
            errCnt = errCnt + 1; 
            %disp (' ') %Display space, easier to see where error occured
        end
        
    end
end

errCnt