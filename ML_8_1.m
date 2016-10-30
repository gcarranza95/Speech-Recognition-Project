%Gerardo Carranza
%2/18/14

w = ones(1:10); % Initialize array of ones 
del_max = 9; %Initialize del_max to 9

R = autocor(w, del_max) %Call autocor function, display array R
stem(0:del_max,R); %Plot stem plot

