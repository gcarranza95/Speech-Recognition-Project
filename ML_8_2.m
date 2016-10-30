%Gerardo Carranza
%2/18/14

%% W Array
Fs=8000; Ts=1000/Fs; r=.975;%Set sampling freq, sample period (ms), decay rate

F1=270; F2=2290; F3=3010; % Set frequencies F1,F2,F3

mpf = 100; % male pitch frequency in Hz
mpitchPeriod = round(Fs/mpf); % male pitch period in terms of sample values
% round to form integer

d=[1 zeros(1,mpitchPeriod-1)]; % array d of one followed by zeroes
d = [d d d d d]; %Concatenate d several times to make 400 point array 

u=AR(d,F1,r); v=AR(u,F2,r);w=AR(v,F3,r); %Apply d to AR functions

w=w/max(abs(w)); % Normalize w to max absolute value of 1

t=(0:length(d)-1); %Define 400 point array

subplot(2,1,1),plot(t,w); %Plot w as a function of t
xlabel('i');
title('Synthetic speech /ee/'); %Set title for plot

%% Autocorrelation Sequence
del_max=10; 

Rw = autocor(w,del_max) %Call and display autocorrelation sequence

subplot(2,1,2),stem(0:del_max,Rw); % Stem plot of Rw
title('Auto-correlation sequence');
xlabel('lag \Delta'); ylabel('Rw(\Delta)'); grid on;    
