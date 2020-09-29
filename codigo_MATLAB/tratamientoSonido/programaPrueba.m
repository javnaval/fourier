%Programa de prueba 
%para familiarizarnos con el tratamiento de Sonido en Matlab
%señal continua considerada : sin(x)

A=1; % Signal amplitude
f=1; % Signal frequency
L = 10000; % Length of signal
t = (0:L-1); % Time vector

%sample rate [Hz] Supported by SoundCard (16000,48000,96000,192000)
Fs = 50000;

transformFourier = fft(signal(t));
transformFourier = transform(transformFourier);

%Play sound
sound(ifft(transformFourier),Fs);

%function
function y = signal(x)
    y = sin(x);
end
%operation made to the fourier transform
function y = transform(x)
    y = x/8;
end