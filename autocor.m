%Gerardo Carranza
%2/18/14

function [ R ] = autocor( w, del_max )
%The autocorrelation sequence indicates how values separated 
%by and index value delta,called the lag, are related

R = zeros(1,del_max+1); % Initialize array of zeroes

for i = 1:del_max+1
    R(i) = w(1:length(w)-i+1)*w(i:length(w))';  %Inner product
end

R=R/max(R); % Normalize array R to max value of 1

end

