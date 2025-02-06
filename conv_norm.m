clc;clear;close all;  %This code is used for analytical calculations

cry = 3; % 4 - GaAs  7 - ZnSe  2 - ZnTe % 3 - GaP

T = 300;    %K
c = 3e8;    %m/s
lambda0 = 10.6e-6;   %m
N = 4*1e4;    %db
tau = 1.00e-12;  %s
I0 = 80e13;%100/sqrt(tau/100e-15)*1e13;    %GW/cm^2
%I0 = 100e13;
khi_eff =   2*deffTHz(cry);%78.4e-12;%2*65.6e-12;%360e-12; %pm/V;
e0 = 8.854e-12;  %F*m^2
nu0 = 1.0e12;
deltanu = nu0; %1e12;
dz = 0.5e-5;
%z_vegso = 4e-3;
z_vegso = 1.0e-3; %z_ARRAY(ITER);
z = 0:dz:z_vegso;
omega0 = 2*pi*c/lambda0;

elochirp = 0*1*z_vegso/2;

utem = fix(length(z)/40);
if utem == 0
    utem = 1;
end


omegaMAX = 5*2*omega0;%5e14*2*pi;
dt = 2*pi/omegaMAX;
t = (0:N-1)*dt;
t = t-t(end)/2;
domega = omegaMAX/N;
dnu = domega/2/pi;

omega = (0:N-1)*domega;
%nu=omega/2/pi;
nu = linspace(0,5e12,N);
deltaOmega =2*sqrt(2*log(2))/tau;

lambda = 2*pi*c./omega;
lambda(1) = lambda(2);
ngp0 = ngp(lambda0,T,cry);
np0 = neo(lambda0,T,cry);
ngpSH = ngp(lambda0/2,T,cry);
npSH = neo(lambda0/2,T,cry);

nTHz = nTHzo(2*pi*nu0,T,cry);
aTHz = aTHzo(2*pi*nu0,T,cry) * 1e-2;
vfTHz = c./nTHz;

gamma = acos(ngp0/nTHzo(2*pi*nu0,T,cry));
subplot(2,2,1);

plot(lambda,neo(lambda,T,cry));
xlim([(lambda0-1500e-9),lambda0+1500e-9]);
title('Refractive index in infrared');


subplot(2,2,2);

plot(1e-12*nu,nTHzo(2*pi*nu,T,cry));
xlim([0 5]);
title('THz refractive index');

subplot(2,2,3);

plot(1e-12*nu,1e-2*aTHzo(2*pi*nu,T,cry));
xlim([0 5]);
title('THz absorption (1/cm)');


abso = 1e-2*aTHzo(2*pi*nu,T,cry);
nuu = 1e-12*nu;
nTHZ = nTHzo(2*pi*nu,T,cry);
npump= neo(lambda,T,cry);

% Open a file for writing
fileID = fopen('aTHz.txt', 'w');

% Check if file opened successfully
if fileID == -1
    error('Could not open file for writing.');
end

% headers 
fprintf(fileID, 'THz Frequency, THz\taTHz\n');

% Write the data side-by-side
for i = 1:length(nuu)
    fprintf(fileID, '%f\t%f\n', nuu(i), abso(i));
end

% Close the file
fclose(fileID);
disp('Data exported to aTHz.txt');


% Open a file for writing
fileID = fopen('nTHz.txt', 'w');

% Check if file opened successfully
if fileID == -1
    error('Could not open file for writing.');
end

% headers
fprintf(fileID, 'THz Frequency, THz\tnTHz\n');

% Write the data side-by-side
for i = 1:length(nuu)
    fprintf(fileID, '%f\t%f\n', nuu(i), nTHZ(i));
end

% Close the file
fclose(fileID);
disp('Data exported to nTHz.txt');


lambada = linspace(10e-6, 11e-6, 40000);




%FOR n
% Open a file for writing
fileID = fopen('np0.txt', 'w');

% Check if file opened successfully
if fileID == -1
    error('Could not open file for writing.');
end

% Write headers (optional)
fprintf(fileID, 'Wavelength, um\trefractive index\n');

% Write the data side-by-side
for i = 1:length(lambda)
    fprintf(fileID, '%f\t%f\n', lambda(i), npump(i));
end

% Close the file
fclose(fileID);
disp('Data exported to np0.txt');



