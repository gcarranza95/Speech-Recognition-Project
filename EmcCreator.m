phonemes= ['ah';'ee'];

phoneTot =size(phonemes,1); %Total number of phonemes

test = filename(1:2);


%Create database
T=zeros(5*phoneTot,11);
for i=1:phoneTot
    phoneStr=phonemes(i,:);
    filenameDB = [phoneStr 'DB.dat'];
    phoneDB = load(filenameDB);
    T(5*i-4:5*i,1:11)=phoneDB;
    
end
%T is the data base acquired from the DB.dat file

f=zeros(10,11);
fileNum=2;
for i=1:phoneTot
    phoneStr = phonemes(i,:);
    for j=1:5
        filename = [phoneStr int2str(fileNum) '.dat'];
        phoneme= load(filename);
        f(j+5*(i-1),:)=autocor(phoneme,10); %f is the set of autocorrelation files extracted
        %from an even numbered phoneme file
        fileNum=fileNum+2;
    end
    fileNum=2;
end

E = zeros(10,10);
c=[1 zeros(1,10)]; %c selects the autocorrelation elements used in the calculation
fn=f(1,:); %1st trial,test phoneme file, ah2.dat
for  n=1:10
    c = c + [zeros(1,n) 1 zeros(1,10-n)];
   
    for m= 1:10
        Tm=T(m,:); % Tm is the nth row in the database(candidate)
        E(n,m)= sum(c.*(fn-Tm).^2);
    end
end

save('EmC.dat','E','-ascii');
EmC=load('EmC.dat');
for i=1:10
    hold on
    plot(EmC(i,:))
    xlabel('m'), ylabel('Weighted Squared Error');
    
end
EmC