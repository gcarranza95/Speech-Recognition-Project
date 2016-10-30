%Gerardo Carranza
%3/1/14

Em2=load('Em2.dat'); %loads Em2.dat file

for i=1:10
    hold on % allows to superimpose multiple lines in a current plot
    plot(1:10,Em2(i,:)); %plots Em2 values for each row/trial
    xlabel('m'); %Represents the mth candidate in the database
    ylabel('Weighted Squared Error'); % Represents goodness of fit measure
    pause(1)
end

hold off

