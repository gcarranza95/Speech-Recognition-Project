phonemes= ['ah';'ee'];

phoneTot =size(phonemes,1); %Total number of phonemes

%test = filename(1:2);


%Create database
T=zeros(5*phoneTot,11);
for i=1:phoneTot
    phoneStr=phonemes(i,:);
    filenameDB = [phoneStr 'DB.dat'];
    phoneDB = load(filenameDB);
    T(5*i-4:5*i,1:11)=phoneDB;
    
end
%T is the data base acquired from the DB.dat file

c=ones(1,11); %c selects the autocorrelation elements used in the calculation
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

for n= 1:10
    fn=f(n,:);
        
    for m=1:10
        Tm=T(m,:); % Tm is the mth row in the database
        E(n,m)= sum(c.*(fn-Tm).^2);
    end
    
end

save('Em2.dat','E','-ascii');
Em2=load('Em2.dat')
for i=1:10
    hold on 
    plot(1:10,Em2(i,:))
    xlabel('m'), ylabel('Weighted Squared Error');
    
end

