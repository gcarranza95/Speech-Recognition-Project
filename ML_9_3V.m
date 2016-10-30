%Gerardo Carranza
%2/18/14

phonemes = ['ah']; %Iniitialize phonemes array of size 1

j=1;
phoneStr = phonemes(j,:); %Extract string from phonemes array

for i=1:10
    filename = [phoneStr int2str(i) '.dat']; %Acquire file name
    phoneme = load(filename); % load ah#.dat file
    
    t=0:length(phoneme)-1;
    
    plot(t,phoneme,'b'); %Sets color of array to blue, plots array
    axis([0 400 -1 1]); % Sets axes so all graphs are consistent
    grid on; 
    hold on % holds current plot so autocorrelation plot
            % can be superimposed if necessary
    
   
    
    if mod(i,2)== 1
        Rw = autocor(phoneme,10); % Autocorrelation sequence
 
        tr= (0:10)*length(phoneme)/10;
        
        stem(tr,Rw,'r'); %Graphs superimposed plot in red, easier to see
        grid on;
        
       
    end
    
    hold off % return to default mode where previous plots are erased
    
    pause(1)
    
end
