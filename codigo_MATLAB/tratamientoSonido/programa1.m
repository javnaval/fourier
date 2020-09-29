%Aplicación 1 - Tratamiento de una señal de audio de voz -> Invertir un audio%%
close all;
clear all;

%Establecemos la frecuencia de Muestreo : cantidad de muestras que se
%reproducen por segundo
%fs = 11025 (Hz)-> muy baja -> escuchamos un sonido de menor calidad a
%menor fs
fs =  44100;

%Grabación del audio 
% 8 bits, 2 canales (estéreo) o 1
audio = audiorecorder(fs,8,2); 
audio.StartFcn = 'disp("Comienza a hablar. Se está grabando")';
audio.StopFcn = 'disp(''Fin de la grabación.'')';
recordblocking(audio,5);

%Captura de la señal generada
signal = getaudiodata(audio);
audiowrite('audioOriginal.wav',signal ,fs);

%Cálculo de la transformada para obtener las frecuencias de la canción
SIGN = fft(signal);
%Obtenemos info para el plot
t = linspace(0,5, length(signal));
f = linspace(0, fs, length(SIGN));
fase = unwrap(angle(SIGN));
magn = abs(SIGN);


%Plot señal, diagrama de fase y diagrama de frecuencias antes de la
%modificación
figure;
title('Audio de voz sin procesar')
subplot(3,1,1); plot(t,signal);
title('Señal de audio');
ylabel('x');
xlabel('tiempo en s');
subplot(3,1,2); plot(f,fase);
ylabel('Ángulo');
xlabel('frecuencia en Hz');
subplot(3,1,3); plot(f, magn);
ylabel('Magnitud');
xlabel('frecuencia en Hz');

%escuchamos el audio
play(audio)

%frecuencias de cada canal -> se pueden separar
%canal1 = SIGN(:,1);

%canal2 = SIGN(:,2);

%Invertimos el vector SIGN y obtenemos la señal en el dominio original (t)
SIGN = flipud(SIGN);
signal2 = real(ifft(SIGN));

%plot
f2 = linspace(0, fs, length(SIGN));
fase2 = unwrap(angle(SIGN));
magn2 = abs(SIGN);
figure;
title('Audio de voz invertido')
subplot(3,1,1); plot(t,signal2);
title('Señal de audio');
ylabel('x');
xlabel('tiempo en s');
subplot(3,1,2); plot(f2,fase2);
ylabel('Ángulo');
xlabel('frecuencia en Hz');
subplot(3,1,3); plot(f2, magn2);
ylabel('Magnitud');
xlabel('frecuencia en Hz');

%Guardamos el audio invertido
audiowrite('audio2.wav',signal2 ,fs);

fprintf('Pulsa para reproducir el audio en sentido contrario (desde final a principio)\n');
pause;

sound(signal2, fs)