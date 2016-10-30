%Gerardo Carranza
%3/1/14

EmC=load('EmC.dat'); %loads EmC.dat file
%My one test phoneme file, used to compare to all the other candidates, was
%ah2.dat
for i=1:8
    hold on % allows to superimpose multiple lines in a current plot
    plot(1:10,EmC(i,:)) %%plots Em2 values for each trial(i # of ones in c)
    xlabel('m'); %Represents the mth candidate in the database
    ylabel('Weighted Squared Error'); % Represents goodness of fit measure
    pause(1)
end
 hold off