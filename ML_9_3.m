
phonemes = ['ah';'ee'; 'er'; 'oo'; 'eh'; 'ih'];
[numR numC] = size(phonemes);
for nphone = 1:numR
    phoneme = phonemes(nphone,:)
    DB = zeros(5,11);
    DBrow = 1;
    for i=1:10
        filename = [phoneme num2str(i) '.dat'];
        humphone = load(filename);
        Rw = autocor(humphone,10);
        DB(DBrow,:) = Rw;
        DBrow=DBrow+1;
    end
    ...
        filenameDB = [phoneme 'DB.dat'];
    save(filenameDB, 'DB', '-ascii') % save data file on disk
end
