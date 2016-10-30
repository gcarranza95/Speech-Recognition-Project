phonemes = ['ah';'ee'; 'er'; 'oo'; 'eh'; 'ih'];

DB3D = zeros(5,11,max(size(phonemes)));
filename='';
for i=1:max(size(phonemes))
    
     filename = [phonemes(i,:) 'DB.dat'];
     pDB = load(filename);
     DB3D(:,:,i)= pDB;
   
end
save('DB3D.dat','DB3D','-ascii')

